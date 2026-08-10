<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="main.aspx.vb" Inherits="ARSuite.main" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
<meta charset="utf-8" />
<title>Suite AR - Acurio Restaurantes</title>

<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Raleway', sans-serif;
}

/* 🔥 FONDO */
body {
    min-height: 100vh;
    background: linear-gradient(135deg, #822470, #4a1447);
    color: #fff;
}

/* CONTENEDOR */
.container {
    padding: 50px 40px;
}

/* 🔥 TOP BAR */
.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

/* TITULO */
.title-container {
    display: flex;
    align-items: center;
    gap: 18px;
}

.title-icon {
    font-size: 30px;
}

/* LINEA ROJA */
.title-divider {
    width: 3px;
    height: 30px;
    background: #C51C08;
    border-radius: 2px;
}

/* TEXTO */
.title-text {
    display: flex;
    flex-direction: column;
}

.title-text .ar {
    font-size: 13px;
    letter-spacing: 2px;
    opacity: 0.7;
}

.title-text .main {
    font-size: 24px;
    font-weight: 600;
}

/* 🔥 USUARIO */
.user-area {
    display: flex;
    align-items: center;
    gap: 16px;
    font-size: 13px;
}

/* badge usuario */
.user-area span {
    background: rgba(255,255,255,0.1);
    padding: 6px 12px;
    border-radius: 20px;
    display: flex;
    align-items: center;
    gap: 6px;
}

/* ICONOS */
.user-area i {
    font-size: 16px;
    cursor: pointer;
    opacity: 0.85;
    transition: 0.2s;
}

.user-area i:hover {
    opacity: 1;
}

/* SUB */
.subtitle {
    margin-left: 50px;
    margin-top: 5px;
    font-size: 13px;
    opacity: 0.75;
    margin-bottom: 40px;
}

/* GRID */
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 22px;
}

/*para mas adelante el ordenar*/
/* MODULOS ACTIVOS */
/*.activo {
    order: 1;
}*/

/* MODULOS BLOQUEADOS */
/*.bloqueado {
    order: 2;
}*/


/* =========================
   CARDS
========================= */
/*.card {
    background: #6B6162;
    border-radius: 14px;
    padding: 22px;
    transition: all 0.25s ease;
    cursor: pointer;
    border: 1px solid rgba(255,255,255,0.08);
}

.card:hover {
    transform: translateY(-6px);
    background: #625758;
    box-shadow: 0 10px 25px rgba(0,0,0,0.35);
    border: 1px solid rgba(255,255,255,0.18);
}*/


/* =========================
   ICONOS
========================= */
/*.card i {
    font-size: 26px;
    margin-bottom: 10px;
    color: #ffffff;
    transition: 0.3s;
}

.card:hover i {
    color: #FFB6E6;
}*/


/* =========================
   TEXTOS
========================= */
/*.card h3 {
    font-size: 15px;
    margin-bottom: 4px;
    color: #ffffff;
}

.card p {
    font-size: 12px;
    opacity: 0.78;
    color: #F1F1F1;
}*/



/* =========================
   CARDS PREMIUM
========================= */

.card {

    background: rgba(107, 97, 98, 0.78);

    backdrop-filter: blur(14px);

    -webkit-backdrop-filter: blur(14px);

    border-radius: 18px;

    padding: 22px;

    transition: all 0.30s ease;

    cursor: pointer;

    border: 1px solid rgba(255,255,255,0.10);

    box-shadow:
    0 8px 22px rgba(0,0,0,0.18);

    position: relative;

    overflow: hidden;
}

/* EFECTO GLASS */

.card::before {

    content: '';

    position: absolute;

    width: 180px;
    height: 180px;

    border-radius: 50%;

    background: rgba(255,255,255,0.04);

    top: -90px;
    right: -90px;

    filter: blur(8px);

    transition: 0.4s;
}

/* =========================
   HOVER
========================= */

.card:hover {

    transform: translateY(-6px);

    background: rgba(98, 87, 88, 0.88);

    box-shadow:
    0 16px 35px rgba(0,0,0,0.30);

    border: 1px solid rgba(255,255,255,0.18);
}

/* GLOW HOVER */

.card:hover::before {

    transform: scale(1.12);
}

/* =========================
   ICONOS
========================= */

.card i {

    font-size: 26px;

    margin-bottom: 10px;

    color: #ffffff;

    transition: 0.30s;

    position: relative;

    z-index: 2;
}

.card:hover i {

    color: #FFD2EE;
}

/* =========================
   TEXTOS
========================= */

.card h3 {

    font-size: 14px;

    margin-bottom: 4px;

    color: #ffffff;

    letter-spacing: 0.4px;

    position: relative;

    z-index: 2;
}

.card p {

    font-size: 12px;

    opacity: 0.82;

    color: #F4F4F4;

    position: relative;

    z-index: 2;
}

/* FOOTER */
.footer {
    margin-top: 40px;
    font-size: 11px;
    opacity: 0.6;
    text-align: center;
}

</style>

<%--boton iniciar sesion y cerrar sesión--%>
<style>
    .btn-login {
    text-decoration: none;
    color: inherit;
    font-size: inherit;
    cursor: pointer;
}

    .btn-logout {
    text-decoration: none;
    color: inherit;
    cursor: pointer;
    background: none;
    border: none;
}

</style>

<style>

/* =========================
   CARD CLARO (NEW)
========================= */
.card2 {
    background: #ebe6e5;
    border-radius: 14px;
    padding: 22px;
    transition: all 0.25s ease;
    cursor: pointer;
    border: 1px solid rgba(0,0,0,0.08);
}

.card2:hover {
    transform: translateY(-6px);
    background: #F4DFDB;
    box-shadow: 0 10px 25px rgba(0,0,0,0.18);
    border: 1px solid rgba(0,0,0,0.15);
}

/* ICONOS */
.card2 i {
    font-size: 26px;
    margin-bottom: 10px;
    color: #C65644;
    transition: 0.3s;
}

.card2:hover i {
    color: #A63F31;
}

/* TEXTO */
.card2 h3 {
    font-size: 15px;
    margin-bottom: 4px;
    color: #7A2F24;
}

.card2 p {
    font-size: 12px;
    opacity: 0.80;
    color: #7A2F24;
}
</style>

<%--Estilo para candado o bloqueo--%>
<style>
/* BADGE SUPERIOR */
.card-badge {
    position: absolute;
    top: 12px;
    right: 12px;

    width: 30px;
    height: 30px;

    border-radius: 50%;

    background: rgba(255,255,255,0.15);

    display: flex;
    align-items: center;
    justify-content: center;

    border: 1px solid rgba(255,255,255,0.18);

    transition: 0.3s;
}

.card-badge i {
    font-size: 12px;
    color: #ffffff;
    line-height: 1;
    margin: 0;
    padding: 0;
    transform: translateY(-1px);
}

.card:hover .card-badge {
    background: rgba(255,255,255,0.22);
}
</style>

<style>
    /* FIX LINKBUTTON POSTBACK */

a.card,
a.card2{

    display:block !important;

    opacity:1 !important;

    visibility:visible !important;

    color:inherit !important;

    text-decoration:none !important;
}

.card:focus,
.card:active,
.card2:focus,
.card2:active{

    opacity:1 !important;

    visibility:visible !important;

    outline:none !important;
}
</style>
<style>
    .header-user-label {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 13px;
}
</style>

    <style>
        .header-user-label,
.header-user-label span,
.header-user-label i {
    border: none !important;
    outline: none !important;
    box-shadow: none !important;
    background: transparent !important;
}
    </style>
</head>

<body>
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="container">

    <!-- 🔥 TOP BAR -->
    <div class="top-bar">

        <!-- TITULO -->
        <div class="title-container">
            <%--<i class="fas fa-layer-group title-icon"></i>--%>
            <i class="bi bi-grid-3x3-gap-fill title-icon"></i>
            <div class="title-divider"></div>
            <div class="title-text">
                <%--<span class="ar">AR</span>--%>
                <span class="main">Suite AR</span>
            </div>
        </div>

        <!-- USUARIO -->
        <div class="user-area">
            <i class="fas fa-bell" title="Notificaciones"></i>

            <!-- USUARIO LOGUEADO -->

                <span id="spUsuario" runat="server" class="header-user-label">

                <i class="fas fa-user-circle"></i>

                <asp:Label 
                    ID="lblUsuarioLogueado" 
                    runat="server">
                </asp:Label>

            </span>



            <%--<span>
                <i class="fas fa-user-circle"></i> Iniciar Sesión
            </span>--%>
            <asp:LinkButton 
                ID="lnkIniciarSesion" 
                runat="server"
                CssClass="btn-login"
                ToolTip="Iniciar sesión"
                CausesValidation="false">

                <i class="fas fa-user-circle"></i> LogIn

            </asp:LinkButton>

            <%--Botón cerrar sesion--%>
            <%--<i class="fas fa-sign-out-alt" title="Cerrar sesión"></i>--%>
            <asp:LinkButton 
                    ID="lnkCerrarSesion" 
                    runat="server"
                    CssClass="btn-login"
                    ToolTip="Cerrar sesión"
                    CausesValidation="false">

                    <i class="fas fa-sign-out-alt"></i>LogOut

                </asp:LinkButton>

        </div>

    </div>

    <div class="subtitle">
        Integrando personas, procesos y tecnología.
    </div>

        <!-- SISTEMAS -->
    <div class="grid">

                 <asp:LinkButton 
             ID="btnARPROVEEDORES"
             runat="server"
             CssClass="card2"
             CausesValidation="false"   
             OnClick="btnARPROVEEDORES_Click"
             style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false" Visible="False">

                  <!-- ICONO SUPERIOR -->
             <div id="divCandadoARPROVEEDORES" runat="server" class="card-badge">
                 <i class="fas fa-lock"></i>
             </div>

             <i class="fas fa-handshake"></i>
             <h3>AR WEB DE PROVEEDORES</h3>
             <p>Web de Proveedores - Documentos</p>

         </asp:LinkButton>

          <asp:LinkButton 
            ID="btnARREGISTRODEPROVEDORES"
            runat="server"
            CssClass="card2"
            CausesValidation="false"    
            OnClick="btnARREGISTRODEPROVEDORES_Click"
            style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false" Visible="false">

                   <!-- ICONO SUPERIOR -->
             <div id="divCandadoARREGISTRODEPROVEEDORES" runat="server" class="card-badge">
                 <i class="fas fa-lock"></i>
             </div>

            <i class="fas fa-user-plus"></i>
            <h3>AR REGISTRO DE PROVEEDORES</h3>
            <p>Registro de Proveedores</p>

        </asp:LinkButton>

           <asp:LinkButton 
             ID="btnARCOCINA"
             runat="server"
             CssClass="card2"
             CausesValidation="false"            
             style="display:block; text-decoration:none; color:inherit; position:relative;" Visible="False">

                     <!-- ICONO SUPERIOR -->
             <div id="divCandadoARCOCINA" runat="server" class="card-badge">
                 <i class="fas fa-lock"></i>
             </div>

             <i class="fas fa-concierge-bell"></i>
             <h3>AR COCINA</h3>
             <p>Fabricar - Planificar - Reservar</p>

         </asp:LinkButton>

           <asp:LinkButton 
             ID="btnINFORASH"
             runat="server"
             CssClass="card2"
             CausesValidation="false"  
             OnClick="btnINFORASH_Click"
             style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false" Visible="False">

             <!-- ICONO SUPERIOR -->
             <div id="divCandadoINFORASH" runat="server" class="card-badge">
                 <i class="fas fa-lock"></i>
             </div>


             <i class="fas fa-brain"></i>
             <h3>INFORUSH</h3>
             <p>Sistema INFORUSH</p>

         </asp:LinkButton>


        <asp:LinkButton 
            ID="btnARECETAS"
            runat="server"
            CssClass="card"
            CausesValidation="false"
            OnClick="btnARECETAS_Click"
            style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false">

            <!-- ICONO SUPERIOR -->
            <div id="divCandadoARECETAS" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

            <i class="fas fa-utensils"></i>

            <h3>ARecetas</h3>
            <p>Gestión de Recetas</p>

        </asp:LinkButton>


         <asp:LinkButton 
             ID="btnARECLAMOS"
             runat="server"
             CssClass="card"
             CausesValidation="false"             
             OnClick="btnARECLAMOS_Click"
             style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false">

              <!-- ICONO SUPERIOR -->
             <div id="divCandadoARECLAMOS" runat="server" class="card-badge">
                 <i class="fas fa-lock"></i>
             </div>

             <i class="fas fa-book-open"></i>
             <h3>AReclamos</h3>
             <p>Gestión de Quejas y Reclamos</p>

         </asp:LinkButton>


         <asp:LinkButton 
             ID="btnARCONDUCTA"
             runat="server"
             CssClass="card"
             CausesValidation="false"  
            style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false">

             <!-- ICONO SUPERIOR -->
            <div id="divCandadoARCONDUCTA" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

             <i class="fas fa-user-check"></i>
             <h3>AR Conducta</h3>
             <p>Gestión de sanciones</p>

         </asp:LinkButton>

        <asp:LinkButton 
            ID="btnARMAESTROS"
            runat="server"
            CssClass="card"
            CausesValidation="false"           
            style="display:block; text-decoration:none; color:inherit; position:relative;">

                <!-- ICONO SUPERIOR -->
            <div id="divCandadoARMAESTROS" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

            <i class="fas fa-database"></i>
            <h3>AR Data maestra</h3>
            <p>Gestión de datos maestros</p>

        </asp:LinkButton>

        <asp:LinkButton 
            ID="btnARINVENTA"
            runat="server"
            CssClass="card"
            CausesValidation="false"
            style="display:block; text-decoration:none; color:inherit; position:relative;"  UseSubmitBehavior="false">

                <!-- ICONO SUPERIOR -->
            <div id="divCandadoARINVENTA" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

            <i class="fas fa-boxes"></i>
            <h3>AR Inventa</h3>
            <p>Gestión de Inventarios</p>

        </asp:LinkButton>

         <asp:LinkButton 
             ID="btnARMANTO"
             runat="server"
             CssClass="card"
             CausesValidation="false"
             OnClick="btnARMANTO_Click"
             style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false">

                 <!-- ICONO SUPERIOR -->
            <div id="divCandadoARMANTO" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

             <i class="fas fa-wrench"></i>
             <h3>AR Manto</h3>
             <p>Gestión de avisos de mantenimiento</p>

         </asp:LinkButton>

        <asp:LinkButton 
            ID="btnARSORPRENDE"
            runat="server"
            CssClass="card"
            CausesValidation="false"            
            style="display:block; text-decoration:none; color:inherit; position:relative;">

                 <!-- ICONO SUPERIOR -->
            <div id="divCandadoARSORPRENDE" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

            <i class="fas fa-award"></i>
            <h3>Sorprende</h3>
            <p>Reconocimiento al Colaborador</p>

        </asp:LinkButton>

        <asp:LinkButton 
            ID="btnARADMINUSUARIOS"
            runat="server"
            CssClass="card"
            CausesValidation="false"            
            style="display:block; text-decoration:none; color:inherit; position:relative;">

                 <!-- ICONO SUPERIOR -->
            <div id="divCandadoARDMINUSUARIOS" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

            <i class="fas fa-user-cog"></i>
            <h3>Administrador de Usuarios</h3>
            <p>Gestión de Usuarios y perfiles AR</p>

        </asp:LinkButton>


       <a href="javascript:void(0);"
   class="card"
   style="display:block; text-decoration:none; color:inherit; position:relative;cursor:not-allowed;">

    <!-- ICONO SUPERIOR -->
    <div class="card-badge">
        <i class="fas fa-lock"></i>
    </div>

    <!-- ICONO PRINCIPAL -->
    <i class="fa-solid fa-kitchen-set"></i>

    <!-- TÍTULO -->
    <h3>AR Cocina</h3>

    <!-- DESCRIPCIÓN -->
    <p>Gestión de Producciones en Cocina</p>

</a>


 <a href="javascript:void(0);"
   class="card"
   style="display:block; text-decoration:none; color:inherit; position:relative;cursor:not-allowed;">

    <!-- ICONO SUPERIOR -->
    <div class="card-badge">
        <i class="fas fa-lock"></i>
    </div>

    <!-- ICONO PRINCIPAL -->
    <i class="fas fa-camera"></i>

    <!-- TÍTULO -->
    <h3>Info Rush</h3>

    <!-- DESCRIPCIÓN -->
    <p>Gestión de evidencias en la unidad</p>

</a>

 <a href="javascript:void(0);"
   class="card"
   style="display:block; text-decoration:none; color:inherit; position:relative;cursor:not-allowed;">

    <!-- ICONO SUPERIOR -->
    <div class="card-badge">
        <i class="fas fa-lock"></i>
    </div>

    <!-- ICONO PRINCIPAL -->
    <i class="fas fa-truck-loading"></i>

    <!-- TÍTULO -->
    <h3>Web Proveedores</h3>

    <!-- DESCRIPCIÓN -->
    <p>Gestión de Documentos de Proveedores</p>

</a>

  <a href="javascript:void(0);"
   class="card"
   style="display:block; text-decoration:none; color:inherit; position:relative;cursor:not-allowed;">

    <!-- ICONO SUPERIOR -->
    <div class="card-badge">
        <i class="fas fa-lock"></i>
    </div>

    <!-- ICONO PRINCIPAL -->
    <i class="fas fa-user-friends"></i>

    <!-- TÍTULO -->
    <h3>Portal de Clientes SGA</h3>

    <!-- DESCRIPCIÓN -->
    <p>Ventas Arequipa</p>

</a>

       <%-- <asp:LinkButton 
    ID="lnkArecetas" 
    runat="server"
    CssClass="card"
    BackColor="#F9EDEB"
    style="text-decoration:none;">

    <i class="fas fa-utensils" style="color:#822470;"></i>

    <h3 style="color: #800080">
        ARECETASx
    </h3>

    <p style="color: #800080">
        Gestión de recetas
    </p>

</asp:LinkButton>--%>



        

      <%--  <div class="card" onclick="go('arcompras')">
            <i class="fas fa-cart-shopping"></i>
            <h3>ARCOMPRAS</h3>
            <p>Gestión de compras</p>
        </div>

        <div class="card" onclick="go('arproduccion')">
            <i class="fas fa-industry"></i>
            <h3>ARPRODUCCIÓN</h3>
            <p>Producción</p>
        </div>

        <div class="card" onclick="go('arinventario')">
            <i class="fas fa-warehouse"></i>
            <h3>ARINVENTARIO</h3>
            <p>Inventario</p>
        </div>--%>

    

        <%--<div class="card" onclick="go('arusuarios')">
            <i class="fas fa-users"></i>
            <h3>ARUSUARIOS</h3>
            <p>Accesos</p>
        </div>

        <div class="card" onclick="go('arconfig')">
            <i class="fas fa-cogs"></i>
            <h3>ARCONFIG</h3>
            <p>Configuración</p>
        </div>--%>

    </div>

    <div class="footer">
        © 2026 Acurio Restaurantes
    </div>

</div>
</form>


<script>
    function go(modulo) {
        window.location.href = "/" + modulo;
    }
</script>
<script>
    document.addEventListener("keydown", function (e) {

        if (e.ctrlKey && e.altKey && e.key.toLowerCase() === "i") {
            alert("🚀 Suite AR\n\nDesarrollado por Ivan Martinez\nGestor de Desarrollo de Sistemas e Innovación");
        }

    });
</script>
</body>
</html>