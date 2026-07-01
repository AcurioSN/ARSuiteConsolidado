<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="ARSuite.login" %>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Suite AR</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
		<!--end::Global Stylesheets Bundle-->
		<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

/* =========================
   HTML / BODY
========================= */

html{

    height:100%;

    overflow-x:hidden;
    overflow-y:auto;
}

body{

    min-height:100vh;

    overflow:hidden;

    font-family:'Segoe UI',sans-serif;

    background:
    linear-gradient(
    135deg,
    rgba(35,0,28,0.82),
    rgba(95,0,70,0.72)
    ),

    url('https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2070&auto=format&fit=crop') center center/cover no-repeat;

    display:flex;
    align-items:center;
    justify-content:center;

    position:relative;
}

/* =========================
   OVERLAY LIGHT
========================= */

body::before{

    content:'';

    position:absolute;

    inset:0;

    background:
    radial-gradient(circle at top left,
    rgba(255,255,255,0.10),
    transparent 35%),

    radial-gradient(circle at bottom right,
    rgba(255,255,255,0.08),
    transparent 30%);

    pointer-events:none;
}

/* =========================
   GLOW
========================= */

.glow{

    position:absolute;

    border-radius:50%;

    filter:blur(80px);

    animation:float 10s ease-in-out infinite;

    pointer-events:none;
}

.glow1{

    width:500px;
    height:500px;

    background:rgba(255,255,255,0.06);

    top:-180px;
    left:-180px;
}

.glow2{

    width:350px;
    height:350px;

    background:rgba(255,255,255,0.05);

    bottom:-120px;
    right:-120px;

    animation-delay:2s;
}

@keyframes float{

    0%{transform:translateY(0px);}
    50%{transform:translateY(20px);}
    100%{transform:translateY(0px);}
}

/* =========================
   LOGIN WRAPPER
========================= */

.login-wrapper{

    width:980px;

    min-height:540px;

    display:flex;

    overflow:hidden;

    border-radius:34px;

    background:rgba(255,255,255,0.08);

    backdrop-filter:blur(24px);

    -webkit-backdrop-filter:blur(24px);

    border:1px solid rgba(255,255,255,0.10);

    box-shadow:
    0 30px 80px rgba(0,0,0,0.45);

    position:relative;

    z-index:5;
}

/* =========================
   LEFT PANEL
========================= */

.left-panel{

    flex:1;

    padding:56px;

    display:flex;
    flex-direction:column;
    justify-content:center;

    color:white;

    position:relative;
}

/* GLASS SHAPE */

.left-panel::before{

    content:'';

    position:absolute;

    width:300px;
    height:300px;

    border-radius:50%;

    background:rgba(255,255,255,0.04);

    top:-100px;
    right:-100px;

    filter:blur(20px);
}

/* =========================
   BRAND
========================= */

.brand{

    display:flex;
    align-items:center;

    gap:16px;

    margin-bottom:26px;
}

.brand-icon{

    width:68px;
    height:68px;

    border-radius:22px;

    background:rgba(255,255,255,0.12);

    display:flex;
    align-items:center;
    justify-content:center;

    font-size:30px;

    backdrop-filter:blur(10px);

    box-shadow:
    0 10px 24px rgba(0,0,0,0.18);
}

.brand h1{

    font-size:46px;
    font-weight:700;

    letter-spacing:1px;
}

/* =========================
   SUBTITLE
========================= */

.subtitle{

    font-size:14px;

    line-height:1.9;

    opacity:0.82;

    max-width:430px;
}

/* =========================
   FEATURES
========================= */

.features{

    margin-top:34px;

    display:flex;
    flex-direction:column;

    gap:14px;
}

.feature{

    display:flex;
    align-items:center;

    gap:12px;

    font-size:12px;

    opacity:0.92;
}

.feature i{

    width:32px;
    height:32px;

    border-radius:10px;

    background:rgba(255,255,255,0.10);

    display:flex;
    align-items:center;
    justify-content:center;
}

/* =========================
   RIGHT PANEL
========================= */

.right-panel{

    width:360px;

    background:rgba(255,255,255,0.10);

    border-left:
    1px solid rgba(255,255,255,0.08);

    display:flex;
    align-items:center;
    justify-content:center;

    padding:34px;
}

/* =========================
   LOGIN BOX
========================= */

.login-box{

    width:100%;

    max-width:280px;
}

/* =========================
   TITLES
========================= */

.login-title{

    font-size:28px;
    font-weight:700;

    color:white;

    margin-bottom:4px;
}

.login-subtitle{

    font-size:12px;

    color:rgba(255,255,255,0.72);

    margin-bottom:24px;
}

/* =========================
   LABELS
========================= */

.lbl{

    display:block;

    margin-bottom:7px;

    font-size:11px;
    font-weight:600;

    color:rgba(255,255,255,0.82);

    letter-spacing:0.4px;
}

/* =========================
   INPUTS
========================= */

.input-group{

    position:relative;

    margin-bottom:16px;
}

.input-group i{

    position:absolute;

    left:14px;
    top:50%;

    transform:translateY(-50%);

    color:rgba(255,255,255,0.60);

    font-size:13px;
}

.input-text{

    width:100%;

    height:50px;

    padding:0 16px 0 42px;

    border:none;

    border-radius:16px;

    background:rgba(255,255,255,0.16);

    border:1px solid rgba(255,255,255,0.14);

    backdrop-filter:blur(10px);

    color:white;

    font-size:13px;

    outline:none;

    transition:0.30s;
}

.input-text::placeholder{

    color:rgba(255,255,255,0.62);
}

.input-text:focus{

    background:rgba(255,255,255,0.22);

    border:1px solid rgba(255,255,255,0.24);

    box-shadow:
    0 0 0 4px rgba(255,255,255,0.04),
    0 8px 24px rgba(0,0,0,0.16);
}

/* =========================
   BUTTON
========================= */

.btn-login{

    width:100%;

    height:50px;

    border:none;

    border-radius:16px;

    background:
    linear-gradient(
    135deg,
    #E11784,
    #BC70C7
    );

    color:white;

    font-size:13px;
    font-weight:600;

    cursor:pointer;

    transition:0.30s;

    margin-top:6px;
}

.btn-login:hover{

    transform:translateY(-2px);

    box-shadow:
    0 12px 28px rgba(0,0,0,0.30);
}

/* =========================
   LINKS
========================= */

.extra{

    margin-top:18px;

    display:flex;
    justify-content:space-between;

    font-size:11px;
}

.extra a{

    color:rgba(255,255,255,0.70);

    text-decoration:none;

    transition:0.25s;
}

.extra a:hover{

    color:white;
}

/* =========================
   FOOTER
========================= */

.footer{

    margin-top:24px;

    text-align:center;

    font-size:10px;

    line-height:1.8;

    color:rgba(255,255,255,0.42);
}

/* =========================
   RESPONSIVE HORIZONTAL
========================= */

@media(max-width:900px){

    .login-wrapper{

        width:92%;

        height:auto;

        flex-direction:column;
    }

    .left-panel{

        padding:38px;
    }

    .right-panel{

        width:100%;
    }

    .brand h1{

        font-size:36px;
    }
}

/* =========================
   RESPONSIVE VERTICAL
========================= */

@media(max-height:700px){

    html{

        overflow-y:auto;
    }

    body{

        align-items:flex-start;

        min-height:auto;

        padding:20px 0;
    }

    .login-wrapper{

        margin:20px auto;
    }
}



.captcha-container {
    transform: scale(0.90);
    transform-origin: left top;
}


</style>

</head>

<body>
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="glow glow1"></div>
<div class="glow glow2"></div>

<div class="login-wrapper">

    <!-- LEFT -->

    <div class="left-panel">

        <div class="brand">

            <div class="brand-icon">
                <i class="bi bi-grid-3x3-gap-fill"></i>
            </div>

            <div>
                <h1>Suite AR</h1>
            </div>

        </div>

        <div class="subtitle">

            Plataforma tecnológica corporativa de Acurio Restaurantes.
            Centraliza sistemas operativos, administrativos y de gestión empresarial
            en una experiencia moderna, segura e integrada.

        </div>

        <div class="features">

            <div class="feature">
                <i class="bi bi-shield-lock"></i>
                <span>Acceso corporativo seguro</span>
            </div>

            <div class="feature">
                <i class="bi bi-grid"></i>
                <span>Integración de módulos empresariales</span>
            </div>

            <div class="feature">
                <i class="bi bi-lightning-charge"></i>
                <span>Experiencia tecnológica unificada</span>
            </div>

        </div>

    </div>

    <!-- RIGHT -->

    <div class="right-panel">

        <div class="login-box">

            <div class="login-title">
                Bienvenido
            </div>

            <div class="login-subtitle">
                Inicie sesión para continuar
            </div>

            <!-- USER -->
<label class="lbl">
    Usuario
</label>

<div class="input-group">

    <i class="bi bi-person"></i>

    <asp:TextBox
        ID="txtUsuario"
        runat="server"
        CssClass="input-text"
        placeholder="Ingrese su usuario">
    </asp:TextBox>

</div>

<!-- PASSWORD -->

<label class="lbl">
    Clave
</label>

<div class="input-group">

    <i class="bi bi-shield-lock"></i>

    <asp:TextBox
        ID="txtPassword"
        runat="server"
        TextMode="Password"
        CssClass="input-text"
        placeholder="Ingrese su contraseña">
    </asp:TextBox>

</div>

<div class="pb-lg-0 pb-5">
    <div class="captcha-container">
        <div class="g-recaptcha" data-sitekey="<%= Session("clave_sitio") %>"></div>
    </div>
</div>

            <!-- BUTTON -->

            <%--<button class="btn-login">
                Ingresar a Suite AR
            </button>--%>
            <asp:LinkButton
                ID="btnLogin"
                runat="server"
                CssClass="btn-login"
                style="display:flex; align-items:center; justify-content:center; text-decoration:none;">

                Ingresar a Suite AR

            </asp:LinkButton>

            <!-- EXTRA -->

            <div class="extra">

                <a href="main.aspx">
                    <i class="bi bi-arrow-left"></i>
                    Volver
                </a>

                <a href="main.aspx">
                    ¿Necesitas ayuda?
                </a>

            </div>
							<br />

							<asp:Label ID="lblMensajeError" runat="server" Text="" class="form-label fs-7 fw-bolder text-danger pt-8" Visible="false"></asp:Label>
							<br />
							<asp:Label ID="lblMensajeError2" runat="server" Text="" class="form-label fs-7 fw-bolder text-danger pt-8" Visible="false"></asp:Label>
            <!-- FOOTER -->

            <div class="footer">

                © 2026 Suite AR<br>
                Desarrollo e Innovación · Acurio Restaurantes

            </div>

        </div>

    </div>

</div>
</form>
    <div id="toastGuardado" runat="server" class="toast-success">
	Se guardó exitosamente
</div>

<style>
	.toast-success {
		position: fixed;
		bottom: 20px;
		right: 20px;
		background: #dc3545;
		color: white;
		padding: 14px 22px;
		border-radius: 10px;
		font-size: 14px;
		box-shadow: 0 4px 12px rgba(0,0,0,0.25);
		opacity: 0;
		visibility: hidden;
		transition: all 0.4s ease;
		z-index: 9999;
	}

	.toast-success.show {
		opacity: 1;
		visibility: visible;
	}
</style>
    <script>
	function mostrarToastGuardado() {

		var toast = document.getElementById("toastGuardado");

		toast.classList.add("show");

		setTimeout(function () {
			toast.classList.remove("show");
		}, 3000);

	}
    </script>

</body>

</html>
