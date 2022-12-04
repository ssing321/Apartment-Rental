<?php 
?>
<?php 

$host = "localhost"; 
$user = "postgres"; 
$pass = "postgres*"; 
$db = "apartmentDB"; 

$con = pg_connect("host=$host dbname=$db user=$user password=$pass")
    or die ("Could not connect to server\n"); 

?>