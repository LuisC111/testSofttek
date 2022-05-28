<?php

error_reporting(0);
session_start();

if ($_SESSION['id']) {
    require_once '../config/config.php';
    include_once INC_PHP_DIR . 'obtenerRutaRelativa.php';

}else{
    header('Location: ../index.php');
}

$RUTA_ARCHIVO   = dirname(__FILE__);

$rutaImagenes   = obtenerRutaRelativa($RUTA_ARCHIVO, IMAGENES_DIR);
$rutaAuxCss     = obtenerRutaRelativa($RUTA_ARCHIVO, AUX_CSS);
$rutaAuxJs      = obtenerRutaRelativa($RUTA_ARCHIVO, AUX_JS);
$rutaAuxFonts  	= obtenerRutaRelativa($RUTA_ARCHIVO, AUX_FONTS);
$rutaAppCss     = obtenerRutaRelativa($RUTA_ARCHIVO, CSS_DIR);
$rutaAppJs      = obtenerRutaRelativa($RUTA_ARCHIVO, JS_DIR);


$titulo = 'Editar Perfil | Softtek';


$smarty->assign("sid"                   , SID);
$smarty->assign('titulo'                , $titulo);
$smarty->assign('AUX_CSS'               , $rutaAuxCss);
$smarty->assign('AUX_JS'                , $rutaAuxJs);
$smarty->assign('AUX_FONTS'             , $rutaAuxFonts);
$smarty->assign('APP_CSS'               , $rutaAppCss);
$smarty->assign('APP_JS'                , $rutaAppJs);
$smarty->assign('APP_IMG'              	, $rutaImagenes);
$smarty->assign('imagenLanding'         , $rutaImagenes.'panelUsuarios.png');
$smarty->assign('icono'         		, $rutaImagenes.'icono.png');
$smarty->assign('user'         		    , $rutaImagenes.'user.png');
$smarty->assign('fav'         			, $rutaImagenes.'icono.ico');
$smarty->assign('id'                    , $_SESSION['id']);
$smarty->assign('nombre'                , $_SESSION['nombre']);
$smarty->assign('apellido'              , $_SESSION['apellido']);
$smarty->assign('cedula'                , $_SESSION['cedula']);
$smarty->assign('correo'                , $_SESSION['correo']);
$smarty->assign('pass'                  , $_SESSION['pass']);


$smarty->display('modulo/editarPerfil.tpl');
