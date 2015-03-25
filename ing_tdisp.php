<html>
<head>
  <title>Ingresar nuevo tipo de dispositivo</title>
</head>

<body>
<form name="tdisp" method="post">
  <strong>Tipo de dispositivo:</strong><br>
  <input type="text" name="dispositivo">
  <br/>
  <strong>Descripcion:</strong><br>
  <input type="text" name="descripcion">
  <br/>
  <input type="submit" value="Guardar">
</form>
</body>
</html>



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

  $sTDisp = $pParam['dispositivo'];
  $sDescripcion = $pParam['descripcion'];

  if(
     ($sTDisp == '') or 
     ($sDescripcion == '')
  ){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
	  
	  $database->insert("TipoDispositivo", [
"TipoDispositivo" => $sTDisp,
"descripcion" => $sDescripcion
]);
echo "Nuevo tipo de dispositivo insertado" . "<br>";
echo "Nombre del Dispositivo: " . $sTDisp . "<br>";
echo "Descripcion del Dispositivo: " . $sDescripcion . "<br>";


  }

}




?>
