<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PayPal Donation</title>
</head>
<body>
    <!-- Container for the PayPal button -->
    <div id="paypal-button-container"></div>

    <!-- JavaScript code to handle PayPal integration -->
    <script>
        // Function to create a PayPal donation
        function createDonation(amount) {
            return function(actions) {
                return actions.payment.create({
                    transactions: [{
                        amount: {
                            value: amount,
                            currency: 'USD'
                        }
                    }]
                });
            };
        }

        // Render PayPal donation button
        paypal.Buttons({
            style: {
                shape: 'rect',
                color: 'gold',
                layout: 'vertical',
                label: 'donate'
            },
            createDonation: createDonation('30.00'), // Set default donation amount
            onApprove: function(data, actions) {
                return actions.payment.execute().then(function(details) {
                    alert('Thank you for your purchase!');
                    // Optionally, you can perform additional actions after successful donation
                });
            },
            onError: function(err) {
                console.error('An error occurred during purchase:', err);
                // Provide feedback to the user about the error
            }
        }).render('#paypal-button-container'); // Render PayPal button in the specified container
    </script>
</body>
</html>
