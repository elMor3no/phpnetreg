<?php
include("check_login.php");
?>
<html>
<head>
  <title>PHPNETREG</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <LINK rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<h1>Estas logueado</h1>


<div id="dlogout">
<form name="flogout" action="logout.php" method="post">
  <br/>
  <input type="submit" value="salir">
</form>
</div>

</body>
</html>
