<?php 
// DB credentials.
// define('DB_HOST','localhost');
// define('DB_USER','postgres');
// define('DB_PASS','postgres*');
// define('DB_NAME','apartmentDB');
// Establish database connection.
$host = "localhost"; 
$user = "postgres"; 
$pass = "postgres*"; 
$db = "apartmentDB"; 

$con = pg_connect("host=$host dbname=$db user=$user password=$pass")
    or die ("Could not connect to server\n"); 
// try
// {
// $dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
// }
// catch (PDOException $e)
// {
// exit("Error: " . $e->getMessage());
// }
?>