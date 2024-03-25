<?php
// Validate and sanitize user input
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = $_POST['password']; // No sanitization needed for password
    $weaponOption = $_POST['weapon-option-1']; // No sanitization needed for weapon option

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        // Handle invalid email format
        echo "Invalid email address. Please provide a valid email.";
        exit();
    }

    // Hash the password securely
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Add the email and hashed password to the login.txt file
    $file = fopen("login.txt", "a");
    if ($file) {
        fwrite($file, "Email: $email, Hashed Password: $hashedPassword, Weapon Option: $weaponOption\n");
        fclose($file);
    } else {
        // Handle file writing error
        echo "An error occurred while processing your request. Please try again later.";
        exit();
    }

    // Redirect back to the services section after processing
    header("Location: index.html#services");
    exit();
}
?>
