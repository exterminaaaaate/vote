<?php
    try {
      $dbh = new pdo('mysql:host=142.93.32.165;dbname=biskilima', 'biski', 'biskibiski');
    }catch (PDOException $ex) {
      die("No database connection...");
    }
