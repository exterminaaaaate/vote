<?php
	include 'con.php';

	if(isset($_POST['jsondata']) && !empty(trim($_POST['jsondata']))) {
		$data = json_decode($_POST['jsondata']);
		$binds = [];
		$uid = uniqid('VOTE_');

		$sql = "INSERT INTO `votes` (`uid`, `question_id`, `answer`) VALUES ";
		foreach ($data as $row) {
			$sql .= "(?, ?, ?), ";
			$binds[] = $uid;
			$binds[] = $row->question;
			$binds[] = $row->answer;
		}

		$sql = rtrim($sql, ', ');

		$sth = $dbh->prepare($sql);
		$sth->execute($binds);

		http_response_code(200);
	}else {
		http_response_code(400);
	}


	header('Content-Type: application/json');
	echo '{}';
