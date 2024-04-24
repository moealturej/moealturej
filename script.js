// Variable to keep track of the last service details shown
        var lastShownDetailsId = null;

        // Toggle service details visibility
        function toggleServiceDetails(id) {
            var details = document.getElementById('service-details-' + id);
            if (details.style.display === 'block') {
                details.style.display = 'none';
            } else {
                // If another service details is already shown, hide it first
                if (lastShownDetailsId !== null) {
                    var lastShownDetails = document.getElementById('service-details-' + lastShownDetailsId);
                    lastShownDetails.style.display = 'none';
                }
                details.style.display = 'block';
                renderPayPalButtons(id); // Render PayPal buttons for the selected service
            }
            lastShownDetailsId = id;
        }

        // Function to trigger file download
        function downloadFile(file) {
            var link = document.createElement('a');
            link.href = file; // Specify the path to your file
            link.download = file.split('/').pop(); // Extract the file name from the URL
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }

        // Function to toggle sidebar
function toggleSidebar() {
    var sidebar = document.getElementById('sidebar');
    var mainContent = document.querySelector('.main-content');
    var toggleButton = document.querySelector('.toggle-sidebar');

    if (sidebar.style.left === '0px') {
        sidebar.style.left = '-250px'; // Hide sidebar
        mainContent.style.marginLeft = '0'; // Shift main content back to original position
        toggleButton.textContent = 'Open Sidebar';
    } else {
        sidebar.style.left = '0px'; // Show sidebar
        mainContent.style.marginLeft = '250px'; // Shift main content to accommodate sidebar
        toggleButton.textContent = 'Close Sidebar';
    }
}

// Ensure sidebar is initially shown
toggleSidebar();

        // Function to fetch customer reviews
        function fetchCustomerReviews() {
            // Sample reviews data
            var reviews = [
                { review: "REP LEGIT/FAST SERVICE, got me hooked up with 5 camos", author: "- iday" },
                { review: "Rep+ legit and would definitely buy again", author: "- Jukkiesalt" },
                { review: "REP+++ this dude hooked me up with my favorite camo", author: "- Kewt'n" },
                { review: "He tha best he got me right with the camos", author: "- synaq_8" },
                { review: "I would like to thank you the owner and his hole team to for helping me I appreciate them it was fast and simple all I did was pay and show them I paid and I got the account 👍", author: "- 𝙸𝚌𝚘𝚗 💫" }
            ];

            var reviewsContainer = document.getElementById('customer-reviews-container');

            // Clear any existing reviews
            reviewsContainer.innerHTML = '';

            // Loop through reviews data and display them
            reviews.forEach(function(review) {
                var reviewDiv = document.createElement('div');
                reviewDiv.classList.add('review');
                reviewDiv.innerHTML = '<p>"' + review.review + '"</p><p class="author">' + review.author + '</p>';
                reviewsContainer.appendChild(reviewDiv);
            });
        }

        // Fetch customer reviews when the page loads
        window.onload = fetchCustomerReviews;
