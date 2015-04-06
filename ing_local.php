<html>
<head>
  <title>Ingresar nuevo local</title>
</head>

<body>
<form name="local" method="post">
  <strong>Nombre del local:</strong><br>
  <input type="text" name="nomblocal">
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

  $sNombre = $pParam['nomblocal'];
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
	  
	  $database->insert("CLibertad", [
"local" => $sNombre,
"descripcion" => $sDescripcion 
]);
echo "Nuevo local insertado" . "<br>";
echo "Nombre del local: " . $sNombre . "<br>";
echo "Descripcion del local: " . $sDescripcion . "<br>"; 


  }

}




?>
