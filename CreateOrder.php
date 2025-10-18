<?php
$conn = new mysqli ('localhost', 'root', '', 'electstore');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
   $CustomerID = $_POST['CustomerID'];
   $ProductID = $_POST['ProductID'];
   $OrderDate = $_POST['OrderDate'];
   $Quantity = $_POST['Quantity'];

   $sql = "INSERT INTO orders (CustomerID, ProductID, OrderDate, Quantity) VALUES ('$CustomerID', '$ProductID', '$OrderDate', '$Quantity')";    

if($conn->query($sql) === TRUE) {
  header("Location: OrderList.html");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
}

?>