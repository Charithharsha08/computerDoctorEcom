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

function showDetails(id) {
  localStorage.setItem("productId", id);
  window.location.href = "product-detail.html";
}
