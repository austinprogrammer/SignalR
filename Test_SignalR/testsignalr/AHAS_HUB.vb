Imports Microsoft.AspNet.SignalR
Imports System.Data.SqlClient
Imports System.IO

Public Class AhasHub
    Inherits Hub
    Public Shared users As New List(Of String)()
    Private bFirst As Boolean = True

    Public Overrides Function OnReconnected() As System.Threading.Tasks.Task
        Dim clientId As String = GetClientId()
        If users.IndexOf(clientId) = -1 Then
            users.Add(clientId)
        End If

        ShowUsersOnLine()

        Return MyBase.OnReconnected()
    End Function

    Public Overrides Function OnDisconnected(stopCalled As Boolean) As System.Threading.Tasks.Task
        Dim clientId As String = GetClientId()

        If users.IndexOf(clientId) > -1 Then
            users.Remove(clientId)
        End If

        ShowUsersOnLine()

        Return MyBase.OnDisconnected(stopCalled)
    End Function

    Public Sub Log(message As String)
        Clients.All.log(message)
    End Sub

    Public Sub ShowUsersOnLine()
        Clients.All.showUsersOnLine(users.Count)

        If users.Count = 0 Then
            bFirst = True
        End If
    End Sub

    'Public Sub ShowUsersAgain()
    '    Try
    '        Dim conStr As String = ConfigurationManager.ConnectionStrings("AHASdb").ConnectionString
    '        Dim message As String = String.Empty
    '        Dim clientId As String = GetClientId()

    '        If users.IndexOf(clientId) = -1 Then
    '            users.Add(clientId)
    '        End If

    '        'only do this if it is the first client?
    '        'then there should only be one sql dependency
    '        If users.Count = 1 Then
    '            'I think, I only need to run this for the first client.  If there are more than 1 clients do not run this.
    '            'so I need to know how many clients there are.
    '            Try
    '                Using connection As New SqlConnection(conStr)
    '                    Dim query As String = "SELECT [Min] FROM [dbo].[NowRisk] Where Segment = 'VR954N-AO'"
    '                    'WriteErrorLog("connected")
    '                    Using command As New SqlCommand(query, connection)
    '                        command.Notification = Nothing
    '                        'this is where the change dependancy is set.
    '                        'so only if a change to this table is made will it fire.
    '                        Dim dependency As New SqlDependency(command)
    '                        AddHandler dependency.OnChange, AddressOf dependency_OnChange
    '                        'dependency.OnChange += New OnChangeEventHandler(AddressOf dependency_OnChange)
    '                        connection.Open()
    '                        'WriteErrorLog("commanded")
    '                        SqlDependency.Start(conStr)
    '                        'WriteErrorLog("started")
    '                        Dim reader As SqlDataReader = command.ExecuteReader()

    '                        If reader.HasRows Then
    '                            'USE A WCF SERVICE, WCF must be done on the client side
    '                            While reader.Read
    '                                message = reader.Item("Min")
    '                            End While
    '                        End If
    '                    End Using
    '                End Using
    '                'Client_Alert("Send is Good for " & clientId)
    '            Catch ex As Exception
    '                'Client_Alert("ERROR " & ex.Message)
    '                'WriteErrorLog(ex.Message)
    '            End Try
    '        End If
    '        Clients.All.showUsersAgain("success")
    '    Catch ex As Exception
    '        Clients.All.showUsersAgain(ex.Message.ToString)
    '    End Try
    'End Sub

    Public Sub Send()
        'WriteErrorLog("SubSendStarted")

        'this is executed everytime a new user joins the hub
        Dim conStr As String = ConfigurationManager.ConnectionStrings("AHASdb").ConnectionString
        Dim message As String = String.Empty
        Dim clientId As String = GetClientId()

        If users.IndexOf(clientId) = -1 Then
            users.Add(clientId)
        End If

        'only do this if it is the first client?
        'then there should only be one sql dependency

        'If users.Count = 1 Then
        If bFirst = True Then
            'I think, I only need to run this for the first client.  If there are more than 1 clients do not run this.
            'so I need to know how many clients there are.
            Try
                Using connection As New SqlConnection(conStr)
                    Dim query As String = "SELECT [Min] FROM [dbo].[NowRisk] Where Segment = 'VR954N-AO'"
                    Using command As New SqlCommand(query, connection)
                        command.Notification = Nothing
                        'this is where the change dependancy is set.
                        'so only if a change to this table is made will it fire.
                        Dim dependency As New SqlDependency(command)
                        AddHandler dependency.OnChange, AddressOf dependency_OnChange
                        'dependency.OnChange += New OnChangeEventHandler(AddressOf dependency_OnChange)
                        connection.Open()
                        SqlDependency.Start(conStr)
                        Dim reader As SqlDataReader = command.ExecuteReader()

                        If reader.HasRows Then
                            'USE A WCF SERVICE, WCF must be done on the client side
                            While reader.Read
                                message = reader.Item("Min")
                            End While
                        End If
                    End Using
                End Using
                'Client_Alert("Send is Good for " & clientId)
            Catch ex As Exception
                'Client_Alert("ERROR " & ex.Message)
            End Try
            bFirst = False
        End If


        'just testing
        'Clients.All.broadcastMessage(Context.ConnectionId, "send" & message)
        ShowUsersOnLine()
        'ShowUsersAgain()

        'this works to send all and maintains the connection id.
        'I don't want to send the message when the connectionn is first made
        'I only want to send the message when the data changes.
        'Clients.All.broadcastMessage(Context.ConnectionId, message)

    End Sub

    Public Sub Client_Alert(ByVal sMessage As String, Optional ByVal sURL As String = "")
        On Error Resume Next
        Dim str As String
        Dim P As System.Web.UI.Page = CType(System.Web.HttpContext.Current.Handler, System.Web.UI.Page)
        Dim sb As New StringBuilder(Len(sMessage) * 5)
        sMessage = sMessage.Replace(Chr(0), "")
        For Each c As String In sMessage : sb.Append("\x" & Right("0" & Hex(Asc(c)), 2)) : Next
        str = vbCrLf & "<script language=javascript>" & vbCrLf
        str = str & "    alert('" & sb.ToString & "');" & vbCrLf
        If Len(sURL) > 0 Then str = str & "    window.location='" & sURL & "';" & vbCrLf
        str = str & "</script>" & vbCrLf
        P.ClientScript.RegisterStartupScript(P.GetType, "", str)
    End Sub

    Private Sub dependency_OnChange(sender As Object, e As SqlNotificationEventArgs)
        If e.Type = SqlNotificationType.Change Then
            Update()
            Client_Alert("Change")
        End If
    End Sub

    Public Sub Update()
        'This sub runs whenever the sql dependency changes
        Dim conStr As String = ConfigurationManager.ConnectionStrings("AHASdb").ConnectionString
        Dim message As String = String.Empty

        Try
            Using connection As New SqlConnection(conStr)
                'use a segment from the last region/layer that is updated.  In this case it is VRSW07
                Dim query As String = "SELECT [Min] FROM [dbo].[NowRisk] Where Segment = 'VR954N-AO'"

                Using command As New SqlCommand(query, connection)
                    command.Notification = Nothing
                    'this is where the change dependancy is set.
                    'so only if a change to this table is made will it fire.
                    Dim dependency As New SqlDependency(command)
                    AddHandler dependency.OnChange, AddressOf dependency_OnChange
                    'dependency.OnChange += New OnChangeEventHandler(AddressOf dependency_OnChange)
                    connection.Open()
                    SqlDependency.Start(conStr)
                    Dim reader As SqlDataReader = command.ExecuteReader()

                    If reader.HasRows Then
                        'USE A WCF SERVICE, WCF must be done on the client sidevr025
                        While reader.Read
                            message = reader.Item("Min")
                            'message = get_wcf_string("VR025")
                        End While
                    End If
                End Using
            End Using

            'this works to send all and maintains the connection id.
            Clients.All.broadcastMessage(Context.ConnectionId, "update" & message)
            'Client_Alert("Update is Good")

        Catch ex As Exception
            'Client_Alert("ERROR " & ex.Message)
        End Try

    End Sub

    Private Function GetClientId() As String
        Dim clientId As String = ""
        If Not (Context.QueryString("clientId") Is Nothing) Then
            'clientId passed from application 
            clientId = Context.QueryString("clientId").ToString()
        End If

        If clientId.Trim() = "" Then
            'default clientId: connectionId 
            clientId = Context.ConnectionId
        End If
        Return clientId

    End Function

    'Public Sub WriteErrorLog(ByVal strError As String)
    '    Try
    '        Dim fs As FileStream = New FileStream("D:\temp\error.txt", FileMode.Append, System.IO.FileAccess.Write, FileShare.ReadWrite)
    '        Dim oWriteLog As StreamWriter = New StreamWriter(fs)

    '        oWriteLog.WriteLine(strError)
    '        oWriteLog.Close()
    '        fs.Close()
    '        fs.Dispose()
    '        oWriteLog.Dispose()
    '    Catch ex As Exception

    '    End Try


    'End Sub

    'Private Function get_wcf_string(sArea As String) As String
    '    'Dim sArea As String = "vr025"
    '    Dim sMonth As String = DateTime.Now.Month.ToString()
    '    Dim sDay As String = DateTime.Now.Day.ToString()
    '    Dim sHour As String = DateTime.Now.Hour.ToString()

    '    Dim client As Service1Client = New Service1Client
    '    Dim message As String = client.GetAHASRisk(sArea, sMonth, sDay, sHour)

    '    Return message

    'End Function

End Class
