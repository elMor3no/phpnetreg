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

	$sUsuario = $pParam['user'];
	$sPassword = md5($pParam['pass']);

	if(isset($_POST['user']) && isset($_POST['pass'])){
			$datas = $database->query("SELECT * FROM usuarios WHERE user = '$sUsuario' and password = '$sPassword'")->fetchAll();
			$num = count($datas);
			if($num == 1){
			session_start();
			$_SESSION['user'] = $sUsuario;
			$_SESSION["pass"] = $sPassword;
			}
			header('Location: index2.php');
			}
	
?>


