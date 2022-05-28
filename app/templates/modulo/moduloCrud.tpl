<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title><!--{$titulo}--></title>
    <link rel="icon" href="<!--{$fav}-->" type="image/x-icon">
    <meta name="description" content="Prueba técnica PHP | Softtek" />
    <meta name="author" content="Luis Carlos Martínez Guzman" />
    <link rel="stylesheet" href="<!--{$APP_CSS}-->datable.css"/>
    <link rel="stylesheet" type="text/css" href="<!--{$AUX_CSS}-->datatables_v1.12/jquery.dataTables.css">
    <link rel="stylesheet" href="<!--{$AUX_CSS}-->tailwindcss_v2.2/tailwind.min.css"/>
    <link href="<!--{$AUX_FONTS}-->sourceSansPro/font.css" rel="stylesheet" />
    <script type="text/javascript" src="<!--{$AUX_JS}-->jquery_v3.6.0/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div class="container" style="margin:auto;display:block;margin-top:5%;">


    <table id="theTable" class="display" style="width: 100%">
        
        <thead>
            <tr>
                <th>ID</th>
                <th>Cedula</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Fecha de Registro</th>
                <th>Id Rol</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>ID</th>
                <th>Cedula</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Fecha de Registro</th>
                <th>Id Rol</th>
            </tr>
        </tfoot>
    </table>

    </div>
    <script type="text/javascript" src="<!--{$APP_JS}-->panelUsuario.js"></script>
    <script type="text/javascript" src="<!--{$APP_JS}-->acceso.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->dropdownList/dropdown.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->datatables_v1.12/jquery.dataTables.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->sweetalert2/sweetalert2.all.min.js"></script>

  
</body>

</html>