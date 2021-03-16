<?php

if($_SERVER['REQUEST_METHOD'] == 'POST') {

    $user_id = $_POST['user_id'];
    $file = $_POST['file'];

    $path = "images/complaints_images/$user_id.jpeg";
    $finalPath = "http://192.168.1.132/SpeakUP/$path";

    require_once 'connect.php';

    $sql = "UPDATE complaints (file) VALUES ('$file') WHERE user_id='$user_id'";

    if (mysqli_query($conn, $sql)) {
        
        if ( file_put_contents( $path, base64_decode($file) ) ) {
            
            $result['success'] = "1";
            $result['message'] = "success";

            echo json_encode($result);
            mysqli_close($conn);

        }
		else
		{
			echo "Faild to upload image!";
		}

    }

}

?>