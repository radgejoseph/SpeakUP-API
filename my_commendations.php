<?php

$id = $_POST['id'];

    require_once 'connect.php';

	if (mysqli_connect_errno()){
		die('Unable to connect to datebase ' . mysqli_connect_error());
	}

	$stmt = $conn->prepare("SELECT vehicle, body_plate, narrative, file, date, time FROM commendations WHERE user_id='$id';");
	
	$stmt->execute();
	
	$stmt->bind_result($vehicle, $body_plate, $narrative, $file, $date, $time);
 
 $items = array(); 

 while($stmt->fetch()){
 $temp = array();
 $temp['vehicle'] = $vehicle;
 $temp['body_plate'] = $body_plate;
 $temp['narrative'] = $narrative; 
 $temp['image_name'] = $file;
 $temp['date'] = $date; 
 $temp['time'] = $time; 
 array_push($items, $temp);
 }

 echo json_encode($items);

 ?>