<?php

if ($_SERVER['REQUEST_METHOD'] =='POST'){

	$user_id = $_POST['user_id'];
	//$name = $_POST['name'];
	//$username = $_POST['username'];
    $body_plate = $_POST['body_plate'];
	$ratings = $_POST['ratings'];
	$narrative = $_POST['narrative'];

    require_once 'connect.php';

    $sql = "INSERT INTO reviews (user_id, body_plate, ratings, narrative) VALUES ('$user_id', '$body_plate', '$ratings', '$narrative')";

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