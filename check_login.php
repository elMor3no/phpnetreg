<?php
	session_start();
	if(!isset($HTTP_POST_VARS['user'])&&!isset($HTTP_POST_VARS['password']))
	{
		header('location login.php');
	}

?>
