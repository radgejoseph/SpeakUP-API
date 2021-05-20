<?php

    require_once 'connect.php';

	if (mysqli_connect_errno()){
		die('Unable to connect to datebase ' . mysqli_connect_error());
	}
	
	//$stmt = $conn->prepare("SELECT vehicle, body_plate FROM puvs WHERE vehicle='jeep';");
	$stmt = $conn->prepare("SELECT puvs.vehicle, puvs.body_plate, IFNULL(ROUND(AVG(reviews.ratings)),0) FROM puvs LEFT JOIN reviews ON puvs.body_plate=reviews.body_plate  WHERE puvs.vehicle='taxi' GROUP BY puvs.body_plate;");

	$stmt->execute();
	
	$stmt->bind_result($vehicle, $body_plate, $ratings);
 
 $items = array(); 
 
 //traversing through all the result 
 while($stmt->fetch()){
 $temp = array();
 $temp['vehicle'] = $vehicle; 
 $temp['body_plate'] = $body_plate; 
 $temp['ratings'] = $ratings; 
 array_push($items, $temp);
 }
 
 //displaying the result in json format 
 echo json_encode($items);
 ?>