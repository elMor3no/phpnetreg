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
  <input type="submit" value="Guardar">
</form>
</body>
</html>

<?php
$pParam = FALSE;

if(count($_GET) != 0){
  $pParam = $_GET;
}elseif(count($_POST) != 0){
  $pParam = $_POST;
}

if($pParam != FALSE){

  $ip_addr = $pParam['ip'];
  $subnet_mask = $pParam['mask'];

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

   echo "IP Address:         " . long2ip($ip) . "\n" . "<br>";
   echo "Subnet Mask:        " . long2ip($nm) . "\n" . "<br>";
   echo "Network Address:    " . long2ip($nw) . "\n" . "<br>";
   echo "Broadcast Address:  " . long2ip($bc) . "\n" . "<br>";
   echo "Number of Hosts:    " . ($bc - $nw - 1) . "\n" . "<br>";
   echo "Host Range:         " . long2ip($nw + $inc) . " -> " . long2ip($bc - 1)  . "\n" . "<br>";
/*	  $database->insert("roles", [
"nombrol" => $sNombre,
"descripcion" => $sDescripcion
]);
echo "Nuevo rol insertado";
*/

  }

}

?>

