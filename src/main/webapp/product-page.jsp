<%@ page import="lk.ijse.computerdoctorecom.DTO.User" %>
<%@ page import="lk.ijse.computerdoctorecom.DTO.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.computerdoctorecom.DTO.Product" %><%--
  Created by IntelliJ IDEA.
  User: charithharsha
  Date: 2025-01-23
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mother Boards | Computer Doctor</title>
    <link rel="stylesheet" href="css/product-page.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
          integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<script src="code.jquery.com_jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery library -->


<body>
<%
    List<Product> productList = (List<Product>) request.getServletContext().getAttribute("productList");
    User user = null;
    try {
        user = (User) request.getServletContext().getAttribute("user");
    } catch (Exception e) {
%>
<div class="toast-container position-fixed top-0 end-0 p-3">
    <div class="toast show align-items-center text-bg-danger border-0" role="alert" aria-live="assertive"
         aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <strong>Alert!</strong> Please Login First.
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
                    aria-label="Close"></button>
        </div>
    </div>
</div>
<%
    }
    boolean isLoggedIn = false;
    if (user != null) {
        String name = user.getName();
        String password = user.getPassword();
        String email = user.getEmail();
        String type = user.getType();
        isLoggedIn = email != null && type != null;

    }
    String login = request.getParameter("login");
    String error = request.getParameter("error");
    if (login != null) {
%>
<div class="toast-container position-fixed top-0 end-0 p-3">
    <div class="toast show align-items-center text-bg-success border-0" role="alert" aria-live="assertive"
         aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <strong>Success!</strong> You have logged in successfully.
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
                    aria-label="Close"></button>
        </div>
    </div>
</div>
<%
    }
    if (error != null) {
%>
<div class="toast-container position-fixed top-0 end-0 p-3">
    <div class="toast show align-items-center text-bg-danger border-0" role="alert" aria-live="assertive"
         aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <strong>Error!</strong> Login failed.
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
                    aria-label="Close"></button>
        </div>
    </div>
</div>
<%

    }
%>

<nav class="navbar navbar-expand-lg bg-black ">
    <div class="container ">
        <a class="navbar-brand text-white" href="#">Computer Doctor</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarNav">
            <ul class="navbar-nav ms-auto  ">
                <li class="nav-item text-white ">
                    <a class="nav-link active text-white" aria-current="page" href="product-page.jsp">Products</a>
                </li>

                <button type="button" class="btn btn-none nav-link text-white" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                    Add Product
                </button>

            </ul>
            <div class="ms-auto">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light border border-0" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                    <button class="btn btn-outline-light border border-0" id="cart-button">
                        <i class="fa-solid fa-cart-shopping"></i>
                    </button>
                    <%
                        if (isLoggedIn) {
                    %>
                    <button class="btn btn-outline-light border border-0" id="user-button">
                        <div class="d-flex align-items-center">
                            <i class="fa-solid fa-user"></i>
                            <p class="mb-0 ms-2"><%= user.getName() %>
                            </p>
                        </div>
                    </button>
                    <%
                    } else {
                    %>
                    <button class="btn btn-outline-light border border-0" id="show-login">
                        <i class="fa-solid fa-user"></i>
                    </button>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
    </div>
</nav>
<%--user details--%>
<div class="modal fade" id="userDetailsModal" tabindex="-1" aria-labelledby="userDetailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-end">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userDetailsModalLabel">User Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <%
                    if (user != null) {
                %>
                <p><strong>Name:</strong> <span id="userName"><%= user.getName() %></span></p>
                <p><strong>Email:</strong> <span id="userEmail"><%= user.getEmail() %></span></p>
                <p><strong>Type:</strong> <span id="userPhone"><%= user.getType() %></span></p>
                <%
                    }
                %>
                <button class="btn btn-danger" id="logout-button">Logout</button>
            </div>
        </div>
    </div>
</div>


<!-- Main Content -->
<div class="container my-5">
    <div class="row">
        <!-- Sidebar Filters -->
        <div class="col-md-3">
            <h5>Filters</h5>
            <div class="mb-4">
                <h6>Price</h6>
                <input type="range" class="form-range" min="0" max="1600000">
            </div>
            <div class="mb-4">
                <h6>Availability</h6>
                <div>
                    <input type="checkbox" id="inStock">
                    <label for="inStock">In Stock</label>
                </div>
                <div>
                    <input type="checkbox" id="preOrder">
                    <label for="preOrder">Pre Order</label>
                </div>
            </div>
            <div class="mb-4">
                <h6>Brand</h6>
                <div>
                    <input type="checkbox" id="amd">
                    <label for="amd">AMD</label>
                </div>
                <div>
                    <input type="checkbox" id="intel">
                    <label for="intel">Intel</label>
                </div>
            </div>
            <div class="mb-4">
                <h6>Generation</h6>
                <div>
                    <input type="checkbox" id="6thGen">
                    <label for="6thGen">6th Gen</label>
                </div>
                <div>
                    <input type="checkbox" id="10thGen">
                    <label for="10thGen">10th Gen</label>
                </div>
            </div>
            <div class="mb-4">
                <h6>Cores</h6>
                <div>
                    <input type="checkbox" id="2cores">
                    <label for="2cores">2 Cores</label>
                </div>
                <div>
                    <input type="checkbox" id="4cores">
                    <label for="4cores">4 Cores</label>
                </div>
            </div>
            <div class="mb-4">
                <h6>Threads</h6>
                <div>
                    <input type="checkbox" id="2threads">
                    <label for="2threads">2 Threads</label>
                </div>
                <div>
                    <input type="checkbox" id="4threads">
                    <label for="4threads">4 Threads</label>
                </div>
            </div>
        </div>

        <!-- Products Grid -->
        <div class="col-md-9">
            <div class="products">
                <div class="container">

                    <h1 class="lg-title">Products</h1>
                    <%

                        if (productList != null) {
                    %>

                    <div class="product-items">
                        <!-- single product -->
                        <%
                            for (Product product : productList) {
                        %>
                        <div class="product">
                            <div class="product-content">
                                <div class="product-img">
                                    <img src="<%= product.getProductImage() %>"
                                         alt=<%= product.getProductName() %>>
                                </div>
                                <%
                                    if (product.getProductQty() > 0) {
                                %>
                                <div class="product-btns">
                                    <button type="button" class="btn-cart"> add to cart
                                        <span><i class="fas fa-plus"></i></span>
                                    </button>
                                </div>
                            </div>
                            <%
                            } else {
                            %>
                            <div class="product-btns">
                                <button type="button" class="btn-cart" disabled> out of stock
                                    <span><i class="fas fa-plus"></i></span>
                                </button>
                            </div>
                            <%
                                }
                            %>

                            <div class="product-info"
                                 onclick="showDetails('asrock_b550m_pro_se_new_motherboard_b550_amd_pro56')">
                                <div class="product-info-top">
                                    <h2 class="sm-title"><%= product.getProductName() %>
                                    </h2>
                                    <div class="rating">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="far fa-star"></i></span>
                                    </div>
                                </div>
                                <a href="" class="product-name"><%= product.getProductDescription() %>
                                </a>
                                <p class="product-price"><%=product.getProductPrice() + 5000%>
                                </p>
                                <p class="product-price"><%=product.getProductPrice()%>
                                </p>
                            </div>
                        </div>
                        <!-- end of single product -->
                        <%
                                }
                            }else {
                                System.out.println("List is null");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--
<!-- products-bar -->
<div class="container-fluid my-4 bg-black bg-opacity-75" id="product-bar">
    <div class="container">
        <%
            if (categories == null) {
                System.out.println("List is null");
            }
            if (categories != null) {
                for (Category category : categories) {
                    System.out.println(category.getName() + " " + category.getImage());
        %>
        <h1 class="lg-title"><%= category.getName() + " " +
                category.getImage()%>
        </h1>
        <div class="row g-4 ">
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <a href="product-page.jsp" class="text-decoration-none text-white">
                        <img src="<%= category.getImage() %>" alt="<%= category.getName() %>" class="img-fluid rounded">
                        <p class="mt-2 fw-bold"><%= category.getName() %>
                        </p>
                    </a>
                </div>
            </div>
            <% }
            } %>
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-none" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        <img src="assests/images/category/add%20product.png" alt="pc-case" class="img-fluid rounded">
                    </button>
                    <p class="mt-2 fw-bold text-decoration-none text-white">ADD CATEGORY</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="category" enctype="multipart/form-data" method="post">
                    <div class="input-field">
                        <input type="text" class="form-control " id="categoryName" name="categoryName"
                               placeholder="Category Name" required>
                    </div>
                    <div class="input-field">
                        <input type="file" class="form-control " id="categoryImage" name="categoryImage"
                               placeholder="Category Image" required>
                    </div>
                    <input type="submit" class="btn btn-dark " value="Save">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                </form>
            </div>
        </div>
    </div>
</div>
--%>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Add Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form class="row g-3" action="add-product" enctype="multipart/form-data" method="post">
                    <div class="col-md-6">
                        <label for="productId" class="form-label">Product ID</label>
                        <input type="email" disabled class="form-control" id="productId" name="productId"
                               placeholder="Auto Generated">
                    </div>
                    <div class="col-md-6">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName">
                    </div>
                    <div class="col-12">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                    </div>
                    <div class="col-md-6">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" class="form-control" id="price" name="price" placeholder="Ex: 1000">
                    </div>
                    <div class="col-md-6">
                        <label for="qty" class="form-label">Qty</label>
                        <input type="number" class="form-control" name="qty" id="qty">
                    </div>
                    <div class="col-md-6">
                        <label for="category" class="form-label">Category</label>
                        <select id="category" class="form-select" name="category">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label for="productImage" class="form-label">Upload Image</label>
                        <input type="file" class="form-control" id="productImage" name="productImage">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-dark">Add Product</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


<!-- Footer -->
<footer style="background-color: #111; color: #fff; padding: 40px 20px;">
    <div class="container">
        <div class="row">
            <!-- Company Section -->
            <div class="col-md-3">
                <h5>COMPANY</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="footer-link">About</a></li>
                    <li><a href="#" class="footer-link">Careers</a></li>
                    <li><a href="#" class="footer-link">Contact</a></li>
                    <li><a href="#" class="footer-link">Invest With Us</a></li>
                    <li><a href="#" class="footer-link">Hitawathkama</a></li>
                    <li><a href="#" class="footer-link">Mega Triple</a></li>
                    <li><a href="#" class="footer-link">Team</a></li>
                    <li><a href="#" class="footer-link">Wholesale</a></li>
                </ul>
            </div>
            <!-- Brands Section -->
            <div class="col-md-3">
                <h5>BRANDS</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="footer-link">Arctic</a></li>
                    <li><a href="#" class="footer-link">Thermaltake</a></li>
                    <li><a href="#" class="footer-link">Addlink</a></li>
                    <li><a href="#" class="footer-link">Keychron</a></li>
                    <li><a href="#" class="footer-link">Asus</a></li>
                    <li><a href="#" class="footer-link">MSI</a></li>
                    <li><a href="#" class="footer-link">Corsair</a></li>
                    <li><a href="#" class="footer-link">MarsRhino</a></li>
                </ul>
            </div>
            <!-- Support Section -->
            <div class="col-md-3">
                <h5>SUPPORT</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="footer-link">FAQ</a></li>
                    <li><a href="#" class="footer-link">Shipping</a></li>
                    <li><a href="#" class="footer-link">Returns & Refunds</a></li>
                    <li><a href="#" class="footer-link">Where to Buy</a></li>
                    <li><a href="#" class="footer-link">Build My PC</a></li>
                    <li><a href="#" class="footer-link">PC Customization</a></li>
                    <li><a href="#" class="footer-link">PC Services</a></li>
                    <li><a href="#" class="footer-link">Warranty</a></li>
                </ul>
            </div>
            <!-- Contact Section -->
            <div class="col-md-3">
                <h5>CONTACT</h5>
                <div class="social-icons">
                    <a href="#" class="footer-icon"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="footer-icon"><i class="fab fa-youtube"></i></a>
                    <a href="#" class="footer-icon"><i class="fab fa-twitch"></i></a>
                    <a href="#" class="footer-icon"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="footer-icon"><i class="fab fa-discord"></i></a>
                    <a href="#" class="footer-icon"><i class="fab fa-tiktok"></i></a>
                </div>
            </div>
        </div>
        <hr style="border-top: 1px solid #444;">
        <div class="text-center">
            <p class="mb-0">© 2024 All rights reserved by Computer Doctor.</p>
            <p><a href="#" class="footer-link">Privacy Policy</a> | <a href="#" class="footer-link">Terms of Use</a></p>
        </div>
    </div>
</footer>
<script src="js/product-page.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>
</html>