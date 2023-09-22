<?php
include '../../db/db.php';
require  '../../constantes.php';
$css = CDN_BS_CSS;
$js = CDN_BS_JS;
$icons = CDN_ICONOS;
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    //Crear la ruta/directorio donde se guardara la imagen
    $carpeta = 'imagenes';

    //Separar la extension
    $infoExtension = explode(".", $_FILES["imagenes"]["name"]);

    //Extension de la imagen
    $extension = $infoExtension[1];

    $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyz';
    //Generar nombre aleatorio de imagen
    $aleatorio = substr(str_shuffle($permitted_chars), 0, 10);

    //Crear la ruta de la imagen con la instancia a guardar
    $imagen = $carpeta . "/" . $aleatorio . "." . $extension;
    //imagenes/kjasnbfkjasnfkas.jpg

    //Instancia de subida de imagen
    $tmp = $_FILES["imagenes"]["tmp_name"];

    if (!file_exists($carpeta)) {
        mkdir($carpeta, 0777);

        if (!move_uploaded_file($tmp, $imagen)) {
            header('Location: index.php');
        }
    } else {
        if (!move_uploaded_file($tmp, $imagen)) {
            header('Location: index.php');
        }
    }

    $query = "INSERT INTO tbl_pacientes 
            (
                nombre, 
                enfermedades,
                vacunas, 
                id_raza, 
                imagen, 
                fecha_creacion, 
                fecha_actualizacion,
                creado_por,
                actualizado_por, 
                fecha
            ) VALUES
            (
                :nombre, 
                :enfermedades,
                :vacunas, 
                :id_raza, 
                :imagen, 
                :fecha_creacion, 
                :fecha_actualizacion, 
                :creado_por,
                :actualizado_por, 
                :fecha)";

    $data = [
        ':nombre' => 'Manchas',
        ':enfermedades' => 'Sarna',
        ':vacunas' => 'Rabia',
        ':id_raza' => 1,
        ':imagen' => $imagen,
        ':fecha_creacion' => date('Y-m-d H:i:s'),
        ':fecha_actualizacion' => date('Y-m-d H:i:s'),
        ':creado_por' => 1,
        ':actualizado_por' => 1,
        ':fecha' => date('Y-m-d')
    ];
    $stmt = $conn->prepare($query);
    $stmt->execute($data);
    header('Location: index.php');
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear paciente</title>
    <?= $css ?>
    <?= $icons ?>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFC0CB;">
        <a class="navbar-brand" href="../../index.php"> <img src="../../img/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">Veterinaria UNIVO</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item text-white">
                    <a class="nav-link" href="../especies/index.php">Especies</a>
                </li>
                <li class="nav-item text-white">
                    <a class="nav-link " href="../razas/index.php">Razas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php">Pacientes</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="row p-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-primary">
                    <h3 class="text-white">Crear paciente</h3>
                </div>
                <div class="card-body">
                    <form action="" enctype="multipart/form-data" method="post">
                        <div class="row">
                            <div class="col-md-6 mt-2">
                                Seleccionar imagen <input class="form-control" type="file" name="imagenes" id="imagenes">
                            </div>
                            <div class="col-md-12 mt-2">
                                <button class="btn btn-primary" type="submit">Enviar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?= $js ?>
</body>

</html>