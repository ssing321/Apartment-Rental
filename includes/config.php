<?php 
// //DB credentials.
// define('DB_HOST','localhost');
// define('DB_USER','postgres');
// define('DB_PASS','postgres');
// define('DB_NAME','apartmentDB');
// //Establish database connection.
// try
// {
// $dbh = new PDO("pgsql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS);
// $dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
// if ($dbh) {
//     echo "Connected to the database successfully!";
// }
// }
// catch (PDOException $e)
// {
// exit("Error: " . $e->getMessage());
// }
?>
<?php 

$host = "localhost"; 
$user = "postgres"; 
$pass = "postgres*"; 
$db = "apartmentDB"; 

$con = pg_connect("host=$host dbname=$db user=$user password=$pass")
    or die ("Could not connect to server\n"); 

// $sql = 'SELECT FullName FROM tblusers WHERE EmailId=$1'; 
// $results = pg_query_params($con, $sql, array('teenu@gmail.com'));

// if (pg_num_rows($results)>0) {
//     while($result = pg_fetch_array($results)) {

//       echo $result[0];
//     }
// }
// pg_close($con); 

?>