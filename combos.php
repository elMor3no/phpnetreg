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

$modo = $pParam['modo'];

if ($modo=="area"){
    $id_region = $pParam['id_region'];
    echo '<option value="">Seleccione Area</option>';
    $choicearea = $database->select(
    "Area",
    ["idArea","Nombrearea","CLibertad_idCLibertad"],
    ["CLibertad_idCLibertad[=]" => $id_region]);
    foreach ($choicearea as $choicearea)
	{ 
	echo "<option value=" . $choicearea['idArea'] . ">\n" . $choicearea['Nombrearea'] . "</option>\n";
	}
}
elseif ($modo=="ip"){
    $id_subnet = $pParam['id_subnet'];
	echo '<option value="">Seleccione Direccion IP</option>';
	$choiceip = $database->query("SELECT `idIP`, `ipnum`, `used`, `Subnet_idSubnet` FROM `IP` WHERE `Subnet_idSubnet` = $id_subnet and `used` = 0")->FetchAll();
	/*
	"IP",
	["idIP","Ipnum","used","Subnet_idSubnet"],
	["Subnet_idSubnet[=]" => $id_subnet,["used[=]" => 1]]); */
	foreach ($choiceip as $choiceip)
		{ 
			$ipr = long2ip($choiceip[1]);
		echo "<option value=" . $choiceip['idIP'] . ">\n" . $ipr . "</option>\n";
		}
}
?> 
