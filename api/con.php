<?php
    $dbh = null;

    try {
      $dbh = new pdo('mysql:host=localhost;dbname=dbname', 'user', 'password');
      $dbh->exec("SET CHARACTER SET utf8");
    }catch (PDOException $ex) {
      die("No database connection...");
    }
