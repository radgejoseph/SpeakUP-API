<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {

//    $name = $_POST['name'];
//    $username = $_POST['username'];
//    $password = $_POST['password'];
//    $phone_number = $_POST['phone_number'];
//    $email = $_POST['email'];
//    $address = $_POST['address'];

    require_once 'connect.php';

    $name = isset($_POST['name']) ? $_POST['name'] : null;
    $username = isset($_POST['username']) ? $_POST['username'] : null;
    $password = isset($_POST['password']) ? $_POST['password'] : null;
    $phone_number = isset($_POST['phone_number']) ? $_POST['phone_number'] : null;
    $email = isset($_POST['email']) ? $_POST['email'] : null;
    $address = isset($_POST['address']) ? $_POST['address'] : null;

    $password = password_hash($password, PASSWORD_DEFAULT);

    $user_sql = "SELECT * FROM mobileappusers WHERE username='$username' ";

    $response = mysqli_query($conn, $user_sql);

    $sql = "INSERT INTO mobileappusers (name, username, password, phone_number, email, address, status) 
    VALUES ('$name', '$username', '$password', '$phone_number', '$email', '$address', 'Not Verified')";

    if ( mysqli_num_rows($response) === 1 ) {

        echo json_encode("Username already exist");
        mysqli_close($conn);
    }
    else {
        if (mysqli_query($conn, $sql)) {

            $result["success"] = "1";
            $result["message"] = "success";

            echo json_encode($result);
            mysqli_close($conn);

        }
        else {

            $result["success"] = "0";
            $result["message"] = "error";

            echo json_encode($result);
            mysqli_close($conn);
        }
    }
}
?>