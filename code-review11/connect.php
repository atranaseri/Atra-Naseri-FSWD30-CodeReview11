<?php

$connection = mysqli_connect("localhost","root","", "cr11_atra_naseri_php_car_rental");
if(!$connection){
	echo "failed to connect database";
}



if(!$connection){
	echo "failed to connect database" . die(mysqli_error($connection));
}
?>