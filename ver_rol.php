<?php 

//uso de BD
require 'lib_conf/bd_conf.php';
$database = new medoo();
 

//fin de uso de BD

echo "Listado de roles" . "<br/>";
echo "<br/>";
echo "<br/>";

$datas = $database->select("roles", [
	"nombrol",
	"descripcion"
], [
	"idroles[<]" => 100
]);

foreach($datas as $data)
{
	echo "Rol:" . $data["nombrol"] . "<br/>" . " Descripcion:" . $data["descripcion"] . "<br/>" . "<br/>";
}

?>
