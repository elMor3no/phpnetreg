<?php 

//cargando clase de BD
require 'lib_conf/bd_conf.php';
$database = new medoo();
//fin de uso de BD

//Mis funciones
require 'lib_conf/functions.php';
//
?>

<html>
<head>
  <title>Buscar dispositivos segun su localizacion</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <!--
  <script language="javascript" type="text/javascript" src="lib_conf/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
	function cargarcombos(combo, url){
    $(combo).html("<option selected>Cargando...</option>");
    var php  = url;
    $.post(php,function(respuesta){
        $(combo).html(respuesta);
    });
}
</script>
--> 
<LINK rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	
<div id="s_bybuilding">
<form name="devices_building" action="ver_by_b.php" method="post">
  <strong>Ubicacion:</strong><br>
  <select name="b_select" id="local" >
	<option value="">Seleccione una Ubicacion</option> 
	<?php
		$choicelocal = $database->select("CLibertad",["idCLibertad","local"]);
		foreach ($choicelocal as $choicelocal)
		{ 
			echo "<option value=" . $choicelocal['idCLibertad'] . ">\n" . $choicelocal["local"] . "</option>\n";
		}
		echo "</select>";
		echo "<br/>";
	?>
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>

</body>
</html>
