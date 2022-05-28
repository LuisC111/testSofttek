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
    <link rel="stylesheet" href="<!--{$APP_CSS}-->accesoLogin.css"/>
    <link rel="stylesheet" href="<!--{$AUX_CSS}-->bootstrap_v5.0.2/bootstrap.min.css"/>
    <script type="text/javascript" src="<!--{$AUX_JS}-->jquery_v3.6.0/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->fontawesome_v6.0/fontawesome.js"></script>
</head>

<body>
    <section class="vh-100 seccionPadre" id="login">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
              <div class="card" style="border-radius: 1rem;">
                <div class="row g-0">
                  <div class="col-md-6 col-lg-5 d-none d-md-block">
                    <img src="<!--{$imgLogin}-->"
                      alt="Formulario de login" class="img-fluid img-login" />
                  </div>

                  <div class="col-md-6 col-lg-7 d-flex align-items-center">

                    <div class="card-body p-4 p-lg-5 text-black">
      
                        <form id="frmAccesoLogin" name="frmAccesoLogin" method="POST" action="<!--{$accion}-->" enctype="multipart/form-data" class="px-5 pb-5">
      
                        <div class="d-flex align-items-center mb-3 pb-1">
                            <img class="icono-login" src="<!--{$icono}-->" />
                          <span class="h1 fw-bold mb-0">Softtek</span>
                        </div>
      
                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;color:#1689fc;">Inicia sesión</h5>
                        
                        <div class="form-outline mb-4">
                          <input type="email" id="email" class="form-control form-control-lg" minlength="4" maxlength="100" placeholder="Correo electrónico" />
                        </div>
      
                        <div class="form-outline mb-4">
                          <input type="password" id="pass" class="form-control form-control-lg" minlength="4" maxlength="24" placeholder="Contraseña" />
                        </div>
      
                        <div class="pt-1 mb-4">
                          <button class="btn btn-dark btn-lg btn-block" type="submit" id="btnEntrar">Ingresar</button>
                        </div>

                        <div id="divAlert" class="alert alert-danger" role="alert" style="display:none">
                            <strong>Atención</strong>
                            <br/>
                            <span id="spmError"></span>
                        </div>   
      
                        <p style="color: #393f81;">¿No tienes una cuenta?
                            <a id="btnRegistro" style="color: #1689fc;font-weight: bold;cursor: pointer;"">Registrate aquí</a></p>
                        <a class="small datos alertaDatos" >Tratamiento de datos</a>
                      </form>
      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>



      <section class="vh-fluid seccionPadre" id="registro" style="display: none">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
              <div class="card" style="border-radius: 1rem;">
                <div class="row g-0">
                  <div class="col-md-6 col-lg-5 d-none d-md-block">
                    <img src="<!--{$imgRegistro}-->"
                      alt="Formulario de login" class="img-fluid img-login" />
                  </div>
                  <div class="col-md-6 col-lg-7 d-flex align-items-center">
                    <div class="card-body p-4 p-lg-5 text-black">
      
                        <form id="frmAccesoRegistro" name="frmAccesoRegistro" method="POST" action="<!--{$accion}-->" enctype="multipart/form-data" class="px-5 pb-5">
      
                        <div class="d-flex align-items-center mb-3 pb-1">
                            <img class="icono-login" src="<!--{$icono}-->" />
                          <span class="h1 fw-bold mb-0">Softtek</span>
                        </div>
      
                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;color:#1689fc;">¡Registrate!</h5>

                        <div class="form-outline mb-4">
                          <input type="number" id="cedulaRegistro" class="form-control form-control-lg" minlength="4" maxlength="12" placeholder="Cédula" />
                        </div>

                        <div class="form-outline mb-4">
                          <input type="email" id="nombreRegistro" class="form-control form-control-lg" minlength="4" maxlength="100" placeholder="Nombre(s) Completo" />
                        </div>

                        <div class="form-outline mb-4">
                          <input type="email" id="apellidoRegistro" class="form-control form-control-lg" minlength="4" maxlength="100" placeholder="Apellido(s) Completo" />
                        </div>

      
                        <div class="form-outline mb-4">
                          <input type="email" id="emailRegistro" class="form-control form-control-lg" minlength="4" maxlength="100" placeholder="Correo electrónico" />
                        </div>
      
                        <div class="form-outline mb-4">
                          <input type="password" id="passRegistro" class="form-control form-control-lg" minlength="4" maxlength="24" placeholder="Contraseña" />
                        </div>
      
                        <div class="pt-1 mb-4">
                          <button  type="submit" class="btn btn-dark btn-lg btn-block" id="btnRegistrar">Registrarme</button>
                        </div>

                        <div id="divAlert" class="alert alert-danger" role="alert" style="display:none">
                            <strong>Atención</strong>
                            <br/>
                            <span id="spmError"></span>
                        </div>   
      
                        <p style="color: #393f81;">¿Ya tienes una cuenta? 
                            <a id="btnLogin" style="color: #1689fc;font-weight: bold;cursor: pointer;">Inicia sesión aquí</a></p>
                        <a class="small datos alertaDatos" >Tratamiento de datos</a>
                      </form>
      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

    <script type="text/javascript" src="<!--{$APP_JS}-->accesoLogin.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->bootstrap_v5.0.2/bootstrap.min.js"></script>
    <script type="text/javascript" src="<!--{$AUX_JS}-->sweetalert2/sweetalert2.all.min.js"></script>

</body>

</html>