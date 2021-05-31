<?php

$body_plate = $_POST['body_plate'];

    require_once 'connect.php';

	if (mysqli_connect_errno()){
		die('Unable to connect to datebase ' . mysqli_connect_error());
	}

	$stmt = $conn->prepare("SELECT reviews.narrative, reviews.ratings, mobileappusers.username FROM reviews INNER JOIN mobileappusers ON reviews.user_id=mobileappusers.id WHERE body_plate='$body_plate';");
	
	$stmt->execute();
	
	$stmt->bind_result($narrative, $ratings, $username);
 
 $items = array(); 

 while($stmt->fetch()){
 $temp = array();
 $temp['narrative'] = $narrative; 
 $temp['ratings'] = $ratings;
 $temp['username'] = $username;
 array_push($items, $temp);
 }

 echo json_encode($items);

 ?>