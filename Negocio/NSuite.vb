Imports Data
Public Class NSuite
    Dim obj As New Data.Dsuite
    Public Function validar_acceso(ByVal usuario As String, ByVal clave As String) As DataSet
        Dim ds As New DataSet
        ds = obj.validar_acceso(usuario, clave)
        Return ds
    End Function

    Public Function GuardarSesionGlobal(ByVal usuario As String, ByVal tokenGlobal As String) As Boolean

        obj.GuardarSesionGlobal(usuario, tokenGlobal)
        Return True
    End Function

    Public Function ExisteTokenActivo(ByVal token As String) As DataSet
        Dim ds As New DataSet
        ds = obj.ExisteTokenActivo(token)
        Return ds
    End Function

    Public Function CerrarSesionGlobal(ByVal tokenGlobal As String) As Boolean

        obj.CerrarSesionGlobal(tokenGlobal)
        Return True
    End Function

End Class
