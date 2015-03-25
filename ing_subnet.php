<html>
<head>
  <title>Actualizar nombre del rol</title>
</head>

<body>
<form name="ipform" method="post">
  <strong>Direccion IP:</strong><br>
  <input type="text" name="ip">
  <br/>
  <strong>Mascara:</strong><br>
  <input type="text" name="mask">
  <br/>
  <strong>Descripcion:</strong><br>
  <input type="text" name="descripcion">
  <br/>
  <input type="submit" value="Guardar">
</form>
</body>
</html>

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

  $ip_addr = $pParam['ip'];
  $subnet_mask = $pParam['mask'];
  $sDescripcion = $pParam['descripcion'];
  if(
     ($ip_addr == '') or 
     ($subnet_mask == '')
  ){

    $sMensaje =
      'El nombre y la descripción '.
      'del nuevo rol no pueden '.
      'ser cadenas vacías.';
    echo($sMensaje);

  }else{
   $ip = ip2long($ip_addr);
   $nm = ip2long($subnet_mask);
   $nw = ($ip & $nm);
   $bc = $nw | (~$nm);
   $inc = 1;
   $ipv = $nw + $inc;
   $host = ($bc - $nw - 1);
   echo "IP Address:         " . long2ip($ip) . "\n" . "<br>";
   echo "Subnet Mask:        " . long2ip($nm) . "\n" . "<br>";
   echo "Network Address:    " . long2ip($nw) . "\n" . "<br>";
   echo "Broadcast Address:  " . long2ip($bc) . "\n" . "<br>";
   echo "Number of Hosts:    " . $host . "\n" . "<br>";
   echo "Host Range:         " . long2ip($nw + $inc) . " -> " . long2ip($bc - 1)  . "\n" . "<br>";
   echo "Descripcion:		 " . $sDescripcion . "<br>" . "<br>" . "<br>" . "<br>"; 
/*	  $database->insert("roles", [
"nombrol" => $sNombre,
"descripcion" => $sDescripcion
]);
echo "Nuevo rol insertado";
*/

   $sn = $database->insert("Subnet", ["mask" => $nm, "ipaddr" => $nw, "descripcion" => $sDescripcion]);
// $sn = $database->select("Subnet", "idSubnet")
   for ($i = 1; $i <= $host; $i++){
   $database->insert("IP", ["ipnum" => $ipv, "Subnet_idSubnet" => $sn]);
   echo long2ip($ipv) . "<br>";
   $ipv += $inc; 
}
  }
   

} 

?>
