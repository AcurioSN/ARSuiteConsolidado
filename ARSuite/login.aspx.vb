Imports System.DirectoryServices
Imports System.Net
Imports System.Web
Imports System.Web.Security
Imports System.Web.Services.Description
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports Negocio

Public Class login
    Inherits System.Web.UI.Page
    Dim obj As New Negocio.NSuite
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not Page.IsPostBack Then
                captura_URL_Sistema_acceso_directo() 'Cuando usuario Acurio2 Ingresará por la URL o máscara de un sistema. / Session("URL_SISTEMA")
            End If
        Catch ex As Exception
            If (Session("user") Is Nothing) Then
                Response.Redirect("~/login.aspx")
            End If
        End Try
    End Sub
    'Public Function IsAuthenticated(ByVal Domain As String, ByVal username As String, ByVal pwd As String) As Boolean
    '    Dim Success As Boolean = False
    '    Dim Entry As New System.DirectoryServices.DirectoryEntry("LDAP://" & Domain, username, pwd)
    '    Dim Searcher As New System.DirectoryServices.DirectorySearcher(Entry)
    '    Searcher.SearchScope = DirectoryServices.SearchScope.OneLevel
    '    Try
    '        Dim Results As System.DirectoryServices.SearchResult = Searcher.FindOne
    '        Success = Not (Results Is Nothing)
    '    Catch
    '        Success = False
    '    End Try
    '    Return Success
    'End Function

    Public Function IsAuthenticated(ByVal Domain As String,
                                ByVal username As String,
                                ByVal pwd As String) As Boolean

        Dim Success As Boolean = False

        Try

            Dim Entry As New DirectoryServices.DirectoryEntry(
            "LDAP://" & Domain,
            username,
            pwd)

            Dim Searcher As New DirectoryServices.DirectorySearcher(Entry)

            Searcher.SearchScope = SearchScope.OneLevel

            Dim Results As SearchResult = Searcher.FindOne()

            Success = Not (Results Is Nothing)

        Catch ex As Exception

            Session("ERROR_AD") = ex.Message

            Success = False

        End Try

        Return Success

    End Function

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Try
            Dim user As String
            Dim pwd As String
            Dim ds As New DataSet
            Dim dsUnidades As New DataSet

            user = txtUsuario.Text.ToString()
            pwd = txtPassword.Text.ToString()

            '------------------reCaptcha-------------------
            Dim result As String
            Dim success As Boolean

            'Dim respuestaRecaptcha As String = Request.Form("g-recaptcha-response")
            'Dim secretKey As String = Session("clave_secreta")
            'Dim client As New WebClient()

            'Dim result As String = client.DownloadString($"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={respuestaRecaptcha}")

            'Dim jsonResult As JObject = JObject.Parse(result)
            'Dim success As Boolean = jsonResult.Value(Of Boolean)("success")

            Dim can As Integer
            Dim usuario As String
            Dim clave As String
            Dim tipo_usuario As String = ""
            Dim id_usuario As String
            Dim id_perfil As Integer
            Dim resultado As Boolean

            Dim i As Integer = 6
            usuario = user
            clave = pwd


            'Validar en Tabla - Administrador de Usuarios
            ds = obj.validar_acceso(user, clave)
            can = ds.Tables(0).Rows.Count

            'Tipo de Usuario - EXISTE REGISTRO DEL USUARIO
            If ds.Tables.Count > 0 AndAlso
                ds.Tables(0).Rows.Count > 0 AndAlso
                     ds.Tables(0).Columns.Count > 6 Then

                tipo_usuario = ds.Tables(0).Rows(0)(6).ToString() '1: Usuario interno , 2: usuario externo proveedor


                'Validación AD
                If tipo_usuario = 1 Then 'usuario interno - validador AD
                    'resultado = IsAuthenticated("acurio.net", usuario, clave)

                    ' Detectar si el valor ingresado es un AD o un DNI
                    ' Si es numérico asumimos DNI, si no, asumimos AD
                    Dim esAD As Boolean = False
                    Dim usuarioAD As String = ""
                    Dim dniUsuario As String = ""

                    If IsNumeric(user) Then
                        ' Buscar AD a partir de DNI
                        Dim listaUsuarios As List(Of Dictionary(Of String, String)) = ObtenerUsuariosPorUbicacion("acurio.net", user)
                        For Each usuarioDir As Dictionary(Of String, String) In listaUsuarios
                            If usuarioDir.ContainsKey("samaccountname") Then
                                usuarioAD = usuarioDir("samaccountname")
                                esAD = True
                                dniUsuario = user
                                Exit For
                            End If
                        Next
                    Else
                        ' Buscar DNI a partir de AD
                        dniUsuario = ObtenerUbicacionPorUsuarioAD("acurio.net", user)
                        If Not String.IsNullOrEmpty(dniUsuario) Then
                            Session("dni_usuario") = dniUsuario.ToString()
                            usuarioAD = user
                            esAD = True
                        End If
                    End If


                    Dim mensaje As String
                    If Not IsAuthenticated("acurio.net", usuarioAD, clave) Then
                        mensaje = "La contraseña ingresada es incorrecta o su cuenta no cuenta con permisos para acceder al sistema."
                        toastGuardado.InnerText = mensaje
                        Mostrar_mensaje_registro()
                        Return

                    Else
                        resultado = True
                        ' Login correcto
                    End If

                End If
                If tipo_usuario = 2 Then 'usuario externo - proveedor
                    resultado = 1
                End If

                'Validamos la existencia del usuario en arsysusers

                id_usuario = ds.Tables(0).Rows(0)(1).ToString()
                usuario = ds.Tables(0).Rows(0)(2).ToString()


                Session("user") = usuario '"imartinez"
                Session("id_usuario") = id_usuario 'id_usuario de los acceso a los sistemas
                Session("clave") = clave
                Dim dt_sistemas As DataTable = ds.Tables(0)
                Session("dt_sistemas") = dt_sistemas 'Acceso a los sistemas
                Session("tipo_usuario") = tipo_usuario

                '================ PROCESO COOKIE =================
                COOKIE_GENERAL_SESION()

                Dim strRedirect As String
                strRedirect = Request("ReturnUrl")
                If strRedirect Is Nothing Then
                    strRedirect = "main.aspx"
                End If

                Dim vRecuerdame = False 'cuando pongas tu chek de recordar tu pagina 
                Dim tkt = New FormsAuthenticationTicket(1, user, DateTime.Now, DateTime.Now.AddMinutes(30), vRecuerdame, user)
                Dim cookiestr = FormsAuthentication.Encrypt(tkt)
                Dim ck = New HttpCookie("appNameAuth", cookiestr)
                If vRecuerdame Then
                    ck.Expires = tkt.Expiration
                End If
                ck.Path = FormsAuthentication.FormsCookiePath
                Response.Cookies.Add(ck)
                Response.Redirect(strRedirect, True)


            Else
                'El usuario no existe en su totalidad
                Dim mensaje As String
                mensaje = "El usuario ingresado no tiene acceso asignado a ningún sistema de la Suite AR"
                toastGuardado.InnerText = mensaje
                Mostrar_mensaje_registro()


            End If




        Catch ex As Exception

        End Try
    End Sub
    Public Function ExisteUsuarioAD(usuario As String) As Boolean

        Try

            Dim entry As New DirectoryServices.DirectoryEntry("LDAP://acurio.net")

            Dim searcher As New DirectoryServices.DirectorySearcher(entry)

            searcher.Filter = "(sAMAccountName=" & usuario & ")"

            Dim resultado = searcher.FindOne()

            Return resultado IsNot Nothing

        Catch
            Return False
        End Try

    End Function
    Public Sub COOKIE_GENERAL_SESION()
        '================ PROCESO COOKIE =================
        'Creacion del cookie

        Dim tokenGlobal As String = Guid.NewGuid().ToString()

        'Guardar en Session de la Suite
        Session("ACTIVACION_GENERAL") = tokenGlobal

        obj.GuardarSesionGlobal(
            Session("user").ToString(),
            tokenGlobal)



        'Dim tokenGlobal As String = Guid.NewGuid().ToString()
        'Guardar en Session de la Suite
        'Session("ACTIVACION_GENERAL") = tokenGlobal
        'Dim ck As New HttpCookie("ACTIVACION_GENERAL")
        'ck.Value = tokenGlobal
        'ck.Path = "/"
        'Response.Cookies.Add(ck)
        'Ejemplo: ACTIVACION_GENERAL =9f72a8e2-48f0-4f67-9c88-a1a8f6f7a2c1


    End Sub

    Public Sub captura_URL_Sistema_acceso_directo()
        Dim urlBase As String = Request.Url.GetLeftPart(UriPartial.Authority) & Request.ApplicationPath

        If Not urlBase.EndsWith("/") Then
            urlBase &= "/"
        End If



        'ClientScript.RegisterStartupScript(
        '    Me.GetType(),
        '    "MostrarURL",
        '    "alert('URL capturada - Con esta URL se que máscara tengo para llamar al sistema que es: " & urlBase & "');",
        '    True)


        ' Ejemplos:
        'https://arecetas.acuriorestaurantes.net/arecetas/
        ' https://argestionreclamos.acuriorestaurantes.net/areclamos2025/
        'https://armanto.acuriorestaurantes.net/armanto/
        ' https://arinventa.acuriorestaurantes.net/arinventasap/
        'https://arconducta.acuriorestaurantes.net/arsanciones/

        'Todas las URL llamaran siempre al proyecto de la SUITE/login.aspx , Siempre dirigido al login.aspx. No al Main
        'Al capturar la URL sabre a que sistema de manera inmediata ingresará, osea el codigo del boton digamos: 
        '- btnARECLAMOS_Click, btnARINVENTAS_Click, btnARECETAS_Click, btnSORPRENDE_Click, etc. del MAIN.ASPX
        'Debemos tener una tabla intermedia en donde enlacemos URL capturada y la URL del SISTEMA. Enviandole los parametros de entrada del sistema

        If urlBase.IndexOf("ARECETAS", StringComparison.OrdinalIgnoreCase) >= 0 Then
            Session("URL_SISTEMA") = urlBase
        End If

        If urlBase.IndexOf("ARECLAMO", StringComparison.OrdinalIgnoreCase) >= 0 Then
            Session("URL_SISTEMA") = urlBase
        End If

        If urlBase.IndexOf("ARMANTO", StringComparison.OrdinalIgnoreCase) >= 0 Then
            Session("URL_SISTEMA") = urlBase
        End If

        If urlBase.IndexOf("ARINVENTA", StringComparison.OrdinalIgnoreCase) >= 0 Then
            Session("URL_SISTEMA") = urlBase
        End If

        If urlBase.IndexOf("ARSANCION", StringComparison.OrdinalIgnoreCase) >= 0 Then
            Session("URL_SISTEMA") = urlBase
        End If




    End Sub
    Public Sub Mostrar_mensaje_registro()
        ''Mostrar mensaje
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "toast",
        '"mostrarToastGuardado();", True)

        ScriptManager.RegisterStartupScript(
    Me,
    Me.GetType(),
    Guid.NewGuid().ToString(),
    "setTimeout(function(){ mostrarToastGuardado(); }, 100);",
    True)

    End Sub

    Public Function ObtenerUsuariosPorUbicacion(ByVal Domain As String, ByVal Ubicacion As String) As List(Of Dictionary(Of String, String))
        Dim Entry As New DirectoryEntry("LDAP://" & Domain)
        Dim Searcher As New DirectorySearcher(Entry)

        ' Filtro para buscar usuarios por ubicación (physicalDeliveryOfficeName)
        'Searcher.Filter = $"(&(objectCategory=person)(objectClass=user)(physicalDeliveryOfficeName={Ubicacion}))"
        ' ✅ AHORA BUSCA POR ipPhone (TELÉFONO IP = DNI)
        Searcher.Filter = $"(&(objectCategory=person)(objectClass=user)(ipPhone={Ubicacion}))"
        Searcher.PageSize = 1000 ' Obtener hasta 1000 resultados por búsqueda

        Dim listaUsuarios As New List(Of Dictionary(Of String, String))

        Try
            Dim Results As SearchResultCollection = Searcher.FindAll()

            If Results IsNot Nothing Then
                For Each Result As SearchResult In Results
                    Dim datosUsuario As New Dictionary(Of String, String)

                    ' Recorrer todos los atributos disponibles del usuario
                    For Each prop As String In Result.Properties.PropertyNames
                        If Result.Properties(prop).Count > 0 Then
                            datosUsuario(prop) = Result.Properties(prop)(0).ToString()
                        End If
                    Next

                    ' Agregar el usuario a la lista
                    listaUsuarios.Add(datosUsuario)
                Next
            End If

        Catch ex As Exception
            Dim errorDict As New Dictionary(Of String, String)
            errorDict("Error") = "Error: " & ex.Message
            listaUsuarios.Add(errorDict)
        End Try

        Return listaUsuarios
    End Function

    Public Function ObtenerUbicacionPorUsuarioAD(ByVal Domain As String, ByVal usuarioAD As String) As String
        Dim Entry As New DirectoryEntry("LDAP://" & Domain)
        Dim Searcher As New DirectorySearcher(Entry)

        ' 🔎 Buscar por samaccountname
        Searcher.Filter = $"(&(objectCategory=person)(objectClass=user)(samaccountname={usuarioAD}))"
        Searcher.PropertiesToLoad.Add("ipPhone") ' El campo donde guardas el DNI
        Searcher.PageSize = 1

        Try
            Dim Result As SearchResult = Searcher.FindOne()

            If Result IsNot Nothing AndAlso Result.Properties.Contains("ipPhone") Then
                Return Result.Properties("ipPhone")(0).ToString()
            End If

        Catch ex As Exception
            Return "Error: " & ex.Message
        End Try

        Return String.Empty ' Si no encuentra nada devuelve vacío
    End Function

End Class