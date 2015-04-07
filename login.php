<?
session_start();
if(isset($_SESSION['user']) && isset($_SESSION['pass']) )
{
	header('Location: index2.php');		
}else{ 
?>
<html>
<head>
  <title>PHPNETREG</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <LINK rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	
<div id="dlogin">
<form name="flogin" action="make_login.php" method="post">
  Usuario: 
  <input type="text" name="user">
  <br/>
  Contrasena:
  <input type="text" name="pass">
  <br/>
  <input type="submit" value="Guardar">
</form>
</div>
</body>
</html>
<?
}
?>
