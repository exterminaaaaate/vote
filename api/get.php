<?php
	include 'con.php';

	$sql = "select * from questions";

	$sth = $dbh->prepare($sql);
	$sth->execute();
	$res = $sth->fetchAll(PDO::FETCH_ASSOC);

	http_response_code(200);
	header('Content-Type: application/json; charset=UTF-8');
	echo json_encode($res, JSON_UNESCAPED_UNICODE);
