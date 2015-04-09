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
<!DOCTYPE html>
<html>
<head>
  <title>PHPNETREG - Ingresar nuevo dispositivo</title>
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
<div class="container-fluid row">	
	<div class="col-xs-12 col-md-2"></div>
	  <div class="col-xs-12 col-md-8 panel panel-primary">
      <div class="panel-heading">
        <h3>Introduzca un nuevo dispositivo</h3>
      </div>
      <br/>
<div class="alert alert-info">
  <a class="alert-link">Todos los campos son obligatorios.</a>
</div>
<form name="devices" method="post" class="form-signin" role="form">
  <div class="form-group">
  <label for="device_name">Nombre del dispositivo:</label>	  
  <input type="text" class="form-control" placeholder="Nombre del dispositivo..." name="device_name" id="device_name" required autofocus>
  <br/>
  <div class="container-fluid row">
  <div class="col-xs-8 col-md-6">
  <label for="subnet">Nombre de la Subred:</label>	
    <select name="sn_select" class="form-control" id="subnet" onchange="cargarcombos('#ip', 'combos.php?id_subnet=' + this.value + '&modo=ip')" required>
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
	</div>
    <div class="col-xs-8 col-md-6">	
	<label for="ip">Direccion IP:</label>	
	<select name="ip_select" id="ip" class="form-control" required>
	<option value="">Seleccione Direccion IP</option>
	</select> 
	</div>	
	</div>
   <div class="container-fluid row">
    <div class="col-xs-8 col-md-6">
	<label for="mac">Dirección Física:</label>	
    <input type="text" class="form-control" placeholder="Dirección Física..." name="mac" id="mac" required>
    <span class="help-block">Ingresar direccion MAC. Ej: 00:11:2f:35:77:8e </span>
    </div>
    <div class="col-xs-8 col-md-6">
    <label for="owner">Responsable:</label>
    <input type="text" class="form-control" placeholder="Responsable..." name="owner" required>
    <span class="help-block">Dueño o usuario que responde por este dispositivo.</span>    
    </div>
   </div>
 
  <label for="type">Tipo de Dispositivo:</label>
  <select name='div_type' class="form-control" id="type" required>
  <option value="" >Seleccione tipo de dispositivo</option>"
  <?php
  $choicediv = $database->select("TipoDispositivo",["idTipoDispositivo","TipoDispositivo"]);
  foreach ($choicediv as $choicediv)
  { 
  echo "<option value=" . $choicediv['idTipoDispositivo'] . ">\n" . $choicediv['TipoDispositivo'] . "</option>\n";
  }
	echo "</select>";
	echo "<br/>";
  ?>
  <div class="container-fluid row">
  <div class="col-xs-8 col-md-4">
  <label for="location">Ubicada en:</label>
  <select name='vr_select' class="form-control" id="location" required>
  <option value="" >Seleccione Ubicacion</option>"
  <?php
  $choicevr = $database->select("VRectoria",["idVRectoria","VRNombre"]);
  foreach ($choicevr as $choicevr)
  { 
  echo "<option value=" . $choicevr['idVRectoria'] . ">\n" . $choicevr['VRNombre'] . "</option>\n";
  }
	echo "</select>";
	echo "<br/>";
  ?>
  </div>
  <div class="col-xs-8 col-md-4">  
  <label for="region">Ubicada en:</label>
  <select name="local_area" class="form-control" required id="region" onchange="cargarcombos('#area', 'combos.php?id_region=' + this.value + '&modo=area')" >
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
</div>
  <div class="col-xs-8 col-md-4">
	  <label for="area">Ubicada en:</label>
	<select name="name_area" id="area" class="form-control" required>
		<option value="">Seleccione Area</option>
	</select> 
<br/>
</div>
</div>

<!--
<label for="device_caduca">Fecha de caducidad:</label>	  
  <input type="datetime-local" class="form-control" name="device_name" id="device_caduca">

<br/>
-->
  <label for="descripcion">Observacion:</label>
  <br>
  <input type="textarea" class="form-control" name="descripcion" rows="3" id="descripcion" required>
  <br/> 
  <!--
<div class="container">
    <div class="col-sm-6" style="height:130px;">
        <div class="form-group">
            <div class='input-group date' id='datetimepicker10'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar">
                    </span>
                </span>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#datetimepicker10').datetimepicker({
                viewMode: 'years',
                format: 'MM/YYYY'
            });
        });
    </script>
</div>

-->
<button class="btn btn-lg btn-primary" type="submit">Aceptar</button>
</div>
</div>
</form>
</div>
<div class="col-xs-12 col-md-2"></div>
       <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script> 
    <br><br><br>
<?php
include("footer.php")
?>
</body>
</html>


