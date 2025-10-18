<?php
$conn = new mysqli("localhost", "root", "", "electstore");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {

$Firstname  = $_POST['Firstname'];
$Lastname   = $_POST['Lastname'];
$City       = $_POST['City'];
$username   = $_POST['username'];
$password   = $_POST['password'];

$sql = "INSERT INTO customers (Firstname, Lastname, City, username, password)
        VALUES ('$Firstname', '$Lastname', '$City', '$username', '$password')";             

    if ($conn->query($sql) === TRUE) {
        header("Location: indexRead.html");
    } else {
        echo "Error: " . $conn->error;
    }

    $conn->close();
}
?>