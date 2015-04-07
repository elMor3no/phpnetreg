<html>
<head>
  <title>Buscar Usuarios</title>
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
	
<div id="s_user_nombre">
<form name="users_name" action="ver_user_name.php" method="post">
  <strong>Nombre del usuario:</strong><br>
  <input type="text" name="user_name">
  <br/>
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>
<!--
<h1>NO FUNCIONA AUN</h1>
<div id="s_user_roles">
<form name="roles_user" action="ver_user_rol.php" method="post">
  <strong>Rol del usuario:</strong><br>
  <input type="text" name="rol_user">
  <br/>
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>
-->
</body>
</html>
