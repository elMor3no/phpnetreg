<?php 

//cargando clase de BD
require 'lib_conf/bd_conf.php';
$database = new medoo();
//fin de uso de BD

$pParam = FALSE;

if(count($_GET) != 0){
  $pParam = $_GET;
}elseif(count($_POST) != 0){
  $pParam = $_POST;
}

if($pParam != FALSE){

  $sVR = $pParam['vr'];
  
  if(
     ($sVR == '') 
){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
	  $database->insert("VRectoria", ["VRNombre" => $sVR]);
	  echo $sVR . " creada ";


  }

}




?>

<html>
<head>
  <title>Ingresar nuevo Vice Rectoria</title>
</head>

<body>
<form name="vicerectoria" method="post">
  <strong>Nombre de la VR:</strong><br>
  <input type="text" name="vr">
  <br/>
  <input type="submit" value="Guardar">
</form>
</body>
</html>
