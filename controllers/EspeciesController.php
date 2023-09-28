<?php
include $_SERVER['DOCUMENT_ROOT'] . '/veterinaria-php-puro/db/db.php';

function obtenerEspecies()
{
    $query = "SELECT * FROM tbl_especies";
    $ejecutar = conectarDb()->prepare($query);
    $ejecutar->execute();
    $data = $ejecutar->fetchAll(PDO::FETCH_OBJ);

    return $data;
}
