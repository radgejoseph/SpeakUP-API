<?php

if ($_SERVER['REQUEST_METHOD'] =='POST') {

    $user_id = $_POST['user_id'];
    $body_plate = $_POST['body_plate'];
    $vehicle = $_POST['vehicle'];

    require_once 'connect.php';

    $plate_sql = "SELECT * FROM vehicles WHERE body_plate='$body_plate'";

    $response = mysqli_query($conn, $plate_sql);

    $sql = "INSERT INTO vehicles (admin_id, body_plate, vehicle, status, operator_id) VALUES ('$user_id', '$body_plate', '$vehicle', 'Colorum', '1')";

    if ($vehicle == 'select type') {
        echo json_encode("Please select type");
        mysqli_close($conn);
    }
    else{
        if (mysqli_num_rows($response) === 1) {

            echo json_encode("Plate already exist");
            mysqli_close($conn);
        } else {
            if (mysqli_query($conn, $sql)) {
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
    }
}
?>