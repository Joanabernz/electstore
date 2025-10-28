<?php
$conn = new mysqli ('yamanote.proxy.rlwy.net', 'root', 'jUpvuIHgXOAUuquWOoJVXMpYQmGiOkyU', 'electstore');
if(!$conn){
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $OrderID = $_POST['OrderID'];
    $Quantity = $_POST['Quantity'];

    $sql = "UPDATE orders SET Quantity='$Quantity' WHERE OrderID='$OrderID'";

    if ($conn->query($sql) === TRUE){
  
        echo "<script>
                alert('Order updated successfully!');
                window.location.href='OrderReport.html';
              </script>";
    } else {
        echo "Error updating order: " . mysqli_error($conn);
    }
}

$conn->close();

?>
