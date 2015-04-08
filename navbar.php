<!DOCTYPE html>
<html lang="es"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="PHPNETREG">
    <meta name="author" content="Pablo Mestre">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
	<link href="css/style-navbar.css" rel="stylesheet">
  </head>

  <body>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index2.php">PHPNETREG</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index2.php">Inicio</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Insertar <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">Ubicación</li>				  
                <li><a href="#">Edificio</a></li>
                <li><a href="ing_area.php">Área</a></li>
                <li><a href="ing_vr.php">Vicerectoría</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Red y dispositivos</li>
                <li><a href="ing_subnet.php">Subred</a></li>
                <li><a href="ing_tdisp.php">Tipo de dispositivo</a></li>
                <li><a href="ing_disp.php">Dispositivo</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Cuentas</li>
                <li><a href="ing_user.php">Usuario</a></li>
             </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Buscar <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">Ubicación</li>				  
                <li><a href="#">Edificio</a></li>
<!--            <li><a href="#">Área</a></li>
                <li><a href="#">Vicerectoría</a></li> -->
                <li class="divider"></li>
                <li class="dropdown-header">Red y dispositivos</li>
                <li><a href="#">Subred</a></li>
<!--            <li><a href="#">Tipo de dispositivo</a></li> -->
                <li><a href="#">Dispositivo</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Cuentas</li>
                <li><a href="#">Usuario</a></li>
             </ul>
            </li>
            <li><a href="#about">Acerca de PHPNETREG</a></li>
            <li><a href="#contact">Contacto</a></li>
          </ul>
          <form class="navbar-form navbar-right">
		      <button href="logout.php" class="btn btn-danger btn-block" type="submit">Salir</button>
          </form>  
        </div><!--/.nav-collapse -->
      </div>
    </nav>
       <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script> 
</body></html>
