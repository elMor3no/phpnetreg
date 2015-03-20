<?php 

//uso de BD
require 'lib_conf/bd_conf.php';
$database = new medoo();
 

//fin de uso de BD

echo "Listado de subnet" . "<br/>";
echo "<br/>";
echo "<br/>";

$datas = $database->select("Subnet", [
	"idSubnet",
	"mask",
	"ipaddr", 
	"descripcion"
]);

foreach($datas as $data)
{
	echo "Id: " . $data["idSubnet"] . "<br/>" . " Descripcion: " . $data["descripcion"] . "<br>" . " Mascara de Red: " . long2ip($data["mask"]) . "<br/>" . " Id de Red: " . long2ip($data["ipaddr"]) . "<br/>" . "<br/>" . "<br/>";
}

?>
