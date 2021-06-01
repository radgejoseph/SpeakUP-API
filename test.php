<html>
<head>
    <title>PHP Test</title>
</head>
<body>
<?php

require_once 'connect.php';

if (mysqli_connect_errno()){
    die('Unable to connect to datebase ' . mysqli_connect_error());
}
echo '<p>TEST!</p>';

//$stmt = $conn->prepare("SELECT vehicle, body_plate FROM puvs WHERE vehicle='jeep';");
$stmt = $conn->prepare("SELECT vehicles.vehicle, vehicles.body_plate, IFNULL(ROUND(AVG(reviews.ratings)),0) FROM vehicles LEFT JOIN reviews ON vehicles.body_plate=reviews.body_plate  WHERE vehicles.vehicle='taxicle' GROUP BY vehicles.body_plate;");

$stmt->execute();

$stmt->bind_result($vehicle, $body_plate, $ratings);

$items = array();

//traversing through all the result
while($stmt->fetch()){
    $temp = array();
    $temp['vehicle'] = $vehicle;
    $temp['body_plate'] = $body_plate;
    $temp['ratings'] = $ratings;
    array_push($items, $temp);
}

//displaying the result in json format
echo json_encode($items);
?>
</body>
</html>