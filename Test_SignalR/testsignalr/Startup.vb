Imports System.Threading.Tasks
Imports Microsoft.Owin
Imports Microsoft.Owin.Security
Imports Owin

<Assembly: OwinStartup(GetType(SignalR_AHAS.Startup))> 

Namespace SignalR_AHAS
    Public Class Startup
        Public Sub Configuration(app As IAppBuilder)
            app.MapSignalR()
        End Sub
    End Class
End Namespace