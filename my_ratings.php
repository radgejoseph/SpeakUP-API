<?php

$id = $_POST['id'];

    require_once 'connect.php';

	if (mysqli_connect_errno()){
		die('Unable to connect to datebase ' . mysqli_connect_error());
	}
	
	//$stmt = $conn->prepare("SELECT vehicle, body_plate, narrative, ratings FROM reviews WHERE user_id='1';");
	$stmt = $conn->prepare("SELECT vehicle, body_plate, narrative, ratings FROM reviews WHERE user_id='$id';");
	
	$stmt->execute();
	
	$stmt->bind_result($vehicle, $body_plate, $narrative, $ratings);
 
 $items = array(); 
 
 //traversing through all the result 
 while($stmt->fetch()){
 $temp = array();
 $temp['vehicle'] = $vehicle;
 $temp['body_plate'] = $body_plate;
 $temp['narrative'] = $narrative; 
 $temp['ratings'] = $ratings; 
 array_push($items, $temp);
 }
 
 //displaying the result in json format 
 echo json_encode($items);
 ?>