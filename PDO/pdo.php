
<?php
//This file is only used to connect the website to the databas

//variables needed to connect to database
//i guess this are self explanatory
$host = "localhost";
$user = "root";
$pass = "";
$db = "travel";

//one of the string needed to host database
$dsn = "mysql:host=$host;dbname=$db";

//Handles error or something
$options = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
  PDO::ATTR_EMULATE_PREPARES => false,
];

//this code is how you connect to database
//for precaution try and catch function is used
try {
  $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
  echo $e->getMessage();
}

?>