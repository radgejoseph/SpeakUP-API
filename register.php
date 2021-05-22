<?php
require_once 'connect.php';
if (mysqli_connect_errno()){
    die('Unable to connect to datebase ' . mysqli_connect_error());
}
if ($_SERVER['REQUEST_METHOD'] =='POST'){

    $name = $_POST['name'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $phone_number = $_POST['phone_number'];
    $email = $_POST['email'];
    $address = $_POST['address'];

    $password = password_hash($password, PASSWORD_DEFAULT);

    $sql = "INSERT INTO mobileappusers (name, username, password, phone_number, email, address, status) 
	VALUES ('$name', '$username', '$password', '$phone_number', '$email', '$address', 'Not Verified')";

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