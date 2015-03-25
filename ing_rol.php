<html>
<head>
  <title>Ingresar nuevo rol</title>
</head>

<body>
<form name="roles" method="post">
  <strong>Nombre:</strong><br>
  <input type="text" name="nombrol">
  <br/>
  <strong>Descripción:</strong><br>
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

  $sNombre = $pParam['nombrol'];
  $sDescripcion = $pParam['descripcion'];

  if(
     ($sNombre == '') or 
     ($sDescripcion == '')
  ){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
	  
	  $database->insert("roles", [
"nombrol" => $sNombre,
"descripcion" => $sDescripcion
]);
echo "Nuevo rol insertado" . "<br>";
echo "Nombre del Rol: " . $sNombre . "<br>";
echo "Descripcion del Rol: " . $sDescripcion . "<br>";


  }

}




?>


