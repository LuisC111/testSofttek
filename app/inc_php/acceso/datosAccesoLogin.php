<?php

error_reporting(E_ALL ^ E_NOTICE);

if ($_POST['usuario'] && $_POST['contrasena']){

    require_once '../../../config/config.php';
    include_once INC_PHP_DIR.'obtenerRutaRelativa.php';
    require_once INC_PHP_DIR.'Login.class.php';

    $casoConsulta       = $_POST['casoConsulta'];
    $cedula             = $_POST['cedula'];
    $nombre             = $_POST['nombre'];
    $apellido           = $_POST['apellido'];
    $correo             = $_POST['usuario'];
    $pass               = $_POST['contrasena'];
    $pswUser            = md5($pass);

    switch ($casoConsulta){

        case 'validaAcceso':

            $validarAcceso = Login::login();

            $acceso = $validarAcceso->login_users($correo,$pswUser);

            if($acceso == TRUE)
            {
                $combos = array("id" => $_SESSION['id'],"correo" => $_SESSION['correo'], "rol" => $_SESSION['rol'], "nombre" => $_SESSION['nombre'], "apellido" => $_SESSION['apellido'], "pass" => $_SESSION['pass']);
                
            }else{
                $combos = "";
            }

        break;

        case 'registroUsuario':

            $registroUsuario = Login::login();

            $registro = $registroUsuario->registro_users($cedula,$nombre,$apellido,$correo,$pswUser);

            if($registro == true)
            {
                $combos = array($_SESSION['correo']);
            }else{

                $combos = "";
            }

        break;

       

    }

        


}


if($error){
    $response = array('success' => false, 'error' => $error['message'].' '.$error['sqltext']);
    echo json_encode($response);
}
else{
    $response = array('success' => true, 'combos' => $combos);
    echo json_encode($response);
}
