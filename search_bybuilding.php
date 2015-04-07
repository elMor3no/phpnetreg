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
  <title>Buscar dispositivos por Subnet</title>
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
	
<div id="s_bysubnet">
<form name="devices_subnet" action="ver_by_sn.php" method="post">
  <strong>Nombre del dispositivo:</strong><br>
  <select name="sn_select" id="subnet" >
	<option value="">Seleccione una subred</option> 
	<?php
		 $choicesn = $database->select("Subnet",["idSubnet","descripcion"]);
		 foreach ($choicesn as $choicesn)
			{ 
				echo "<option value=" . $choicesn['idSubnet'] . ">\n" . $choicesn['descripcion'] . "</option>\n";
			}
		echo "</select>";
	?>
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>

</body>
</html>
