$(document).ready(function () {
    console.log("ready");
})
document
    .getElementById("show-products")
    .addEventListener("click", function (e) {
        e.preventDefault(); // Prevent default link behavior
        const productBar = document.getElementById("product-bar");

        // Check current state and toggle
        if (productBar.style.top === "40px") {
            productBar.style.top = "-100%"; // Hide the product bar
        } else {
            productBar.style.top = "40px"; // Show the product bar
        }
    });

document.addEventListener("DOMContentLoaded", function () {
    const userButton = document.getElementById("user-button");
    const showLoginButton = document.getElementById("show-login");
    const logoutButton = document.getElementById("logout-button");

    // If user is logged in, show the modal on user button click
    if (userButton) {
        userButton.addEventListener("click", function (e) {
            e.preventDefault();
            const userDetailsModal = new bootstrap.Modal(
                document.getElementById("userDetailsModal")
            );
            userDetailsModal.show();
        });
    }

    // Handle logout
    if (logoutButton) {
        logoutButton.addEventListener("click", function () {
            // Perform logout operation
            fetch("/logout", { method: "GET" }) // Adjust your servlet endpoint

                .then(() => {
                    window.location.reload(); // Reload page to update UI
                })
                .catch((error) => console.error("Logout failed:", error));
        });
    }

    // Redirect to sign-in page on login button click
    if (showLoginButton) {
        showLoginButton.addEventListener("click", function (e) {
            e.preventDefault();
            window.location.href = "sign-in-page.jsp"; // Adjust your login page URL
        });
    }
});


document.addEventListener('DOMContentLoaded', function () {
    const toastElement = document.querySelector('.toast');
    const toast = new bootstrap.Toast(toastElement);
    toast.show();
});