<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer Doctor</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="code.jquery.com_jquery-3.7.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery library -->
</head>
<body>
<nav class="navbar navbar-expand-lg bg-black ">
    <div class="container ">
        <a class="navbar-brand text-white" href="#">Computer Doctor</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarNav">
            <ul class="navbar-nav ms-auto  ">
                <li class="nav-item text-white ">
                    <a class="nav-link active text-white" id="show-products" aria-current="page" href="#">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Accessories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Laptop</a>
                </li>
                <li class="nav-item text-white">
                    <a class="nav-link text-white" href="#">Mobile</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link text-white" href="#">CCTV</a>
                </li>

            </ul>
            <div class="ms-auto" >
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light border border-0" type="submit"> <i class="fa-solid fa-magnifying-glass"></i></button>
                    <button class="btn btn-outline-light border border-0" ><i class="fa-solid fa-cart-shopping"></i></button>
                    <button class="btn btn-outline-light border border-0" id="show-login"><i class="fa-solid fa-user"></i></button>
                </form>
            </div>
        </div>
    </div>
</nav>
<!-- Hero Section -->
<section class="hero-section">
    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="casing.jpg" class="d-block w-100" alt=" new arrival casing ">
            </div>
            <div class="carousel-item">
                <img src="roggamingcase.jpg" class="d-block w-100" alt="rog-gaming-case">
            </div>
            <div class="carousel-item">
                <img src="keyboard.jpg" class="d-block w-100" alt="new arrival keyboard">
            </div>
            <div class="carousel-item">
                <img src="liqwidcooler.jpg" class="d-block w-100" alt="new arrival liqwid cooler">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>
<section id="Laptop-video">
    <video muted src="2022%20Nitro%205%20%20Gaming%20Laptop%20%20Acer%20-%20Acer%20(720p,%20h264).mp4" class="object-fit-fill" autoplay></video>
</section>
<section class="Categories-link">
    <div class="motherboard">
        <a href="/pages/mother-boards-page.html"><img src="motherBoard%20new.png" class="img-fluid" alt="mother-boards-page"></a>
    </div>
    <div class="proccersor">
        <a href="#"><img src="ryzen%20processor.png" class="img-fluid" alt="proccersor"></a>
    </div>
</section>
<!-- Product Section -->

<!-- products-bar -->
<div class="container-fluid my-4 bg-black bg-opacity-75" id="product-bar">
    <div class="container">
        <div class="row g-4 ">
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <a href="/pages/mother-boards-page.html" class="text-decoration-none text-white">
                        <img src="/assests/images/motherBoard.jpg" alt="motherBoard" class="img-fluid rounded">
                        <p class="mt-2 fw-bold">MOTHERBOARD</p>
                    </a>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <a href="#" class="text-decoration-none text-white">
                        <img src="/assests/images/ram.jpg" alt="ram" class="img-fluid rounded">
                        <p class="mt-2 fw-bold">MEMORY</p>
                    </a>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <a href="#" class="text-decoration-none text-white">
                        <img src="/assests/images/ssd.jpg" alt="SSD" class="img-fluid rounded">
                        <p class="mt-2 fw-bold">SSD</p>
                    </a>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <a href="#" class="text-decoration-none text-white">
                        <img src="/assests/images/pws.jpg" alt="power-supply" class="img-fluid rounded">
                        <p class="mt-2 fw-bold">POWER SUPPLY</p>
                    </a>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <a href="#" class="text-decoration-none text-white">
                        <img src="/assests/images/gpu.jpg" alt="graphics-card" class="img-fluid rounded">
                        <p class="mt-2 fw-bold">GRAPHICS CARD</p>
                    </a>
                </div>
            </div>
            <div class="col-6 col-sm-4 col-md-3">
                <div class="product-bar-item text-center">
                    <a href="#" class="text-decoration-none text-white">
                        <img src="/assests/images/casing copy.jpg" alt="pc-case" class="img-fluid rounded">
                        <p class="mt-2 fw-bold">PC CASE</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-black text-white py-4">
    <div class="container text-center">
        <p>&copy; 2025 Computer Doctor. All rights reserved.</p>
    </div>

</footer>
<script src="index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>