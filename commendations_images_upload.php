<?php

if($_SERVER['REQUEST_METHOD'] == 'POST') {

    $user_id = $_POST['user_id'];
    $file = $_POST['file'];

    $path = "images/commendations_images/$user_id.jpeg";
    $finalPath = "http://192.168.1.132/SpeakUP/".$path;

    require_once 'connect.php';

    $sql = "UPDATE commendations (file) VALUES ('$file') WHERE user_id='$user_id'";

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

/*
global $conn;
require_once 'connect.php';

	$upload_path = "images/commendations_images/";
    $finalPath = "http://192.168.1.132/SpeakUP/".$upload_path;
	
	$response = array();
	
	if($_SERVER['REQUEST_METHOD'] == 'POST') {
		if (isset($_POST['narrative'])) {
			
			$narrative = $_POST['narrative'];
			$fileinfo = pathinfo($_FILES['image']['name']);
			$extension = $fileinfo['extension'];
			$file_url = $upload_url . getFileName() . '.' . $extension;
			$file_path = $upload_path . getFileName() . '.' . $extension;
			$img_name = getFileName() . '.' . $extension;
			
			try{
				move_uploaded_file($_FILES['image']['tmp_name'],$file_path);
				
				$sql = "INSERT INTO commendations (file)";
				$sql = "VALUES ('{$file_url}');";
				
				if(mysqli_query($conn, $sql
					$response['error'] = false;
					$response['file'] = $file_url;
				}
			}catch(Exeption $e){
				$response['error'] = true;
				$response['message'] = $e->getMessage();
			}
			echo json_encode($response);
        
			mysqli_close($conn);
		}
	}
function getFileName() {
	global $conn;
	
}
*/


?>