<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {
    
    $body_plate = $_POST['body_plate'];

    require_once 'connect.php';

	if (mysqli_connect_errno()){
		die('Unable to connect to datebase ' . mysqli_connect_error());
	}
	
	$stmt = $conn->prepare("SELECT user_id, narrative FROM reviews WHERE body_plate='$body_plate';");
	
	$stmt->execute();
	
	$stmt->bind_result($user_id, $narrative);
 
 $products = array(); 

 while($stmt->fetch()){
 $temp = array();
 $temp['user_id'] = $user_id; 
 $temp['narrative'] = $narrative; 
 array_push($products, $temp);
 }

 echo json_encode($products);
 
 }else {
 
     $result["success"] = "0";
     $result["message"] = "Error!";
     echo json_encode($result);
 
     mysqli_close($conn);
 }
 
 ?>