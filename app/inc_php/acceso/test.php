<?php




    require_once '../../../config/config.php';
    include_once INC_PHP_DIR.'obtenerRutaRelativa.php';
    require_once INC_PHP_DIR.'Login.class.php';

    $casoConsulta       = "validarAcceso";
    $cedula             = "3123";
    $nombre             = "1231";
    $apellido           = "123123";
    $correo             = "321321";
    $idUsuario          = 'luis@admin.com';
    $pswUser            = '1234';

    $registroUsuario = Login::login();

    $registro = $registroUsuario->registro_users($cedula,$nombre,$apellido,$correo,$pswUser);

    if($registro == TRUE)
    {
        $combos = array($_SESSION['correo']);
    }else{

        $combos = "";
    }


    echo phpversion();



if($error){
    $response = array('success' => false, 'error' => $error['message'].' '.$error['sqltext']);
    echo json_encode($response);
}
else{
    $response = array('success' => true, 'usuario' => $registro);
    echo json_encode($response);
}
