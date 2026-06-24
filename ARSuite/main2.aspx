<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="main2.aspx.vb" Inherits="ARSuite.main2" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <title>ARSuite</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        body {
            background: #f3f2f1;
            font-family: "Segoe UI", sans-serif;
        }

        /* USER CARD */
        .user-card {
            background: white;
            border-radius: 10px;
            padding: 12px 16px;
            border: 1px solid #edebe9;
            margin-bottom: 20px;
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #ba0c5c;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .user-name {
            font-weight: 600;
            font-size: .9rem;
        }

        .user-role {
            font-size: .75rem;
            color: #605e5c;
        }

        /* LOGOUT */
        .btn-logout-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #d13438;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-logout-circle i {
            color: white;
        }

        /* TITLE */
        .suite-title {
            text-align: center;
            margin-bottom: 25px;
        }

        .suite-title h4 {
            font-weight: 600;
            font-size: 1rem;
        }

        .suite-title p {
            font-size: .8rem;
            color: #605e5c;
        }

        /* APP GRID */
        .app-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .app-icon {
            width: 64px;
            height: 64px;
            margin: auto;
            border-radius: 16px;
            background: #ffffff;
            border: 1px solid #edebe9;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: #ba0c5c;
            transition: all 0.2s ease;
        }

        .app-link:hover .app-icon {
            background: #ba0c5c;
            color: white;
            transform: scale(1.1);
        }

        .app-label {
            margin-top: 8px;
            font-size: 0.75rem;
        }

    </style>
</head>

<body>
<form id="form1" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="container py-4">

    <!-- USER -->
<%--    <div class="user-card d-flex justify-content-between align-items-center">

        <div class="d-flex align-items-center gap-3">
            <div class="user-avatar">
                <i class="bi bi-person"></i>
            </div>

            <div>
                <div class="user-name">
                    <asp:Label ID="lblUsuario" runat="server" Text="Iván"></asp:Label>
                </div>
                <div class="user-role">Sesión activa en ARSuite</div>
            </div>
        </div>

        <asp:LinkButton ID="btnCerrarSesion1"
            runat="server"
            CssClass="btn-logout-circle"
            ToolTip="Cerrar sesión">
            <i class="bi bi-power"></i>
        </asp:LinkButton>

    </div>--%>

    <!-- TITLE -->
        <%--<div class="suite-title">
            <h4>ARSuite</h4>
            <p>Acceso a sistemas corporativos</p>
        </div>--%>

           <div class="text-center mb-3">
  <%--  <div class="d-flex justify-content-center align-items-center mb-1">
        <i class="bi bi-grid me-2" style="font-size: 1.4rem;"></i>
        <h4 class="mb-0">ARSuite</h4>
    </div>--%>
               <div class="d-flex justify-content-center align-items-center mb-1">
    <i class="bi bi-grid me-2" style="font-size: 1.4rem; color:#ba0c5c;"></i>
    <h4 class="mb-0" style="color:#ba0c5c;">ARSuite</h4>
</div>

    
    <div class="text-muted" style="font-size: 0.9rem;">
        Plataforma Unificada de Gestión
    </div>
    
    <div class="text-muted mt-1" style="font-size: 0.85rem;">
        Accede de manera centralizada a los sistemas y herramientas de Acurio Restaurantes.
    </div>
</div>

    <br />

    <!-- GRID SISTEMAS -->
    <div class="row g-4 text-center">

        <div class="col-md-2 col-4">
            <a href="Gestion_grupos.aspx" class="app-link">
                <div class="app-icon">
                    <i class="bi bi-collection"></i>
                </div>
                <div class="app-label">Sorprende</div>
            </a>
        </div>

        <div class="col-md-2 col-4">
            <a href="Gestion_manuales_p.aspx" class="app-link">
                <div class="app-icon">
                    <i class="bi bi-book"></i>
                </div>
                <div class="app-label">AReclamos</div>
            </a>
        </div>

        <div class="col-md-2 col-4">
            <a href="main.aspx" class="app-link">
                <div class="app-icon">
                    <i class="bi bi-graph-up"></i>
                </div>
                <div class="app-label">Data Maestra</div>
            </a>
        </div>

        <div class="col-md-2 col-4">
            <a href="main.aspx" class="app-link">
                <div class="app-icon">
                    <i class="bi bi-gear"></i>
                </div>
                <div class="app-label">Inventa</div>
            </a>
        </div>

          <div class="col-md-2 col-4">
              <a href="main.aspx" class="app-link">
                  <div class="app-icon">
                      <i class="bi bi-gear"></i>
                  </div>
                  <div class="app-label">Recetas</div>
              </a>
          </div>

         <div class="col-md-2 col-4">
             <a href="main.aspx" class="app-link">
                 <div class="app-icon">
                     <i class="bi bi-gear"></i>
                 </div>
                 <div class="app-label">Conducta</div>
             </a>
         </div>

          <div class="col-md-2 col-4">
      <a href="main.aspx" class="app-link">
          <div class="app-icon">
              <i class="bi bi-gear"></i>
          </div>
          <div class="app-label">Conducta</div>
      </a>
  </div>

                <div class="col-md-2 col-4">
    <a href="main.aspx" class="app-link">
        <div class="app-icon">
            <i class="bi bi-gear"></i>
        </div>
        <div class="app-label">Conducta</div>
    </a>
</div>

                


    </div>

</div>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>