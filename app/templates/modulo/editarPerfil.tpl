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
    <link rel="stylesheet" href="<!--{$APP_CSS}-->editarPerfil.css"/>
    <link rel="stylesheet" href="<!--{$AUX_CSS}-->bootstrap_v5.0.2/bootstrap.min.css"/>
    <link href="<!--{$AUX_FONTS}-->sourceSansPro/font.css" rel="stylesheet" />
    <script type="text/javascript" src="<!--{$AUX_JS}-->jquery_v3.6.0/jquery-3.6.0.min.js"></script>
</head>
<section style="background-color: #eee;">
    <div class="container py-5">
      <div class="row">
        <div class="col">
          <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
            <ol class="breadcrumb mb-0">
              <li class="breadcrumb-item"><a href="modulo.php">Panel de usuarios</a></li>
              <li class="breadcrumb-item active" aria-current="page">Editar perfil</li>
            </ol>
          </nav>
        </div>
      </div>
  
      <div class="row">
        <div class="col-lg-4">
          <div class="card mb-4">
            <div class="card-body text-center">
              <img src="<!--{$user}-->" alt="user"
                class="rounded-circle img-fluid" style="width: 150px;">
              <h5 class="my-3"><!--{$nombre}--> <!--{$apellido}--></h5>
              <p class="text-muted mb-1"><!--{$cedula}--></p>
              <p class="text-muted mb-4"><!--{$correo}--></p>
            </div>
          </div>
         
        </div>
        <div class="col-lg-8">
          <div class="card mb-4">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-3">
                      <p class="mb-0">Cedula</p>
                    </div>
                    <div class="col-sm-9">
                      <input type="text" name="cedula" id="cedula" value="<!--{$cedula}-->"/>
                    </div>
                  </div>
                  <hr>
              <div class="row">
                <div class="col-sm-3">
                  <p class="mb-0">Nombre(s)</p>
                </div>
                <div class="col-sm-9">
                  <input type="text" name="nombre" id="nombre" value="<!--{$nombre}-->"/>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <p class="mb-0">Apellido(s)</p>
                </div>
                <div class="col-sm-9">
                    <input type="text" name="apellido" id="apellido" value ="<!--{$apellido}-->"/>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <p class="mb-0">Correo</p>
                </div>
                <div class="col-sm-9">
                    <input type="email" name="correo" id="correo" value="<!--{$correo}-->"/>
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="col-sm-3">
                  <p class="mb-0">Contraseña</p>
                </div>
                <div class="col-sm-9">
                    <input type="password" name="pass" id="pass"/>
                </div>
              </div>
              <hr>

              <button class="btn btn-primary float-right" id="btnEditar">Actualizar Datos</button>
              
            </div>
          </div>
        
             
  </section>


    

  
    <script type="text/javascript" src="<!--{$APP_JS}-->panelUsuario.js"></script>
    <script type="text/javascript" src="<!--{$APP_JS}-->acceso.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->bootstrap_v5.0.2/bootstrap.min.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->sweetalert2/sweetalert2.all.min.js"></script>

  
</body>

</html>