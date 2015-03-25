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

  $sArea = $pParam['name_area'];
  $sIdLocal = $pParam['local_area'];
  $sDescripcion = $pParam['descripcion']; 

  if(
     ($sArea == '') or 
     ($sIdLocal == '') or
     ($sDescripcion == '') 
){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
	  $database->insert("Area", [
"Nombrearea" => $sArea,
"CLibertad_idCLibertad" => $sIdLocal,
"descripcion" => $sDescripcion
]);
 $sLocal = $database->select("CLibertad","local", ["idCLibertad[=]" => $sIdLocal]);
echo "Nuevo area " . $sArea . " ubicada en " . $sLocal[0];


  }

}




?>

<html>
<head>
  <title>Ingresar nuevo usuario</title>
</head>

<body>
<form name="areas" method="post">
  <strong>Nombre del Area:</strong><br>
  <input type="text" name="name_area">
  <br/>
  <strong>Descripcion:</strong><br>
  <input type="text" name="descripcion">
  <br/> 
  <strong>Ubicada en:</strong><br>
  <?php
  date();
  $choicelocal = $database->select("CLibertad",["idCLibertad","local"]);
  echo "<select name='local_area'>\n" ; // list box select command
  foreach ($choicelocal as $choicelocal)
  { 
  echo "<option value=" . $choicelocal['idCLibertad'] . ">\n" . $choicelocal["local"] . "</option>\n";
  }
	echo "</select>";
	echo "<br/>";
/**/
  ?>
  <input type="submit" value="Guardar">
</form>
</body>
</html>
<?/*

  <select name="rol" size="1">
  <option selected value="">Seleccione un rol</option>
  <?php
	$choicerol = $database->select("roles",["idrol","nombrol"]);
	while ($choicerol = mysql_fetch_array($choicerol)) {
		$id = $choicerol['idrol'];
		$name = htmlspecialchars($choicerol['nombrol']);
		echo("<option value='$id'>$name</option>\n");
	}
   ?>
   </select><br />
   
   */
   ?>
