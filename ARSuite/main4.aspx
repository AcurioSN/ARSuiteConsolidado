<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="main4.aspx.vb" Inherits="ARSuite.main4" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
<meta charset="utf-8" />
<title>Suite AR - Acurio Restaurantes</title>

<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

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
    height: 50px;
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

/* CARDS */
.card {
    background: #EBE6E5;
    border-radius: 14px;
    padding: 22px;
    backdrop-filter: blur(8px);
    transition: all 0.25s ease;
    cursor: pointer;
    border: 1px solid rgba(255,255,255,0.1);
}

.card:hover {
    transform: translateY(-6px);
    background: rgba(255,255,255,0.14);
    box-shadow: 0 10px 25px rgba(0,0,0,0.35);
    border: 1px solid rgba(255,255,255,0.25);
}

/* ICONOS */
.card i {
    font-size: 26px;
    margin-bottom: 10px;
    color: #822470;
    transition: 0.3s;
}

.card:hover i {
    color: #FF8AD4;
}
.card:hover i,
.card:hover h3,
.card:hover p {
    color: #FF8AD4 !important;
}

/* TEXTO */
.card h3 {
    font-size: 15px;
    margin-bottom: 4px;
}

.card p {
    font-size: 12px;
    opacity: 0.75;
}

/* FOOTER */
.footer {
    margin-top: 40px;
    font-size: 11px;
    opacity: 0.6;
    text-align: center;
}

</style>
</head>

<body>

<div class="container">

    <!-- 🔥 TOP BAR -->
    <div class="top-bar">

        <!-- TITULO -->
        <div class="title-container">
            <i class="fas fa-layer-group title-icon"></i>
            <div class="title-divider"></div>
            <div class="title-text">
                <span class="ar">AR</span>
                <span class="main">Suite de Sistemas</span>
            </div>
        </div>

        <!-- USUARIO -->
        <div class="user-area">
            <i class="fas fa-bell" title="Notificaciones"></i>

            <span>
                <i class="fas fa-user-circle"></i> Ivan
            </span>

            <i class="fas fa-sign-out-alt" title="Cerrar sesión"></i>
        </div>

    </div>

    <div class="subtitle">
        Plataforma tecnológica corporativa de Acurio Restaurantes
    </div>

    <!-- SISTEMAS -->
    <div class="grid">

        <div class="card" onclick="go('arecetas')">
            <i class="fas fa-utensils"></i>
            <h3 style="color: #800080">ARECETAS</h3>
            <p style="color: #800080">Gestión de recetas</p>
        </div>

        <div class="card" onclick="go('armanto')">
            <i class="fas fa-box"></i>
            <h3 style="color: #800080">ARMANTO</h3>
            <p style="color: #800080">Pedidos y armado</p>
        </div>

        <div class="card" onclick="go('arcompras')">
            <i class="fas fa-cart-shopping"></i>
            <h3 style="color: #800080">ARCOMPRAS</h3>
            <p style="color: #800080">Gestión de compras</p>
        </div>

        <div class="card" onclick="go('arproduccion')">
            <i class="fas fa-industry"></i>
            <h3 style="color: #800080">ARPRODUCCIÓN</h3>
            <p style="color: #800080">Producción</p>
        </div>

        <div class="card" onclick="go('arinventario')">
            <i class="fas fa-warehouse"></i>
            <h3 style="color: #800080">ARINVENTARIO</h3>
            <p style="color: #800080">Inventario</p>
        </div>

        <div class="card" onclick="go('arreportes')">
            <i class="fas fa-chart-line"></i>
            <h3 style="color: #800080">ARREPORTES</h3>
            <p style="color: #800080">Indicadores</p>
        </div>

        <div class="card" onclick="go('arusuarios')">
            <i class="fas fa-users"></i>
            <h3 style="color: #800080">ARUSUARIOS</h3>
            <p style="color: #800080">Accesos</p>
        </div>

        <div class="card" onclick="go('arconfig')">
            <i class="fas fa-cogs"></i>
            <h3 style="color: #800080">ARCONFIG</h3>
            <p style="color: #800080">Configuración</p>
        </div>

    </div>

    <div class="footer">
        © 2026 Acurio Restaurantes
    </div>

</div>

<script>
function go(modulo){
    window.location.href = "/" + modulo;
}
</script>

</body>
</html>