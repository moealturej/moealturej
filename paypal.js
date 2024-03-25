function handlePurchase(serviceName, price) {
    // Show loading indicator
    document.getElementById('paypal-button-container').innerHTML = '<div class="loading-indicator">Loading...</div>';
    
    paypal.Buttons({
        env: 'sandbox', /* sandbox | production */
        style: {
            layout: 'horizontal',   // horizontal | vertical 
            size:   'responsive',   /* medium | large | responsive*/
            shape:  'pill',         /* pill | rect*/
            color:  'gold',         /* gold | blue | silver | black*/
            fundingicons: false,    /* true | false */
            tagline: false          /* true | false */
        }, 
        createOrder: function() {
            /* Make a call to your server to set up the payment */
            var CREATE_URL = '/example/createOrder';
            return fetch(CREATE_URL)
                .then(function(res) {
                    return res.json();
                }).then(function(data) {
                    return data.orderID;
                });
        },
        onApprove: function(data, actions) {
            /* Make a call to your server to execute the payment */
            var EXECUTE_URL = '/example/executePayment';
            return fetch('/my-server/capture-paypal-transaction', {
                body: JSON.stringify({
                    orderID: data.orderID
                })
            }).then(function(res) {
                return res.json();
            }).then(function(details) {
                alert('Transaction funds captured from ' + details.payer_given_name);
            });
        }
    }).render('#paypal-button-container');
}
