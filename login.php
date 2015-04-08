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
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="PHPNETREG">
    <meta name="author" content="Pablo Mestre">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <LINK rel="stylesheet" type="text/css" href="css/style-login.css">
  <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>
	
<div id="dlogin" class="container">
<form name="flogin" action="make_login.php" method="post" class="form-signin">
	<h2 class="form-signin-heading">Por favor identifíquese:</h2>
	<label for="inputEmail" class="sr-only">Email address</label>
	<input type="text" name="user" id="inputEmail" class="form-control" placeholder="Nombre de Usuario" required autofocus>
  <br/>
  <label for="inputPassword" class="sr-only">Contraseña:</label>
  <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Contraseña" required>
  <br/>
  <button class="btn btn-lg btn-primary btn-block" type="submit">Aceptar</button>
</form>
</div> <!-- /container -->
</body>
</html>
<?
}
?>
<?php
include("footer.php")
?>
