<?php

$body_plate = $_POST['body_plate'];

    require_once 'connect.php';

	if (mysqli_connect_errno()){
		die('Unable to connect to datebase ' . mysqli_connect_error());
	}
	
	//$stmt = $conn->prepare("SELECT vehicle, body_plate, narrative, ratings FROM reviews WHERE user_id='1';");
	$stmt = $conn->prepare("SELECT reviews.narrative, reviews.ratings, appusers.username FROM reviews INNER JOIN appusers ON reviews.user_id=appusers.id WHERE body_plate='$body_plate';");
	
	$stmt->execute();
	
	$stmt->bind_result($narrative, $ratings, $username);
 
 $items = array(); 
 
 //traversing through all the result 
 while($stmt->fetch()){
 $temp = array();
 $temp['narrative'] = $narrative; 
 $temp['ratings'] = $ratings;
 $temp['username'] = $username;
 array_push($items, $temp);
 }
 
 //displaying the result in json format 
 echo json_encode($items);
 ?>