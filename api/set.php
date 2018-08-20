<?php
	include 'con.php';

	if(isset($_POST['vote']) && !empty(trim($_POST['vote']))) {
		switch (strtoupper(trim($_POST['vote']))) {
			case 'YES':
				$myvote = 'YES';
				break;
			case 'NO':
				$myvote = 'NO';
				break;
			
			default:
				$myvote = 'NONE';
				break;
		}


		$sql = "INSERT INTO `votes` (`value`) VALUES ('" . $myvote . "')";

		$sth = $dbh->prepare($sql);
		$sth->execute();

		http_response_code(200);
	}else {
		http_response_code(400);
	}

	
	header('Content-Type: application/json');
	echo '{}';
