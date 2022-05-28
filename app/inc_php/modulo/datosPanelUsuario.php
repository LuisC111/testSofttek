<?php

error_reporting(E_ALL ^ E_NOTICE);

    require_once '../../../config/config.php';
    include_once INC_PHP_DIR.'obtenerRutaRelativa.php';
    require_once INC_PHP_DIR.'Login.class.php';

    $casoConsulta       = $_POST['casoConsulta'];
    

    try {
        $conn = new PDO('mysql:host=localhost;dbname=softtek','root');
    } catch (PDOException $exception) {
        die($exception->getMessage());
    }
    $sql = "SELECT * FROM usuario";
    $st = $conn->query($sql);
    if ($st) {

        // $rs = $st->fetchAll(PDO::FETCH_ASSOC);
        $rs = $st->fetchAll(PDO::FETCH_FUNC, fn($id, $cedula, $nombre, $apellido, $correo, $fechaRegistro, $idRol) => [$id, $cedula, $nombre.' '.$apellido, $correo, $fechaRegistro, $idRol] );        //asigno el resultado de la consulta a un array asocitaivo
        


        echo json_encode([
            'data' => $rs,
        ]);
    } else {
        var_dump($conn->errorInfo());
        die;
    }

    switch ($casoConsulta){

        case 'cerrarSesion':

           session_destroy();

        break;

        
        

      

       

    }

        





// if($error){
//     $response = array('success' => false, 'error' => $error['message'].' '.$error['sqltext']);
//     echo json_encode($response);
// }
// else{
//     $response = array('success' => true, 'combos' => $combos);
//     echo json_encode($response);
// }
