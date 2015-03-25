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

  $sNombre = $pParam['nombrol'];
  $sNewNombre = $pParam['nnombre'];

  if(
     ($sNombre == '') or 
     ($sNewNombre == '')
  ){

    $sMensaje =
      'El nombre y la actualizacion '.
      'del rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
	  
	  $database->update("roles", [
"nombrol" => $sNewNombre,
],[
"nombrol" => $sNombre
]);
echo "Rol: \"" . $sNombre . "\" fue actualizado con \"" . $sNewNombre . "\" ";


  }

}




?>

<html>
<head>
  <title>Actualizar nombre del rol</title>
</head>

<body>
<form name="roles" method="get">
  <strong>Nombre Actual:</strong><br>
  <input type="text" name="nombrol">
  <br/>
  <strong>Nobre Nuevo:</strong><br>
  <input type="text" name="nnombre">
  <br/>
  <input type="submit" value="Guardar">
</form>
</body>
</html>
