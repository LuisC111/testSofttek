<?php
error_reporting(0);

require_once '../config/config.php';
include_once INC_PHP_DIR.'obtenerRutaRelativa.php';


$RUTA_ARCHIVO   = dirname(__FILE__);
$rutaImagenes   = obtenerRutaRelativa($RUTA_ARCHIVO, IMAGENES_DIR);
$rutaAuxCss     = obtenerRutaRelativa($RUTA_ARCHIVO, AUX_CSS);
$rutaAuxJs      = obtenerRutaRelativa($RUTA_ARCHIVO, AUX_JS);
$rutaAppCss     = obtenerRutaRelativa($RUTA_ARCHIVO, CSS_DIR);
$rutaAppJs      = obtenerRutaRelativa($RUTA_ARCHIVO, JS_DIR);

$titulo = 'Iniciar sesión | Softtek';


$smarty->assign("sid"                   , SID);
$smarty->assign('titulo'                , $titulo);
$smarty->assign('AUX_CSS'               , $rutaAuxCss);
$smarty->assign('AUX_JS'                , $rutaAuxJs);
$smarty->assign('AUX_FONTS'             , $rutaAuxFonts);
$smarty->assign('APP_CSS'               , $rutaAppCss);
$smarty->assign('APP_JS'                , $rutaAppJs);
$smarty->assign('APP_IMG'              	, $rutaImagenes);
$smarty->assign('icono'         		, $rutaImagenes.'icono.png');
$smarty->assign('fav'         			, $rutaImagenes.'icono.ico');
$smarty->assign('imgLogin'         		, $rutaImagenes.'imgLogin.png');
$smarty->assign('imgRegistro'         	, $rutaImagenes.'imgRegistro.png');
$smarty->assign('accion'         		, '../modulo/modulo.php');

$smarty->display('acceso/accesoLogin.tpl');
