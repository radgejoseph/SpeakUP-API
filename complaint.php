<?php

if ($_SERVER['REQUEST_METHOD'] =='POST'){

	$user_id = $_POST['user_id'];
	//$name = $_POST['name'];
	//$username = $_POST['username'];
    $body_plate = $_POST['body_plate'];
	$date = $_POST['date'];
    $time = $_POST['time'];
	$narrative = $_POST['narrative'];
	$vehicle = $_POST['vehicle'];
	
    require_once 'connect.php';

    $sql = "INSERT INTO complaints (user_id, body_plate, narrative, date, time, vehicle) VALUES ('$user_id', '$body_plate', '$narrative', '$date', '$time', '$vehicle')";

    if ( mysqli_query($conn, $sql) ) {
        $result["success"] = "1";
        $result["message"] = "success";

        echo json_encode($result);
        mysqli_close($conn);

    } else {

        $result["success"] = "0";
        $result["message"] = "error";

        echo json_encode($result);
        mysqli_close($conn);
    }
}

?>