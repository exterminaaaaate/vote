<?php
    require '../libs/csv-8.2.2/autoload.php';
    require 'con.php';

    use League\Csv\Reader;
    use League\Csv\Writer;

    if($_POST['password'] !== 'sc') {
      header("Location: ../");
      die();
    }

      $csv = Writer::createFromFileObject(new SplTempFileObject()); //the CSV file will be created using a temporary File
      $csv->setDelimiter(";"); //the delimiter will be the tab character
      $csv->setNewline("\r\n"); //use windows line endings for compatibility with some csv libraries
      $csv->setOutputBOM(Writer::BOM_UTF8); //adding the BOM sequence on output

      $sql = <<<SQL
        SELECT v.uid,
        (SELECT vvv.answer FROM votes vvv WHERE vvv.uid = v.uid AND vvv.question_id = 1) as 'company',
        (SELECT vvv.answer FROM votes vvv WHERE vvv.uid = v.uid AND vvv.question_id = 2) as 'question1',
        (SELECT vvv.answer FROM votes vvv WHERE vvv.uid = v.uid AND vvv.question_id = 3) as 'question2',
        (SELECT vvv.answer FROM votes vvv WHERE vvv.uid = v.uid AND vvv.question_id = 4) as 'question3',
        (SELECT vvv.answer FROM votes vvv WHERE vvv.uid = v.uid AND vvv.question_id = 5) as 'question4'
        FROM votes v
        GROUP BY v.uid
SQL;

    	$sth = $dbh->prepare($sql);
    	$sth->execute();
    	$res = $sth->fetchAll(PDO::FETCH_ASSOC);

      $csv->insertOne(["Utilizador", "Empresa", "Promover", "Inscrever-se", "Participar saúde e bem estar", "Modalidades que participar"]);
      foreach ($res as $line) {

          $csv->insertOne([$line['uid'],$line['company'],$line['question1'],$line['question2'],$line['question3'],$line['question4']]);
      }

        $csv->output('export.csv');
        die();
