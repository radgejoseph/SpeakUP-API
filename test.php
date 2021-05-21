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
$sql = "SELECT puvs.vehicle, puvs.body_plate, IFNULL(ROUND(AVG(reviews.ratings)),0) FROM puvs LEFT JOIN reviews ON puvs.body_plate=reviews.body_plate  WHERE puvs.vehicle='jeep' GROUP BY puvs.body_plate";

$result = mysql_query($sql);
echo [$result];
?>
</body>
</html>