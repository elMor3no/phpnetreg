<?php
include("check_login.php");
?>
<?php 

//cargando clase de BD
require 'lib_conf/bd_conf.php';
$database = new medoo();
//fin de uso de BD

//Mis funciones
require 'lib_conf/functions.php';
//


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
 // $sLocal_area = $pParam['local_area'];  
  $sName_area = $pParam['name_area']; 
  $sFInsercion = date("Y\-m\-d H\:i\:s"); 
  $sFCaducidad = "2014-04-28";
//  $sFCaducidad = $pParam['fcaducidad'];
  if(
 //    ($sDevice_name == '') or 
     ($sIp_selectd == '') or
     ($sMac == '') or 
     ($sOwner == '') or  
     ($sDivtype == '') or        
//     ($sFCaducidad < $sFInsercion) or  Buscar como validad fechas????
     ($sVr_select == '') or 
 //    ($sLocal_area == '') or
     ($sName_area == '') 
     
){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías. Verifique que la fecha de caducidad no sea anterior al dia actual';
    echo($sMensaje);

  }else{
	  
//	  $sMacconv = mac2int($sMac);


//Falta poner fecha de caducidad

	  $database->insert("Dispositivo", [
"NombDisp" => $sDevice_name,
"mac" => $sMac,
"responsable" => $sOwner,
"observacion" => $sDescripcion,
"finsercion" => $sFInsercion,
"fcaducidad" => $sFCaducidad,
"disponible" => 1,
"VRectoria_idVRectoria" => $sVr_select,
"TipoDispositivo_idTipoDispositivo" => $sDivtype,
"Area_idArea" => $sName_area,
"IP_idIP" => $sIp_selectd
]);
	$database->update("IP",["used" => 1],["idIP[=]" =>  $sIp_selectd]);

//echo "funciona" . $sFecha;
  }
}
include("navbar.php");
?>

<html>
<head>
  <title>Ingresar nuevo Dispositivo</title>
	<html lang="es"><head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content=""> 
	<script language="javascript" type="text/javascript" src="lib_conf/jquery-1.7.2.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style-footer.css" rel="stylesheet">
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
<div class="container">	
      <div class="page-header">
        <h1>Introduzca un nuevo dispositivo</h1>
      </div>

<form name="devices" method="post" class="form-signin">
  <p class="lead">
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
  <select name='div_type'>
  <option value=' ' >Seleccione tipo de dispositivo</option>"
  <?php
  $choicediv = $database->select("TipoDispositivo",["idTipoDispositivo","TipoDispositivo"]);
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
  <select name='vr_select'>
  <option value=' ' >Seleccione Ubicacion</option>"
  <?php
  $choicevr = $database->select("VRectoria",["idVRectoria","VRNombre"]);
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
<br>
	<select name="name_area" id="area" >
		<option value="">Seleccione Area</option>
	</select> 
<br/>
<br/>
<button class="btn btn-lg btn-primary" type="submit">Aceptar</button>
</p>
</div>
</form>
<?php
include("footer.php")
?>
</body>
</html>


