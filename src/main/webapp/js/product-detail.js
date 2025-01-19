document
  .getElementById("show-products")
  .addEventListener("click", function (e) {
    e.preventDefault(); // Prevent default link behavior
    const productBar = document.getElementById("product-bar");

    // Check current state and toggle
    if (productBar.style.top === "30px") {
      productBar.style.top = "-100%"; // Hide the product bar
    } else {
      productBar.style.top = "30px"; // Show the product bar
    }
  });

$("#show-login").click(function (e) {
  console.log("clicked");
  e.preventDefault();
  window.location.href = "pages/sign-in-page.html"; // Replace with your desired URL
});
