<?php

if ($_SERVER['REQUEST_METHOD'] =='POST'){

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

//    if( empty( $name ) || empty( $username ) || empty( $password ) || empty( $phone_number ) || empty( $email ) || empty( $address ) ){
//        echo json_encode(array( "success" => "0","message" => "Parameter missing!") );
//    }

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
//    if( $result= mysqli_query($con, $sql)) {
//
//        if(mysqli_num_rows($result) > 0){
//            $emparray = array();
//            while ($row = mysqli_fetch_assoc($result)!=NULL) {
//                $emparray[] = $row;
//            }
//
//            echo json_encode(array( "success" => "1","message" => "Login successfully!", "data" => $emparray) );
//        }
//        else{
//            echo json_encode(array( "success" => "0","message" => "Invalid username or password!") );
//        }
//    }
//    mysqli_close($conn);
}

////Don't run code until POST request is received
//if($_SERVER['REQUEST_METHOD']=='POST'){
//    include_once("dbConfig.php");
//
//    //Extract content of POST request into variables $mi_id, $name
//    $mi_id = isset($_POST['mi_id']) ? $_POST['mi_id'] : null;
//    $name = isset($_POST['name']) ? $_POST['name'] : null;
//
//    //Don't run next code if any of these variables
//    //is empty null or false; return message
//    if( empty( $mi_id ) || empty( $name ) ){
//        echo json_encode(array( "status" => "false","message" => "Parameter missing!") );
//    }
//
//    //If all you made it here, let's run the query;
//    $query= "SELECT * FROM registerdemo WHERE mi_id='$mi_id' AND name='$name'";
//
//    //Only if there's result and greater than 0, then return something
//    if( $result= mysqli_query($con, $query)) {
//
//        if(mysqli_num_rows($result) > 0){
//            $emparray = array();
//            while ($row = mysqli_fetch_assoc($result)!=NULL) {
//                $emparray[] = $row;
//            }
//
//            echo json_encode(array( "status" => "true","message" => "Login successfully!", "data" => $emparray) );
//        }
//        else{
//            echo json_encode(array( "status" => "false","message" => "Invalid username or password!") );
//        }
//    }
//    else {
//        echo json_encode(array( "status" => "false","message" => "Error occured, please try again!") );
//    }
//    // Close mysql connection;
//    mysqli_close($con);
//}
?>