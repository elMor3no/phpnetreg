<?php 
include("check_login.php");

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

  
/*
  $sDevice_name = $pParam['device_name'];

  $sMac = $pParam['mac']; 
  $sOwner = $pParam['owner']; 
  $sDivtype = $pParam['div_type']; 
  $sDescripcion = $pParam['descripcion'];   
  $sVr_select = $pParam['vr_select']; 
 // $sLocal_area = $pParam['local_area'];  
  $sName_area = $pParam['name_area'];  
  $sFCaducidad = "2015-03-28";
//  $sFCaducidad = $pParam['fcaducidad'];
  if(
 //    ($sDevice_name == '') or 
     ($sIp_selectd == '') or
     ($sMac == '') or 
     ($sOwner == '') or  
     ($sDivtype == '') or        
 //    ($sDescripcion == '') or
     ($sVr_select == '') or 
 //    ($sLocal_area == '') or
     ($sName_area == '') 
     
){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }
  
   else{
*/
/* 
 * 
 * buscar por ip
 * 
* */ 
  
if ($pParam['device_ip']){
$sIp = $pParam['device_ip'];
echo "Resultado de la Busqueda" . "<br/>";
echo "<br/>";
$sIPconv = ip2long($sIp); 
$datas = $database->query("SELECT * FROM `Dispositivo`, `IP` WHERE IP.ipnum = $sIPconv and IP.idIP = Dispositivo.IP_idIP");
foreach($datas as $datas)
{
//	echo "PC: " . $data["NombDiso"] . "<br/>" . " Descripcion: " . $data["descripcion"] . "<br>" . " Mascara de Red: " . long2ip($data["mask"]) . "<br/>" . " Id de Red: " . long2ip($data["ipaddr"]) . "<br/>" . "<br/>" . "<br/>";
	echo "PC: " . $datas["NombDisp"] . "<br/>" . " Direccion MAC: " . $datas["mac"] . "<br/>" . " Duenno/Responsable: " . $datas["Responsable"] . "<br/>" . " Descripcion: " . $datas["observacion"] ."<br/>" . "<br/>" . "<br/>";
}
}
}
include("search_disp.php");
?>
