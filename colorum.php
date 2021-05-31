<?php

if ($_SERVER['REQUEST_METHOD'] =='POST'){

	$user_id = $_POST['user_id'];
    $body_plate = $_POST['body_plate'];
	$vehicle = $_POST['vehicle'];

    require_once 'connect.php';

    $sql = "INSERT INTO vehicles (admin_id, body_plate, vehicle, status, operator_id) VALUES ('$user_id', '$body_plate', '$vehicle', 'Colorum', '(NO INPUT)')";

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