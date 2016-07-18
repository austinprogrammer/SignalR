Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Imports testsignalr.SignalR_AHAS
Imports System.Drawing
Imports System.Web.UI.DataVisualization.Charting

Public Class AHAS
    Inherits System.Web.UI.Page
    'Public sArea As String
    'Public sMonth As String
    'Public sDay As String
    'Public sHour As String
    'Protected Chart1 As Chart
    'Protected Label7 As Label

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim intI As Integer
        'get url variables
        Dim sIP As String = Request.UserHostAddress
        Dim sType As String = Request.QueryString("Type")
        Dim sName As String = Request.QueryString("area")

        'create session variables
        Session.Add("Area", Convert.ToString(Request(area.ClientID)))
        Session.Add("Mon", Now.Month) 'Current Month
        Session.Add("TDay", Now.Day) 'Todays number Date
        Session.Add("YDay", (Now.AddDays(-1).Day)) 'Yesterdays number Date
        Session("Area") = sName

        'build hour list
        For intI = 0 To 23
            lstHour.Items.Add(intI)
        Next

        'build month list
        lstMonth.Items.Add("Jan")
        lstMonth.Items.Add("Feb")
        lstMonth.Items.Add("Mar")
        lstMonth.Items.Add("Apr")
        lstMonth.Items.Add("May")
        lstMonth.Items.Add("Jun")
        lstMonth.Items.Add("Jul")
        lstMonth.Items.Add("Aug")
        lstMonth.Items.Add("Sep")
        lstMonth.Items.Add("Oct")
        lstMonth.Items.Add("Nov")
        lstMonth.Items.Add("Dec")

        'build day list
        Dim iDays As Integer = DateTime.DaysInMonth(Now.Year, Now.Month)
        For intI = 1 To iDays
            lstDay.Items.Add(intI)
        Next

        'set selected month, day and hour
        lstMonth.SelectedIndex = Now.Month
        lstDay.SelectedIndex = Now.Day
        lstHour.SelectedIndex = Now.Hour + 1

        'Build area Lists
        Dim ds As New DataSet("list")
        Dim dt As New DataTable
        Dim row As DataRow
        'vr
        ds = GetList("vr")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenVR.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenVR.Value = hiddenVR.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next
        'ir
        ds = GetList("ir")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenIR.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenIR.Value = hiddenIR.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next
        'sr
        ds = GetList("sr")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenSR.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenSR.Value = hiddenSR.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next
        'milair
        ds = GetList("milair")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenMILAIR.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenMILAIR.Value = hiddenMILAIR.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next
        'moa
        ds = GetList("moa")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenMOA.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenMOA.Value = hiddenMOA.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next
        'range
        ds = GetList("range")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenRANGE.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenRANGE.Value = hiddenRANGE.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next
        'AA
        ds = GetList("aa")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenAA.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenAA.Value = hiddenAA.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next

        'UNIT
        ds = GetList("unit")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenUNIT.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenUNIT.Value = hiddenUNIT.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next

        'UNIT
        ds = GetList("unit2")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenUNIT2.Value = dt.Rows(intI)("Route").ToString
            Else
                hiddenUNIT2.Value = hiddenUNIT2.Value & "*" & dt.Rows(intI)("Route").ToString
            End If
            intI = intI + 1
        Next

        'ICAO
        ds = GetList("icao")
        dt = ds.Tables(0)
        intI = 0
        For Each row In dt.Rows()
            If intI = 0 Then
                hiddenICAO1.Value = dt.Rows(intI)("ICAO").ToString
                hiddenICAO2.Value = dt.Rows(intI)("AirField").ToString
            Else
                hiddenICAO1.Value = hiddenICAO1.Value & "*" & dt.Rows(intI)("ICAO").ToString
                hiddenICAO2.Value = hiddenICAO2.Value & "*" & dt.Rows(intI)("AirField").ToString
            End If
            intI = intI + 1
        Next

        'set type radio button
        If sType <> "" Then
            Select Case sType
                Case Is = "VR"
                    RadioButtonList2.Items(0).Selected = True
                Case Is = "IR"
                    RadioButtonList2.Items(1).Selected = True
                Case Is = "SR"
                    RadioButtonList2.Items(2).Selected = True
                Case Is = "MilAir"
                    RadioButtonList2.Items(3).Selected = True
                Case Is = "ICAO"
                    RadioButtonList2.Items(4).Selected = True
                Case Is = "MOA"
                    RadioButtonList2.Items(5).Selected = True
                Case Is = "Range"
                    RadioButtonList2.Items(6).Selected = True
                Case Is = "AA"
                    RadioButtonList2.Items(7).Selected = True
                Case Is = "Unit"
                    RadioButtonList2.Items(8).Selected = True
                Case Is = "Unit2"
                    RadioButtonList2.Items(9).Selected = True
            End Select
        Else
            RadioButtonList2.Items(0).Selected = True
            sType = "VR"
        End If

        hiddenType.Value = sType

        If sName = "" Then
            hiddenID.Value = "VR025"
        Else
            hiddenID.Value = sName
        End If

    End Sub

    Private Sub area_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles area.SelectedIndexChanged
        'This catches the selected value from the dropdownlist
        'sArea = area.SelectedValue.ToString
        'Chart1.Visible = "False"

        Session("Area") = area.SelectedValue
    End Sub

    Private Sub month_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstMonth.SelectedIndexChanged
        hiddenM.Value = lstMonth.SelectedIndex + 1
        Session("Mon") = lstMonth.SelectedIndex + 1
    End Sub

    Private Sub day_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstDay.SelectedIndexChanged
        Dim RDate As String = Now.Year & "-" & lstMonth.SelectedValue & "-" & lstDay.SelectedValue
        Dim dt1 As DateTime
        dt1 = DateTime.Parse(RDate)

        hiddenD.Value = lstDay.SelectedValue
        Session("TDay") = lstDay.SelectedValue
        Session("YDay") = dt1.AddDays(-1).Day
    End Sub

    Private Function GetList(ByVal Type As String) As DataSet
        Dim dsList As New DataSet("LIST")
        Dim strSQL As String = "Execute spLIST '" & Type & "'"

        dsList = GetDataSetList(strSQL)
        Return dsList

    End Function

    Private Function GetDataSetList(ByVal strSQL As String) As DataSet
        '1. Create a connection
        Dim ConnectionString As String = ";Persist Security Info=False;Integrated Security=true;Data Source=Sparky;Initial Catalog=NEWSMA;"

        Dim myConnection As New SqlConnection(ConnectionString)

        '2. Create the command object, passing in the SQL string 
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        myCommand.CommandTimeout = 0

        myConnection.Open()

        '3. Create the DataAdapter
        Dim myDataAdapter As New SqlDataAdapter()
        myDataAdapter.SelectCommand = myCommand


        '4. Populate the DataSet and close the connection
        Dim myDataSet As New DataSet()
        myDataAdapter.Fill(myDataSet)
        myConnection.Close()

        'Return the DataSet
        Return myDataSet
    End Function

    Protected Sub btnShowChart_Click(sender As System.Object, e As System.EventArgs) Handles btnShowChart.Click
        ShowChartData()
    End Sub

    Private Sub ShowChartData()
        Dim sReqDate As Date = DateTime.Parse(Now.Year & "-" & lstMonth.SelectedValue & "-" & lstDay.SelectedValue)
        Dim sYDate As Date = sReqDate.AddDays(-1)
        Session("Area") = Convert.ToString(Request(area.ClientID))

        'This brings up the chart box
        Chart1.Visible = "True"
        Chart1.Titles.Add("NEXRAD Risk for " & Session("Area")) '& Session("Mon") & Session("TDay") & Session("YDay"))  'title of chart
        Label1.Text = "Previous Day= " & MonthName(sYDate.Month, True) & " " & sYDate.Day & ", " & "Selected Day= " & MonthName(sReqDate.Month, True) & " " & sReqDate.Day

    End Sub

End Class