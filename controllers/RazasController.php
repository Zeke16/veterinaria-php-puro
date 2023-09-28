<?php
include $_SERVER['DOCUMENT_ROOT'] . '/veterinaria-php-puro/db/db.php';

function obtenerRazas()
{
    $query = "SELECT tbl_especies.nombre as especie, tbl_razas.nombre, tbl_razas.estado, tbl_razas.fecha 
    FROM tbl_razas INNER JOIN tbl_especies ON tbl_especies.id_especie = tbl_razas.id_especie";
    $ejecutar = conectarDb()->prepare($query);
    $ejecutar->execute();
    $data = $ejecutar->fetchAll(PDO::FETCH_OBJ);
    
    return $data;
}
