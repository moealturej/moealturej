<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];

    // Here you can do whatever you want with the form data
    // For now, let's just print it
    echo "Name: $name <br>";
    echo "Email: $email <br>";
    echo "Message: $message <br>";
}
?>

