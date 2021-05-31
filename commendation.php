<?php

if ($_SERVER['REQUEST_METHOD'] =='POST'){

	$user_id = $_POST['user_id'];
    $body_plate = $_POST['body_plate'];
	$date = $_POST['date'];
    $time = $_POST['time'];
	$narrative = $_POST['narrative'];
	$vehicle = $_POST['vehicle'];
	$file = $_POST['file'];
	$filename = "Commend_UserID".$user_id."_".rand().".jpg";
	file_put_contents("images/commendations_images/".$filename,base64_decode($file));

    require_once 'connect.php';

    $sql = "INSERT INTO commendations (user_id, body_plate, narrative, date, time, vehicle, file) VALUES ('$user_id', '$body_plate', '$narrative', '$date', '$time', '$vehicle', '$filename')";

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