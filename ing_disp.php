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

  $sDevice_name = $pParam['device_name'];
  $sIp_selectd = $pParam['ip_select'];
  $sMac = $pParam['mac']; 
  $sOwner = $pParam['owner']; 
  $sDivtype = $pParam['div_type']; 
  $sDescripcion = $pParam['descripcion'];   
  $sVr_select = $pParam['vr_select']; 
  $sLocal_area = $pParam['local_area'];  
  $sName_area = $pParam['name_area'];  
  
  if(
     ($sDevice_name == '') or 
     ($sIp_selectd == '') or
     ($sMac == '') or 
     ($sOwner == '') or  
     ($sDivtype == '') or        
     ($sDescripcion == '') or
     ($sVr_select == '') or 
     ($sLocal_area == '') or
     ($sName_area == '') 
     
){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
	  
	  $sFecha = $database->query("select now()");
//Falta poner fecha de caducidad

	  $database->insert("Dispositivo", [
"NombDisp" => $sDevice_name,
"mac" => $sMac,
"responsable" => $sOwner,
"observacion" => $sDescripcion,
"finsercion" => $sFecha,
"disponible" => 1,
"VRectoria_idVRectoria" => $sVr_select,
"TipoDispositivo_idTipoDispositivo" => $sDivtype,
"Area_idArea" => $sLocal_area,
"IP_idIP" => $sIp_selectd
]);

echo "funciona";
  }

}




?>

<html>
<head>
  <title>Ingresar nuevo Dispositivo</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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
</head>

<body>
<form name="devices" method="post">
  <strong>Nombre del dispositivo:</strong><br>
  <input type="text" name="device_name">
  <br/>
  <strong>Subred:</strong><br>
    <select name="sn_select" id="subnet" onchange="cargarcombos('#ip', 'combos.php?id_subnet=' + this.value + '&modo=ip')" >
	<option value="">Seleccione una subred</option> 
	<?php
		 $choicesn = $database->select("Subnet",["idSubnet","descripcion"]);
		 foreach ($choicesn as $choicesn)
			{ 
				echo "<option value=" . $choicesn['idSubnet'] . ">\n" . $choicesn['descripcion'] . "</option>\n";
			}
		echo "</select>";
		echo "<br/>";
	?>
	<strong>Direccion IP:</strong><br>
	<select name="ip_select" id="ip" >
	<option value="">Seleccione Direccion IP</option>
	</select> 
	<br/>
  <strong>MAC:</strong><br>
  <input type="text" name="mac">
  <br/> 
  <strong>Tipo de Dispositivo:</strong><br>
  <?php
  $choicediv = $database->select("TipoDispositivo",["idTipoDispositivo","TipoDispositivo"]);
  echo "<select name='div_type'>\n" ; // list box select command
  foreach ($choicediv as $choicediv)
  { 
  echo "<option value=" . $choicediv['idTipoDispositivo'] . ">\n" . $choicediv['TipoDispositivo'] . "</option>\n";
  }
	echo "</select>";
	echo "<br/>";
  ?>
  <br>
  <strong>Responsable:</strong><br>
  <input type="text" name="owner">
  <br/> 
  <strong>Observacion:</strong><br>
  <input type="text" name="descripcion">
  <br/> 
  <strong>Ubicada en:</strong><br>
  <?php
  $choicevr = $database->select("VRectoria",["idVRectoria","VRNombre"]);
  echo "<select name='vr_select'>\n" ; // list box select command
  foreach ($choicevr as $choicevr)
  { 
  echo "<option value=" . $choicevr['idVRectoria'] . ">\n" . $choicevr['VRNombre'] . "</option>\n";
  }
	echo "</select>";
	echo "<br/>";
  ?>
  <br>
  <select name="local_area" id="region" onchange="cargarcombos('#area', 'combos.php?id_region=' + this.value + '&modo=area')" >
	<option value="">Seleccione una localizacion</option> 
	<?php
		$choicelocal = $database->select("CLibertad",["idCLibertad","local"]);
		foreach ($choicelocal as $choicelocal)
		{ 
			echo "<option value=" . $choicelocal['idCLibertad'] . ">\n" . $choicelocal["local"] . "</option>\n";
		}
		echo "</select>";
		echo "<br/>";
	?>
  
  <?php
  /*
  $choicelocal = $database->select("CLibertad",["idCLibertad","local"]);
  echo "<select name='local_area' onchange="cargarcombos('#plantas', 'combos.php?id_region=' + this.value + '&modo=plantas')"      >\n" ; // list box select command
  foreach ($choicelocal as $choicelocal)
  { 
  echo "<option value=" . $choicelocal['idCLibertad'] . ">\n" . $choicelocal["local"] . "</option>\n";
  }
	echo "</select>";
	echo "<br/>";*/
  ?>
<br>
	<select name="name_area" id="area" >
		<option value="">Seleccione Area</option>
	</select> 
<br/>
<br/>
  
  <?php
  /*
  if(isset($_post['local_area'])){
  $form_local = $_post['local_area'];
  $choicearea = $database->select("Area",["idArea","Nombrearea","CLibertad_idCLibertad"],["CLibertad_idCLibertad[=]" => $form_local]);
/*$choicearea = $database->query("SELECT idArea, Nombrearea FROM Area INNER JOIN CLibertad ON $choicelocal = CLibertad_idCLibertad");
//print_r($choicearea);   // /
  echo "<select name='area'>\n" ; // list box select command
  foreach ($choicearea as $choicearea)
  { 
  echo "<option value=" . $choicearea['idArea'] . ">\n" . $choicearea["Nombrearea"] . "</option>\n";
  }
	echo "</select>";
	echo "<br/>";
}	*/
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
