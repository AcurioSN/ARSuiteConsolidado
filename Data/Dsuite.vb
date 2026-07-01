Imports System.Data.SqlClient
Imports System.Configuration
Public Class Dsuite
    Public Function validar_acceso(ByVal usuario As String, ByVal clave As String) As DataSet
        Dim ds As New DataSet()

        Try
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

            Using cn As New SqlConnection(strConnString)
                Using cmd As New SqlCommand("sp_arsuite_inicio_sesion_2026", cn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.CommandTimeout = 0

                    ' Definir parámetro con tipo y tamaño
                    cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 150).Value = usuario
                    cmd.Parameters.Add("@clave", SqlDbType.VarChar, 150).Value = clave

                    ' Llenar el DataSet usando SqlDataAdapter
                    Using da As New SqlDataAdapter(cmd)
                        da.Fill(ds)
                    End Using
                End Using
            End Using

        Catch ex As Exception
            ' Registrar el error si es necesario
            ' LogError(ex.Message) 
            Throw ' Relanzar el error para ser manejado en un nivel superior
        End Try

        Return ds
    End Function

    Public Function GuardarSesionGlobal(ByVal usuario As String, ByVal tokenGlobal As String) As Boolean
        Try
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

            Using cn As New SqlConnection(strConnString)
                Using cmd As New SqlCommand("sp_arsuite_GuardarSesionGlobal", cn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.CommandTimeout = 0

                    ' Agregar parámetros con tipo y tamaño
                    cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 150).Value = usuario
                    cmd.Parameters.Add("@tokenGlobal", SqlDbType.VarChar, 500).Value = tokenGlobal

                    cn.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Return True
        Catch ex As Exception
            ' Aquí puedes registrar el error antes de relanzarlo
            ' LogError(ex.Message) 
            Throw ' Lanza el error para que sea manejado en niveles superiores
        End Try
    End Function

    Public Function ExisteTokenActivo(ByVal token As String) As DataSet
        Dim ds As New DataSet()

        Try
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

            Using cn As New SqlConnection(strConnString)
                Using cmd As New SqlCommand("sp_arsuite_Validartoken", cn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.CommandTimeout = 0

                    ' Definir parámetro con tipo y tamaño
                    cmd.Parameters.Add("@token", SqlDbType.VarChar, 500).Value = token

                    ' Llenar el DataSet usando SqlDataAdapter
                    Using da As New SqlDataAdapter(cmd)
                        da.Fill(ds)
                    End Using
                End Using
            End Using

        Catch ex As Exception
            ' Registrar el error si es necesario
            ' LogError(ex.Message) 
            Throw ' Relanzar el error para ser manejado en un nivel superior
        End Try

        Return ds
    End Function

    Public Function CerrarSesionGlobal(ByVal tokenGlobal As String) As Boolean
        Try
            Dim strConnString As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

            Using cn As New SqlConnection(strConnString)
                Using cmd As New SqlCommand("sp_arsuite_CerrarSesionGlobal", cn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.CommandTimeout = 0

                    ' Agregar parámetros con tipo y tamaño
                    cmd.Parameters.Add("@token", SqlDbType.VarChar, 500).Value = tokenGlobal

                    cn.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            Return True
        Catch ex As Exception
            ' Aquí puedes registrar el error antes de relanzarlo
            ' LogError(ex.Message) 
            Throw ' Lanza el error para que sea manejado en niveles superiores
        End Try
    End Function
    Public Function configuracion_recaptcha() As DataSet
        Dim odt As New DataTable
        Dim strConnString As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
        Dim cn As New SqlConnection(strConnString)

        Dim cmd As New SqlCommand
        cmd.Connection = cn

        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "sp_arsancion_configuracion_recaptcha"



        cn.Open()
        cmd.ExecuteNonQuery()
        cn.Close()

        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New DataSet
        da.Fill(ds)


        Return ds
    End Function
End Class
