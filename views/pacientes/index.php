<?php
include '../../db/db.php';
require  '../../constantes.php';
$css = CDN_BS_CSS;
$js = CDN_BS_JS;
$icons = CDN_ICONOS;

$query = "SELECT * from tbl_pacientes";
$smt = $conn->prepare($query);
$smt->execute();
$data = $smt->fetchAll(PDO::FETCH_OBJ);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pacientes</title>
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
        <div class="col-md-11">
            <h1>Listado de pacientes</h1>
        </div>
        <div class="col-md-1 text-right">
            <a href="insert.php" class=" btn btn-primary text-center">Crear &nbsp; <i class="fas fa-plus"></i></a>
        </div>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-primary">
                    <h3 class="text-white">Listado de pacientes</h3>
                </div>
                <div class="card-body p-0">
                    <table class="table table-bordered table-stripped">
                        <thead class="thead-dark">
                            <th>Nombre: </th>
                            <th>Vacunas: </th>
                            <th>Enfermedades: </th>
                            <th>Fecha creacion: </th>
                            <th>Imagen</th>
                            <th>Acciones</th>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($data as $paciente) {
                            ?>
                                <tr>
                                    <td><?= $paciente->nombre ?></td>
                                    <td><?= $paciente->vacunas ?></td>
                                    <td><?= $paciente->enfermedades ?></td>
                                    <td><?= $paciente->fecha ?></td>
                                    <th><img src="<?= $paciente->imagen?>" class="img-fluid img-thumbnail" width="150px" height="150px"></th>
                                    <td><i class="fas fa-trash"></i><i class="fas fa-pencil"></i></td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <?= $js ?>
</body>

</html>