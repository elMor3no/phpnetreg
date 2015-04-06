<html>
<head>
  <title>Buscar un Dispositivo</title>
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
	
<div id="s_nombre">
<form name="devices_name" action="ver_disp_name.php" method="post">
  <strong>Nombre del dispositivo:</strong><br>
  <input type="text" name="device_name">
  <br/>
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>

<div id="s_ip">
<form name="devices_ip" action="ver_disp_ip.php" method="post">
  <strong>IP del dispositivo:</strong><br>
  <input type="text" name="device_ip">
  <br/>
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>

<div id="s_mac">
<form name="devices_mac" action="ver_disp_mac.php" method="post">
  <strong>MAC del dispositivo:</strong><br>
  <input type="text" name="device_mac">
  <br/>
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>
</body>
</html>
