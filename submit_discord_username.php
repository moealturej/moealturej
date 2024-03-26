<?php
// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve Discord username from the POST request
    $discordUsername = $_POST["discord-username"];

    // Perform necessary validation and sanitization

    // Example: Check if the Discord username is not empty
    if (!empty($discordUsername)) {
        // Write the Discord username to a text file
        $file = fopen("discord_usernames.txt", "a") or die("Unable to open file!");
        fwrite($file, $discordUsername . PHP_EOL);
        fclose($file);

        // Redirect the user or display a confirmation message
        echo "Discord username submitted successfully!";
    } else {
        // If the Discord username is empty, display an error message
        echo "Error: Discord username cannot be empty!";
    }
} else {
    // If the request method is not POST, display an error message
    echo "Error: Invalid request method!";
}
?>
