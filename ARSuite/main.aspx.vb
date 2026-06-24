Imports System.IO
Imports System.Net
Imports System.Security.Claims
Imports System.Security.Cryptography
Imports System.Net.NetworkInformation

Public Class main
    Inherits System.Web.UI.Page
    Dim obj As New Negocio.NSuite

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not IsPostBack Then

                If Session("URL_SISTEMA") IsNot Nothing AndAlso
                 Not String.IsNullOrWhiteSpace(Session("URL_SISTEMA").ToString()) Then

                    ' bYPASEA EL SISTEMA - El parametro URL_SISTEMA se capturo desde el LOGIN
                    Dim url_sistema As String = Session("URL_SISTEMA").ToString()
                    Ingreso_Bypass_sistema(url_sistema)
                    Session.Remove("URL_SISTEMA") 'Cargara el sistema ya abierto y la main de la suite

                Else
                    'Proceso Normal de ingreso a a SUITE

                    Dim usuario As String = String.Empty
                    Inicio_bloquear_candado()

                    If Session("user") IsNot Nothing Then 'No existe. O no se logueo.
                        usuario = Session("user")
                        lnkIniciarSesion.Text = usuario
                        lblUsuarioLogueado.Text = usuario
                        spUsuario.Visible = True
                        Habilitar_Acceso_Sistemas(usuario)
                        Mostrar_botones_sistemas(Session("tipo_usuario").ToString()) 'Mostrar u ocultar botones dependiendo del tipo de usuario


                    End If

                End If


            End If
        Catch ex As Exception
            If (Session("user") Is Nothing) Then
                Response.Redirect("~/login.aspx")
            End If
        End Try


    End Sub
    Public Sub Ingreso_Bypass_sistema(ByVal urlBase As String)
        If urlBase.IndexOf("ARECETAS", StringComparison.OrdinalIgnoreCase) >= 0 Then
            btnARECETAS_Click(Nothing, Nothing)
            Exit Sub
        End If

        If urlBase.IndexOf("ARECLAMO", StringComparison.OrdinalIgnoreCase) >= 0 Then
            btnARECLAMOS_Click(Nothing, Nothing)
        End If

        If urlBase.IndexOf("ARMANTO", StringComparison.OrdinalIgnoreCase) >= 0 Then
            btnARMANTO_Click(Nothing, Nothing)
        End If

        If urlBase.IndexOf("ARINVENTA", StringComparison.OrdinalIgnoreCase) >= 0 Then
            btnARINVENTA_Click(Nothing, Nothing)
        End If

        If urlBase.IndexOf("ARSANCION", StringComparison.OrdinalIgnoreCase) >= 0 Then
            btnARCONDUCTA_Click(Nothing, Nothing)
        End If

    End Sub
    Public Sub Mostrar_botones_sistemas(ByVal tipo_usuario As String)

        If tipo_usuario = "1" Then 'Usuario Interno
            btnARPROVEEDORES.Visible = True
            btnARREGISTRODEPROVEDORES.Visible = True
            btnARCOCINA.Visible = True
            btnINFORASH.Visible = True
            btnARECETAS.Visible = True
            btnARECLAMOS.Visible = True
            btnARCONDUCTA.Visible = True
            btnARMAESTROS.Visible = True
            btnARINVENTA.Visible = True
            btnARMANTO.Visible = True
            btnARSORPRENDE.Visible = True
            btnARADMINUSUARIOS.Visible = True
            btnARCOCINA.Visible = False
        End If

        If tipo_usuario = "2" Then 'Usuario Externo

            btnARPROVEEDORES.Visible = True
            btnARREGISTRODEPROVEDORES.Visible = True
            btnARMANTO.Visible = True

            btnARCOCINA.Visible = False
            btnINFORASH.Visible = False
            btnARECETAS.Visible = False
            btnARECLAMOS.Visible = False
            btnARCONDUCTA.Visible = False
            btnARMAESTROS.Visible = False
            btnARINVENTA.Visible = False
            btnARSORPRENDE.Visible = False
            btnARADMINUSUARIOS.Visible = False
        End If
    End Sub

    Public Sub Inicio_bloquear_candado()

        'SISTEMAN QUE REQUIEREN LOGIN - Habilitar candado
        'Bloqueamos todos los accesos 

        'Sistema ARECETAS
        divCandadoARECETAS.Visible = True   'Mostrar
        btnARECETAS.OnClientClick = "return false;"
        btnARECETAS.Style("cursor") = "not-allowed"

        'Sistema ARECLAMOS
        divCandadoARECLAMOS.Visible = True
        btnARECLAMOS.OnClientClick = "return false;"
        btnARECLAMOS.Style("cursor") = "not-allowed"

        'Sistema ARCONDUCTA
        divCandadoARCONDUCTA.Visible = True
        btnARCONDUCTA.OnClientClick = "return false;"
        btnARCONDUCTA.Style("cursor") = "not-allowed"

        'Sistema ARMAESTROS
        divCandadoARMAESTROS.Visible = True
        btnARMAESTROS.OnClientClick = "return false;"
        btnARMAESTROS.Style("cursor") = "not-allowed"

        'Sistema ARINVENTA
        divCandadoARINVENTA.Visible = True
        btnARINVENTA.OnClientClick = "return false;"
        btnARINVENTA.Style("cursor") = "not-allowed"

        'Sistema ARMANTO
        divCandadoARMANTO.Visible = True
        btnARMANTO.OnClientClick = "return false;"
        btnARMANTO.Style("cursor") = "not-allowed"

        'Sistema ARSORPRENDE
        divCandadoARSORPRENDE.Visible = True
        btnARSORPRENDE.OnClientClick = "return false;"
        btnARSORPRENDE.Style("cursor") = "not-allowed"

        'Sistema ARADMINUSUARIOS
        divCandadoARDMINUSUARIOS.Visible = True
        btnARADMINUSUARIOS.OnClientClick = "return false;"
        btnARADMINUSUARIOS.Style("cursor") = "not-allowed"




        'SIEMPRE ESTAN ACTIVOS - Deshabilitar candado

        'Sistema ARPROVEEDORES

        divCandadoARPROVEEDORES.InnerHtml = "<i class='fas fa-lock-open'></i>"
        btnARPROVEEDORES.OnClientClick = ""
        btnARPROVEEDORES.CssClass = "card2"
        btnARPROVEEDORES.Style("cursor") = "pointer"


        'Sistema ARREGISTRO PROVEEDORES
        divCandadoARREGISTRODEPROVEEDORES.InnerHtml = "<i class='fas fa-lock-open'></i>"
        btnARREGISTRODEPROVEDORES.OnClientClick = ""
        btnARREGISTRODEPROVEDORES.CssClass = "card2"
        btnARREGISTRODEPROVEDORES.Style("cursor") = "pointer"

        'Sistema ARCOCINA
        divCandadoARCOCINA.InnerHtml = "<i class='fas fa-lock-open'></i>"

        'Sistema INFORASH
        divCandadoINFORASH.InnerHtml = "<i class='fas fa-lock-open'></i>"
        btnINFORASH.OnClientClick = ""
        btnINFORASH.CssClass = "card2"
        btnINFORASH.Style("cursor") = "pointer"

        'Boton LogOut Oculto
        lnkCerrarSesion.Visible = False
        spUsuario.Visible = False
    End Sub
    Public Sub Habilitar_Acceso_Sistemas(ByVal usuario As String)
        Dim dt_sistemas As DataTable = Session("dt_sistemas")

        For Each row As DataRow In dt_sistemas.Rows

            If row(4).ToString() = "ARRCT" Then
                'Sistema ARECETAS
                divCandadoARECETAS.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARECETAS.OnClientClick = ""
                btnARECETAS.CssClass = "card2"
                btnARECETAS.Style("cursor") = "pointer"

            End If

            If row(4).ToString() = "ARRCL" Then
                'Sistema ARECLAMOS
                divCandadoARECLAMOS.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARECLAMOS.OnClientClick = ""
                btnARECLAMOS.CssClass = "card2"
                btnARECLAMOS.Style("cursor") = "pointer"
            End If

            If row(4).ToString() = "ARCND" Then
                'Sistema ARCONDUCTA
                divCandadoARCONDUCTA.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARCONDUCTA.OnClientClick = ""
                btnARCONDUCTA.CssClass = "card2"
                btnARCONDUCTA.Style("cursor") = "pointer"
            End If

            If row(4).ToString() = "ARMST" Then 'Aun no está integrado
                'Sistema ARMAESTROS
                divCandadoARMAESTROS.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARMAESTROS.CssClass = "card2"
                btnARMAESTROS.OnClientClick = ""
                btnARMAESTROS.Style("cursor") = "pointer"
            End If

            If row(4).ToString() = "ARINV" Then
                'Sistema ARINVENTA
                divCandadoARINVENTA.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARINVENTA.CssClass = "card2"
                btnARINVENTA.OnClientClick = ""
                btnARINVENTA.Style("cursor") = "pointer"
            End If

            If row(4).ToString() = "ARMAN" Then
                'Sistema ARMANTO
                divCandadoARMANTO.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARMANTO.OnClientClick = ""
                btnARMANTO.CssClass = "card2"
                btnARMANTO.Style("cursor") = "pointer"
            End If

            If row(4).ToString() = "ARSPR" Then
                'Sistema ARSOPRENDE
                divCandadoARSORPRENDE.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARSORPRENDE.CssClass = "card2"
                btnARSORPRENDE.Style("cursor") = "pointer"
            End If

            If row(4).ToString() = "ARADU" Then 'Aun no está integrado
                'Sistema ADMINISTRADOR DE USUARIOS
                divCandadoARDMINUSUARIOS.InnerHtml = "<i class='fas fa-lock-open'></i>"
                btnARADMINUSUARIOS.CssClass = "card2"
                btnARADMINUSUARIOS.OnClientClick = ""
                btnARADMINUSUARIOS.Style("cursor") = "pointer"
            End If

        Next


        lnkCerrarSesion.Visible = True
        lnkIniciarSesion.Visible = False


        'Deshabilitar
        btnARCOCINA.Visible = False
    End Sub


    Private Function Encriptar(texto As String) As String

        Dim clave As String = "ACURIO2026SUPERKEY"

        Dim aes As New AesManaged()

        Dim pdb As New Rfc2898DeriveBytes(
        clave,
        New Byte() {
            &H49, &H76, &H61, &H6E,
            &H20, &H4D, &H65, &H64,
            &H76, &H65, &H64, &H65,
            &H76
        })

        aes.Key = pdb.GetBytes(32)
        aes.IV = pdb.GetBytes(16)

        Dim ms As New MemoryStream()

        Dim cs As New CryptoStream(
        ms,
        aes.CreateEncryptor(),
        CryptoStreamMode.Write)

        'IMPORTANTE -> UTF8
        Dim bytes As Byte() =
        Encoding.UTF8.GetBytes(texto)

        cs.Write(bytes, 0, bytes.Length)

        cs.Close()

        Return Convert.ToBase64String(ms.ToArray())

    End Function



    Protected Sub lnkIniciarSesion_Click(sender As Object, e As EventArgs) Handles lnkIniciarSesion.Click
        Response.Redirect("~/Login.aspx")
    End Sub

    Protected Sub btnARECETAS_Click(sender As Object, e As EventArgs) Handles btnARECETAS.Click

        Dim resultado As Boolean
        resultado = CargarActivacionGeneral()

        If resultado Then

            Dim usuario As String = Session("user").ToString()
            Dim clave As String = Session("clave").ToString()

            Dim datos As String = usuario & "|" & clave
            Dim token As String = Encriptar(datos)

            Dim tokenGlobal As String =
                Session("ACTIVACION_GENERAL").ToString()

            Dim urlARrecetas As String =
                ConfigurationManager.AppSettings("ARrecetas")

            Dim url As String =
                urlARrecetas &
                "/?t=" & Server.UrlEncode(token) &
                "&tg=" & Server.UrlEncode(tokenGlobal)

            Dim script As String =
            "
        window.open('" & url & "', '_blank');
        window.location='main.aspx';
        "

            ScriptManager.RegisterStartupScript(
                Me,
                Me.GetType(),
                "AbrirARrecetas",
                script,
                True)
        Else
            lnkCerrarSesion_Click(sender, e)
        End If


    End Sub

    Public Function CargarActivacionGeneral() As Boolean


        Dim token As String = String.Empty
        Dim ds As New DataSet
        If Session("ACTIVACION_GENERAL") IsNot Nothing Then
            token = Session("ACTIVACION_GENERAL").ToString()

            ds = obj.ExisteTokenActivo(token)
            If ds.Tables(0).Rows.Count > 0 Then
                Return True
            Else
                Response.Redirect("~/main.aspx", False)
                Return False
            End If
        Else
            Response.Redirect("~/main.aspx")
            Return False
        End If


    End Function

    Protected Sub lnkCerrarSesion_Click(sender As Object, e As EventArgs) Handles lnkCerrarSesion.Click
        '================ PROCESO COOKIE =================
        CerrarSesion_ActivacionGeneral()

        Dim cogeCookie = Request.Cookies.Get("appNameAuth")
        If Not cogeCookie Is Nothing Then
            Request.Cookies.Remove("appNameAuth")
        End If

        FormsAuthentication.SignOut() 'ahora si cierras session!!!
        Session.Abandon()
        Session.Clear()
        Response.Redirect("main.aspx")

    End Sub
    Public Sub CerrarSesion_ActivacionGeneral()

        obj.CerrarSesionGlobal(Session("ACTIVACION_GENERAL").ToString())

    End Sub

    Protected Sub btnARECLAMOS_Click(sender As Object, e As EventArgs) Handles btnARECLAMOS.Click

        Dim resultado As Boolean
        resultado = CargarActivacionGeneral()

        If resultado Then

            Dim usuario As String = Session("user").ToString()
            Dim clave As String = Session("clave").ToString()

            Dim datos As String = usuario & "|" & clave
            Dim token As String = Encriptar(datos)

            Dim tokenGlobal As String =
                Session("ACTIVACION_GENERAL").ToString()

            Dim urlARrecetas As String =
                ConfigurationManager.AppSettings("ARreclamos")

            Dim url As String =
                urlARrecetas &
                "/?t=" & Server.UrlEncode(token) &
                "&tg=" & Server.UrlEncode(tokenGlobal)

            Dim script As String =
            "
        window.open('" & url & "', '_blank');
        window.location='main.aspx';
        "

            ScriptManager.RegisterStartupScript(
                Me,
                Me.GetType(),
                "AbrirARreclamos",
                script,
                True)
        Else
            lnkCerrarSesion_Click(sender, e)
        End If


    End Sub

    Private Function ValidarPing(ip As String) As Boolean

        Try

            Using ping As New Ping()

                Dim respuesta As PingReply =
                    ping.Send(ip, 3000)

                Return respuesta.Status = IPStatus.Success

            End Using

        Catch ex As Exception

            Return False

        End Try

    End Function

    Protected Sub btnARMANTO_Click(sender As Object, e As EventArgs) Handles btnARMANTO.Click
        Dim resultado As Boolean
        resultado = CargarActivacionGeneral()

        If resultado Then

            Dim usuario As String = Session("user").ToString()
            Dim clave As String = Session("clave").ToString()

            Dim datos As String = usuario & "|" & clave
            Dim token As String = Encriptar(datos)

            Dim tokenGlobal As String =
                Session("ACTIVACION_GENERAL").ToString()

            Dim urlARrecetas As String =
                ConfigurationManager.AppSettings("ARmanto")

            Dim url As String =
                urlARrecetas &
                "/?t=" & Server.UrlEncode(token) &
                "&tg=" & Server.UrlEncode(tokenGlobal)

            Dim script As String =
            "
        window.open('" & url & "', '_blank');
        window.location='main.aspx';
        "

            ScriptManager.RegisterStartupScript(
                Me,
                Me.GetType(),
                "AbrirARmanto",
                script,
                True)
        Else
            lnkCerrarSesion_Click(sender, e)
        End If

    End Sub

    Protected Sub btnARPROVEEDORES_Click(sender As Object, e As EventArgs) Handles btnARPROVEEDORES.Click

        Dim urlARWebProveedores As String = ConfigurationManager.AppSettings("ARWebProveedores")


        Dim script As String =
        "window.open('" & urlARWebProveedores & "','_blank');" &
        "window.location='main.aspx';"

        ScriptManager.RegisterStartupScript(
        Me,
        Me.GetType(),
        "AbrirARProveedores",
        script,
        True)



    End Sub

    Protected Sub btnARREGISTRODEPROVEDORES_Click(sender As Object, e As EventArgs) Handles btnARREGISTRODEPROVEDORES.Click

        Dim urlARRegistroProveedores As String = ConfigurationManager.AppSettings("ARRegistroProveedores")


        Dim script As String =
        "window.open('" & urlARRegistroProveedores & "','_blank');" &
        "window.location='main.aspx';"

        ScriptManager.RegisterStartupScript(
        Me,
        Me.GetType(),
        "AbrirARRegistroProveedores",
        script,
        True)
    End Sub

    Protected Sub btnINFORASH_Click(sender As Object, e As EventArgs) Handles btnINFORASH.Click
        Dim urlARInfoRush As String = ConfigurationManager.AppSettings("ARInfoRush")


        Dim script As String =
        "window.open('" & urlARInfoRush & "','_blank');" &
        "window.location='main.aspx';"

        ScriptManager.RegisterStartupScript(
        Me,
        Me.GetType(),
        "AbrirARInfoRush",
        script,
        True)
    End Sub

    Private Sub btnARCONDUCTA_Click(sender As Object, e As EventArgs) Handles btnARCONDUCTA.Click
        Dim resultado As Boolean
        resultado = CargarActivacionGeneral()

        If resultado Then

            Dim usuario As String = Session("user").ToString()
            Dim clave As String = Session("clave").ToString()

            Dim datos As String = usuario & "|" & clave
            Dim token As String = Encriptar(datos)

            Dim tokenGlobal As String =
                Session("ACTIVACION_GENERAL").ToString()

            Dim urlARrecetas As String =
                ConfigurationManager.AppSettings("ARconducta")

            Dim url As String =
                urlARrecetas &
                "/?t=" & Server.UrlEncode(token) &
                "&tg=" & Server.UrlEncode(tokenGlobal)

            Dim script As String =
            "
        window.open('" & url & "', '_blank');
        window.location='main.aspx';
        "

            ScriptManager.RegisterStartupScript(
                Me,
                Me.GetType(),
                "AbrirARconducta",
                script,
                True)
        Else
            lnkCerrarSesion_Click(sender, e)
        End If
    End Sub

    Protected Sub btnARINVENTA_Click(sender As Object, e As EventArgs) Handles btnARINVENTA.Click
        Dim resultado As Boolean
        resultado = CargarActivacionGeneral()

        If resultado Then

            Dim usuario As String = Session("user").ToString()
            Dim clave As String = Session("clave").ToString()

            Dim datos As String = usuario & "|" & clave
            Dim token As String = Encriptar(datos)

            Dim tokenGlobal As String =
                Session("ACTIVACION_GENERAL").ToString()

            Dim urlARrecetas As String =
                ConfigurationManager.AppSettings("ARInventa")

            Dim url As String =
                urlARrecetas &
                "/?t=" & Server.UrlEncode(token) &
                "&tg=" & Server.UrlEncode(tokenGlobal)

            Dim script As String =
            "
        window.open('" & url & "', '_blank');
        window.location='main.aspx';
        "

            ScriptManager.RegisterStartupScript(
                Me,
                Me.GetType(),
                "AbrirARinventa",
                script,
                True)
        Else
            lnkCerrarSesion_Click(sender, e)
        End If
    End Sub

    Private Sub btnARCOCINA_Click(sender As Object, e As EventArgs) Handles btnARCOCINA.Click
        'Dim resultado As Boolean
        'resultado = CargarActivacionGeneral()

        'If resultado = False Then


        '    lnkCerrarSesion_Click(sender, e)
        'End If
    End Sub
End Class