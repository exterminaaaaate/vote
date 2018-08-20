<?php
	include 'con.php';

	$sql = "select " .
   "(select count(id) from votes where `value` LIKE 'YES') as 'YesCount', " .
   "(select count(id) from votes where `value` LIKE 'NO') as 'NoCount'";

	$sth = $dbh->prepare($sql);
	$sth->execute();
	$res = $sth->fetchAll(PDO::FETCH_ASSOC);

	http_response_code(200);	
	header('Content-Type: application/json');
	echo json_encode([
		'yes' => intval($res[0]['YesCount']),
		'no' => intval($res[0]['NoCount'])
	]);
