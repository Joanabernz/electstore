<?php
$connect = mysqli_connect("localhost", "root", "", "electstore");
    if(!$connect){
        die("Connection failed: " . mysqli_connect_error());
    }

    $username = $_POST['username'];
    $password = $_POST['password']; 
    
    $sql = "SELECT * FROM customers WHERE username='$username' AND password='$password'";
    $result = mysqli_query($connect, $sql);
    if(mysqli_num_rows($result) > 0){
         header("Location: OrderCreate.html ");
        exit();
    }
       else {
        echo "Invalid username or password.";
    }
    $mysqli_close($connect);
?>