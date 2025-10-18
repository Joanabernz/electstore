<?php
$conn = mysqli_connect("localhost", "root", "", "electstore");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $OrderID = $_POST['OrderID'];

    $sql = "DELETE FROM orders WHERE OrderID='$OrderID'";

    if ($conn->query($sql) === TRUE) {
        echo "<script>
                alert('Order deleted successfully!');
                window.location.href='OrderList.html';
              </script>";
    } else {
        echo "Error deleting record: " . mysqli_error($conn);
    }
}

$conn->close();
?>