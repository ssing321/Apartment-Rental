<?php 
// DB credentials.
define('DB_HOST','localhost');
define('DB_USER','postgres');
define('DB_PASS','postgres');
define('DB_NAME','apartmentDB');
// Establish database connection.
try
{
$dbh = new PDO("pgsql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS,[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
if ($dbh) {
    echo "Connected to the database successfully!";
}
}
catch (PDOException $e)
{
exit("Error: " . $e->getMessage());
}
?>