<?php
// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve Discord username from the POST request
    $discordUsername = $_POST["discord-username"];

    // Perform necessary validation and sanitization

    // Store the Discord username securely in your database
    // Ensure you use prepared statements to prevent SQL injection

    // Redirect the user or display a confirmation message
}
?>
