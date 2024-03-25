// Create PayPal buttons
function createOrder(amount) {
    return function(data, actions) {
        return actions.order.create({
            purchase_units: [{
                amount: {
                    value: amount
                }
            }]
        });
    };
}

// Render PayPal buttons for each service option
function renderPayPalButton(id, amount) {
    paypal.Buttons({
        style: {
            shape: 'rect',
            color: 'gold',
            layout: 'vertical',
            label: 'paypal',
        },
        createOrder: createOrder(amount),
        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                alert('Transaction completed by ' + details.payer.name.given_name + '!');
            });
        }
    }).render('#paypal-button-container-' + id); // Render PayPal button for the corresponding service
}

// Toggle service details visibility
function toggleServiceDetails(id) {
    var details = document.getElementById('service-details-' + id);
    if (details.style.display === 'block') {
        details.style.display = 'none';
    } else {
        details.style.display = 'block';
    }
    renderPayPalButton(id, getServiceAmount(id));
}

// Get the amount based on selected option
function getServiceAmount(id) {
    var options = document.getElementsByName('weapon-option-' + id);
    for (var i = 0; i < options.length; i++) {
        if (options[i].checked) {
            switch (options[i].value) {
                case '5':
                    return '10.00';
                case '10':
                    return '15.00';
                case '15':
                    return '20.00';
                case 'all':
                    return '30.00';
            }
        }
    }
    return '0.00';
}

// Initialize PayPal buttons for the default option
renderPayPalButton(1, '30.00');
