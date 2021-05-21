<html>
<head>
    <title>PHP Test</title>
</head>
<body>
<?php echo '<p>TEST!</p>';
require_once 'connect.php';

if (mysqli_connect_errno()){
    die('Unable to connect to datebase ' . mysqli_connect_error());
}
$sql = "SELECT vehicles.vehicle, vehicles.body_plate, IFNULL(ROUND(AVG(reviews.ratings)),0) FROM vehicles LEFT JOIN reviews ON vehicles.body_plate=reviews.body_plate  WHERE vehicles.vehicle='taxicle' GROUP BY vehicles.body_plate";

$result = mysql_query($sql);
echo [$result];
?>
</body>
</html>