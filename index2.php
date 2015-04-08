<?php
include("check_login.php");
include("navbar.php");
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
       <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script> 
<?php
include("footer.php")
?>
</body>
</html>
