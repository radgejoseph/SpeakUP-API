<?php

if($_SERVER['REQUEST_METHOD'] == 'POST'){

    $name = $_POST['name'];
	$username = $_POST['username'];
    $password = $_POST['password'];
	$phone_number = $_POST['phone_number'];
	$email = $_POST['email'];
	$address = $_POST['address'];
    $id = $_POST['id'];
	
	$password = password_hash($password, PASSWORD_DEFAULT);

    require_once 'connect.php';

    $sql = "UPDATE mobileappusers SET name='$name', username='$username', password='$password', phone_number='$phone_number', email='$email', address='$address' WHERE id='$id' ";

    if(mysqli_query($conn, $sql)) {

          $result["success"] = "1";
          $result["message"] = "success";

          echo json_encode($result);
          mysqli_close($conn);
      }
  }

else{

   $result["success"] = "0";
   $result["message"] = "error!";
   echo json_encode($result);

   mysqli_close($conn);
}

?>


