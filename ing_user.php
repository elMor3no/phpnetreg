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

  $sUser = $pParam['user'];
  $sPass = $pParam['pass'];
  $sName = $pParam['name'];
  $sLastN = $pParam['apellido'];
  $sRol = $pParam['rol'];

  if(
     ($sUser == '') or 
     ($sPass == '') or
     ($sName == '') or
     ($sLastN == '') or
     ($sRol == '') 
){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
	  $sPassSecure = md5($sPass);
	  $database->insert("usuarios", [
"user" => $sUser,
"password" => $sPassSecure,
"nombre" => $sName,
"apellido" => $sLastN,
"roles_idroles" => $sRol
]);
echo "Nuevo usuario " . $sName . " " . $sLastN . " insertado" . $sPassSecure;


  }

}




?>

<html>
<head>
  <title>Ingresar nuevo usuario</title>
</head>

<body>
<form name="usuarios" method="post">
  <strong>Usuario:</strong><br>
  <input type="text" name="user">
  <br/>
  <strong>Password:</strong><br>
  <input type="password" name="pass">
  <br/>
  <strong>Nombre:</strong><br>
  <input type="text" name="name">
  <br/>
  <strong>Apellido:</strong><br>
  <input type="text" name="apellido">
  <br/>
  <strong>Rol:</strong><br>
  <?php
  
  $choicerol = $database->select("roles",[
  "idroles",
  "nombrol"
  ]);
  echo "<select name='rol'>\n" ; // list box select command
  foreach ($choicerol as $choicerol)
  { 
  echo "<option value=" . $choicerol['idroles'] . ">\n" . $choicerol["nombrol"] . "</option>\n";
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
