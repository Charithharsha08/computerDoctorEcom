<%--
  Created by IntelliJ IDEA.
  User: charithharsha
  Date: 2025-01-19
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="sign-in-page.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery library -->
    <title>Login</title>
</head>
<body>
<div class="wrapper">
    <div class="container main">
        <div class="row">
            <div class="col-md-6 side-image">

                <!-------------      image     ------------->

                <img src="computer%20Doctor%20Logo.png" alt="">
                <div class="text">
                    <p>We Have Solution For Your All Computer Problems</p>
                </div>

            </div>

            <div class="col-md-6 right">

                <div class="input-box">

                    <header>Login account</header>
                    <form action="sign-in" method="get">
                        <div class="input-field">
                            <input type="email" name="email" id="email" class="input" required autocomplete="on">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field">
                            <input type="password" name="password" class="input" id="pass" required>
                            <label for="pass">Password</label>
                        </div>
                        <div class="input-field">
                            <input type="submit" class="submit" value="Sign In">
                        </div>
                    </form>
                    <div class="signup">
                        <span>New to Computer Doctor <a href="sign-up-page.jsp">Sign Up Now</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>