
<!DOCTYPE html>
<html>
<title>CAR_List</title>
<style>
body{
	background-color:  #66757F;
	
}
table{
	text-align: center;
	width: 1000px;
	height: 500px;
	font-size: 25px;
	background-color:  #55ACEE;
}
	
</style>
<body>

<?php
echo "<table style='border: solid 1px black; margin-top:30px; margin-left:40px;'>";
 echo "<tr><th>Manufacture</th><th>Model</th><th>Color</th></tr>";

class TableRows extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }

    function current() {
        return "<td style='width: 150px; border: 1px solid black;'>" . parent::current(). "</td>";
    }

    function beginChildren() { 
        echo "<tr>"; 
    } 

    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cr11_atra_naseri_php_car_rental";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT manufacture, model, color FROM car"); 
    $stmt->execute();

    // set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 

    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
        echo $v;
    }
}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
echo "</table>";
?> 

</body>
</html>