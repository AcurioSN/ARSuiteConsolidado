<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="main_prueba.aspx.vb" Inherits="ARSuite.main_prueba" %>



<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <title>ARRecetas</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            background: #f6f6f8;
            font-family: "Segoe UI", sans-serif;
            font-size: 14px;
        }

        /* HEADER */
        .main-header {
            background: linear-gradient(135deg, #540f4a, #ba0c5c);
            color: #fff;
            padding: 1.4rem 2rem;
            border-radius: 0 0 1.25rem 1.25rem;
        }

        .header-title {
            display: flex;
            align-items: center;
            gap: .6rem;
        }

        .header-title h1 {
            font-size: 1.2rem;
            margin: 0;
            font-weight: 700;
        }

        .header-title i {
            font-size: 1.4rem;
        }

        .main-header p {
            font-size: .85rem;
            opacity: .85;
            margin-top: .25rem;
        }

        /* CARD LINK (CLICKEABLE SEGURA) */
        .card-link {
            display: block;
            text-decoration: none;
            color: inherit;
            height: 100%;
        }

        .card-link:hover {
            color: inherit;
        }

        /* CARD */
        .main-card {
            background: #fff;
            border-radius: 1rem;
            padding: 1.25rem;
            height: 100%;
            box-shadow: 0 6px 20px rgba(0,0,0,.08);
            transition: transform .25s ease, box-shadow .25s ease, border .25s ease;
        }

        /* HOVER REAL */
        .card-link:hover .main-card {
            transform: translateY(-6px);
            box-shadow: 0 18px 42px rgba(186,12,92,.30);
            border: 1px solid rgba(186,12,92,.25);
        }

        .main-card h5 {
            font-size: .95rem;
            font-weight: 600;
            transition: color .25s ease;
        }

        .card-link:hover h5 {
            color: #ba0c5c;
        }

        .main-card p {
            font-size: .85rem;
        }

        /* ICONOS */
        .icon-circle {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: #ba0c5c;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            margin-bottom: .75rem;
            transition: transform .25s ease, background-color .25s ease;
        }

        .card-link:hover .icon-circle {
            transform: scale(1.08);
            background-color: #540f4a;
        }

        .icon-secondary {
            background: #975a89;
        }

        /* BOTÓN FLOTANTE INFERIOR */
        .btn-footer {
            /*position: fixed;
            bottom: 22px;
            right: 22px;*/
            z-index: 1050;
            border-radius: 50px;
            padding: .55rem 1.2rem;
            background: #540f4a;
            color: #fff;
            border: none;
            box-shadow: 0 6px 18px rgba(0,0,0,.25);
        }

        .btn-footer:hover {
            background: #ba0c5c;
        }

        /* MODAL 2 COLUMNAS */
        .modal-left {
            background: linear-gradient(135deg, #540f4a, #ba0c5c);
            color: #fff;
            padding: 2rem;
        }

        .modal-left i {
            font-size: 2rem;
            margin-bottom: .75rem;
        }

        .modal-left h4 {
            font-weight: 700;
        }

        .modal-right {
            background: #fff;
            padding: 2rem;
        }

        @media (max-width: 767px) {
            .modal-left,
            .modal-right {
                padding: 1.5rem;
            }
        }

        html, body {
    height: 100%;
}

.container-fluid {
    height: calc(100vh - 20px);
    overflow-y: auto;
}
    </style>

    <%--CARD DELGADO USER--%>
    <style>
    /* CARD SUPERIOR USUARIO */

.user-card{
background:white;
border-radius:12px;
padding:14px 18px;
box-shadow:0 6px 18px rgba(0,0,0,.08);
transition:all .25s ease;
}

.user-card:hover{
box-shadow:0 12px 28px rgba(0,0,0,.12);
}

/* avatar */

.user-avatar{
width:38px;
height:38px;
border-radius:50%;
background:linear-gradient(135deg,#540f4a,#ba0c5c);
color:white;
display:flex;
align-items:center;
justify-content:center;
font-size:18px;
}

/* nombre usuario */

.user-name{
font-weight:600;
font-size:.9rem;
}

.user-role{
font-size:.75rem;
color:#777;
}

/* botón logout */

.btn-logout{
background:#540f4a;
color:white;
border-radius:8px;
padding:6px 14px;
font-size:.8rem;
text-decoration:none;
transition:.2s;
}

.btn-logout:hover{
background:#ba0c5c;
color:white;
}

</style>


<%--SUITE ACURIO RESTAURANTES--%>
<style>
    /* LINEA ROJA banner principal suite*/
.title-divider {
    width: 3px;
    height: 30px;
    background: #C51C08;
    border-radius: 2px;
}


</style>

<style>
 /* ===== Header banner principal suite ===== */

.main-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* ===== Usuario ===== */

.user-area {
    display: flex;
    align-items: center;
    gap: 10px;

    color: #6c757d;
    font-size: 0.90rem;
}

.user-name {
    display: flex;
    align-items: center;
    gap: 6px;

    font-weight: 500;
}

.user-name i {
    color: #9ca3af;
    font-size: 1rem;
}

.user-separator {
    color: #ced4da;
    font-weight: 300;
}

/* ===== Enlaces ===== */

.header-link {
    text-decoration: none !important;
    color: inherit;
    font-weight: 500;

    transition: color .2s ease;
}

.header-link:hover {
    color: #FFFFFF;
}
</style>



<style>

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

</head>

<body>

<form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="container-fluid px-4">


     <div class="main-header mb-4">

    <div class="header-info">

        <div class="header-title">
            <i class="bi bi-grid-3x3-gap-fill"></i>
            <div class="title-divider"></div>
            <h1>Suite AR</h1>
        </div>

        <p>Plataforma tecnológica corporativa de Acurio Restaurantes</p>

    </div>

    <!-- Usuario -->
    <div class="user-area">

        <span class="user-name">
            <i class="fas fa-user-circle"></i>
           Ivan
        </span>

        <span class="user-separator">|</span>

        <asp:LinkButton
            ID="lnkIniciarSesion"
            runat="server"
            CssClass="header-link"
            ToolTip="Iniciar sesión"
            CausesValidation="false">

            <i class="fas fa-sign-in-alt"></i> LogIn

        </asp:LinkButton>

        <span class="user-separator">|</span>

        <asp:LinkButton
            ID="lnkCerrarSesion"
            runat="server"
            CssClass="header-link"
            ToolTip="Cerrar sesión"
            CausesValidation="false">

            <i class="fas fa-sign-out-alt"></i> LogOut

        </asp:LinkButton>

    </div>

</div>






                <!-- SISTEMAS -->
    <div class="grid">

                 <asp:LinkButton 
             ID="btnARPROVEEDORES"
             runat="server"
             CssClass="card2"
             CausesValidation="false"            
             style="display:block; text-decoration:none; color:inherit; position:relative;">

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
            style="display:block; text-decoration:none; color:inherit; position:relative;">

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
             style="display:block; text-decoration:none; color:inherit; position:relative;">

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
             style="display:block; text-decoration:none; color:inherit; position:relative;">

             <!-- ICONO SUPERIOR -->
             <div id="divCandadoINFORASH" runat="server" class="card-badge">
                 <i class="fas fa-lock"></i>
             </div>


             <i class="fas fa-brain"></i>
             <h3>INFORASH</h3>
             <p>Sistema INFORASH</p>

         </asp:LinkButton>


        <asp:LinkButton 
            ID="btnARECETAS"
            runat="server"
            CssClass="card"
            CausesValidation="false"

            style="display:block; text-decoration:none; color:inherit; position:relative;" UseSubmitBehavior="false">

            <!-- ICONO SUPERIOR -->
            <div id="divCandadoARECETAS" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

            <i class="fas fa-utensils"></i>

            <h3>ARECETAS</h3>
            <p>Gestión de Recetas</p>

        </asp:LinkButton>


         <asp:LinkButton 
             ID="btnARECLAMOS"
             runat="server"
             CssClass="card"
             CausesValidation="false"             
             style="display:block; text-decoration:none; color:inherit; position:relative;">

              <!-- ICONO SUPERIOR -->
             <div id="divCandadoARECLAMOS" runat="server" class="card-badge">
                 <i class="fas fa-lock"></i>
             </div>

             <i class="fas fa-book-open"></i>
             <h3>ARECLAMOS</h3>
             <p>Gestión de Quejas y Reclamos</p>

         </asp:LinkButton>

         <asp:LinkButton 
             ID="btnARCONDUCTA"
             runat="server"
             CssClass="card"
             CausesValidation="false"             
            style="display:block; text-decoration:none; color:inherit; position:relative;">

             <!-- ICONO SUPERIOR -->
            <div id="divCandadoARCONDUCTA" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

             <i class="fas fa-user-check"></i>
             <h3>ARCONDUCTA</h3>
             <p>Gestión Memos a Colaboradores</p>

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
            <h3>ARMAESTROS</h3>
            <p>Gestión de Maestros Proveedores</p>

        </asp:LinkButton>

        <asp:LinkButton 
            ID="btnARINVENTA"
            runat="server"
            CssClass="card"
            CausesValidation="false"
            style="display:block; text-decoration:none; color:inherit; position:relative;">

                <!-- ICONO SUPERIOR -->
            <div id="divCandadoARINVENTA" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

            <i class="fas fa-boxes"></i>
            <h3>ARINVENTA</h3>
            <p>Gestión de Inventarios</p>

        </asp:LinkButton>

         <asp:LinkButton 
             ID="btnARMANTO"
             runat="server"
             CssClass="card"
             CausesValidation="false"             
             style="display:block; text-decoration:none; color:inherit; position:relative;">

                 <!-- ICONO SUPERIOR -->
            <div id="divCandadoARMANTO" runat="server" class="card-badge">
                <i class="fas fa-lock"></i>
            </div>

             <i class="fas fa-wrench"></i>
             <h3>ARMANTO</h3>
             <p>Gestión de Avisos de Manto</p>

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
            <h3>ARSORPRENDE</h3>
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
            <h3>ADMINISTRADOR USUARIOS</h3>
            <p>Gestión de Usuarios y perfiles AR</p>

        </asp:LinkButton>


       

    </div>












    </div>

    <!-- BOTÓN FLOTANTE -->
     <div class="position-fixed bottom-0 end-0 p-3 d-flex flex-row gap-2 align-items-center">

<button type="button"
class="btn btn-footer"
data-bs-toggle="modal"
data-bs-target="#infoModal">

<i class="bi bi-info-circle me-1"></i> Información

</button>


<%--<button type="button"
class="btn btn-footer"
onclick="window.location.href='main.aspx';">

<i class="bi bi-box-arrow-right me-1"></i> Cerrar sesión

</button>--%>

</div>

    <!-- MODAL -->
    <div class="modal fade" id="infoModal" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body p-0">
                    <div class="row g-0">

                        <div class="col-md-5 modal-left">
                            <i class="bi bi-journal-bookmark-fill"></i>
                            <h4>ARecetas</h4>
                            <p class="opacity-75">
                                Sistema corporativo para la gestión, control y versionado
                                de documentos de recetas.
                            </p>
                        </div>

                        <div class="col-md-7 modal-right">
                            <h6 class="fw-bold mb-3">Funcionalidades</h6>
                            <ul class="text-muted ps-3">
                                <li>Registro de versiones</li>
                                <li>Trazabilidad documental</li>
                                <li>Control y auditoría</li>
                            </ul>

                            <div class="text-end mt-4">
                                <button type="button"
                                    class="btn btn-outline-secondary"
                                    data-bs-dismiss="modal">
                                    Cerrar
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>


