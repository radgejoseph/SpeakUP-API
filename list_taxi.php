<?php

    require_once 'connect.php';

	if (mysqli_connect_errno()){
		die('Unable to connect to datebase ' . mysqli_connect_error());
	}
	
	$stmt = $conn->prepare("SELECT vehicle, body_plate FROM puvs WHERE vehicle='taxi';");
	//$stmt = $conn->prepare("SELECT puvs.body_plate, AVG(reviews.ratings) FROM puvs INNER JOIN reviews ON puvs.body_plate=reviews.body_plate GROUP BY puvs.body_plate;");
	
	$stmt->execute();
	
	$stmt->bind_result($vehicle, $body_plate);
 
 $products = array(); 
 
 //traversing through all the result 
 while($stmt->fetch()){
 $temp = array();
 $temp['vehicle'] = $vehicle; 
 $temp['body_plate'] = $body_plate; 
 array_push($products, $temp);
 }
 
 //displaying the result in json format 
 echo json_encode($products);
 ?>