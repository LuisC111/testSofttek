<?php

/*  
 * Funcion temporal para correxi�n de incidencia con caracteres utf8 insertados en bd como texto.
 */

function eliminarCaracteresEspeciales($string) {
    $string = trim($string);
    $string = str_replace(array('�', '�', '�', '�', '�', '�', '�', '�', '�'), array('a', 'a', 'a', 'a', 'a', 'A', 'A', 'A', 'A'), $string);
    $string = str_replace(array('�', '�', '�', '�', '�', '�', '�', '�'), array('e', 'e', 'e', 'e', 'E', 'E', 'E', 'E'), $string);
    $string = str_replace(array('�', '�', '�', '�', '�', '�', '�', '�'), array('i', 'i', 'i', 'i', 'I', 'I', 'I', 'I'), $string);
    $string = str_replace(array('�', '�', '�', '�', '�', '�', '�', '�'), array('o', 'o', 'o', 'o', 'O', 'O', 'O', 'O'), $string);
    $string = str_replace(array('�', '�', '�', '�', '�', '�', '�', '�'), array('u', 'u', 'u', 'u', 'U', 'U', 'U', 'U'), $string);
    $string = str_replace(array('�', '�', '�', '�'), array('n', 'N', 'c', 'C',), $string);
    $string = str_replace(array("\\", "�", "�", "~","#", "|", "\"", "$", "%", "&", "//","(", ")", "'", "[", "^", "<code>", "insert", "update", "delete", "]", "}", "{", "�", "�",">", "< ", "   "), ' ', $string);
    return $string;
}
