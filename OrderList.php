<?php
$conn = mysqli_connect("localhost", "root", "", "electstore");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT orders.OrderID, customers.Firstname, products.ProductName, 
               orders.Quantity, orders.OrderDate
        FROM orders
        LEFT JOIN customers ON orders.CustomerID = customers.CustomerID
        LEFT JOIN products ON orders.ProductID = products.ProductID";

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Order List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: white;
        }
        th, td {
            border: 0.5px solid #2b2828ff;
            text-align: center;
            padding: 3px;
        }
        th {
            background-color: #b1aac7ff;
        }
        form {
            display: inline;
        }
        input[type=submit] {
            background-color: #e2bdbcff;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .add-btn {
            display: block;
            width: fit-content;
            margin: 10px auto;
            padding: 5px 15x;
            background-color: #ada2cfff;
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }
        .add-btn:hover {
            background-color: #cfc7e6;
            width: 100%;
            color: #2b2828ff;
        }
    </style>
</head>
<body>

<?php
if ($result && $result->num_rows > 0) {
    echo "<table>";
    echo "<tr>
            <th>Order ID</th>
            <th>Customer</th>
            <th>Product</th>
            <th>Quantity</th>
            <th>Date</th>
            <th>Action</th>
          </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["OrderID"] . "</td>";
        echo "<td>" . $row["Firstname"] . "</td>";
        echo "<td>" . $row["ProductName"] . "</td>";
        echo "<td>" . $row["Quantity"] . "</td>";
        echo "<td>" . $row["OrderDate"] . "</td>";
        echo "<td>
                <form action='DeleteOrder.php' method='POST' onsubmit='return confirm(\"Are you sure you want to delete this order?\");'>
                    <input type='hidden' name='OrderID' value='" . $row["OrderID"] . "'>
                    <input type='submit' value='Delete'>
                </form>
              </td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "<p style='text-align:center;'>No orders found.</p>";
}

$conn->close();
?>



</body>
</html>
