<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="main3.aspx.vb" Inherits="ARSuite.main3" %>

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

        /* SECCIÓN INFERIOR (NUEVO 🔥) */
        .section-team {
            margin-top: 60px;
            height: 300px;
            background-image: url('Fondo_Sistemas/fondo_equipo.jpg'); /* CAMBIA ESTA IMAGEN */
            background-size: cover;
            background-position: center;
            background-attachment: fixed; /* efecto parallax 🔥 */
            position: relative;
            border-radius: 12px;
            overflow: hidden;
        }

        .section-team::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.55); /* overlay */
        }

        .section-content {
            position: relative;
            z-index: 2;
            color: white;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        .section-content h5 {
            font-weight: 600;
        }

        .section-content p {
            font-size: 0.9rem;
            opacity: 0.85;
        }

    </style>
</head>

<body>
<form id="form1" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="container py-4">

    <!-- TITLE -->
    <div class="text-center mb-3">
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
                <div class="app-icon"><i class="bi bi-collection"></i></div>
                <div class="app-label">Sorprende</div>
            </a>
        </div>

        <div class="col-md-2 col-4">
            <a href="Gestion_manuales_p.aspx" class="app-link">
                <div class="app-icon"><i class="bi bi-book"></i></div>
                <div class="app-label">AReclamos</div>
            </a>
        </div>

        <div class="col-md-2 col-4">
            <a href="main.aspx" class="app-link">
                <div class="app-icon"><i class="bi bi-graph-up"></i></div>
                <div class="app-label">Data Maestra</div>
            </a>
        </div>

        <div class="col-md-2 col-4">
            <a href="main.aspx" class="app-link">
                <div class="app-icon"><i class="bi bi-gear"></i></div>
                <div class="app-label">Inventa</div>
            </a>
        </div>

    </div>

    <!-- 🔥 NUEVA SECCIÓN INFERIOR -->
    <div class="section-team mt-5">
        <div class="section-content">
            <div>
                <h5>Impulsando la innovación en Acurio Restaurantes</h5>
                <p>
                    ARSuite conecta personas, procesos y tecnología para mejorar la operación
                    y fortalecer el trabajo en equipo.
                </p>
            </div>
        </div>
    </div>

</div>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>