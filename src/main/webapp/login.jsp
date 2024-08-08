<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign In</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Main css -->
<link rel="stylesheet" href="css/login-style.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="login-container">
    <!-- Sign in image and link -->
    <div class="signin-image">
        <figure>
            <img src="images/signin-image.jpg" alt="Sign in image">
        </figure>
        <a href="registration.jsp" class="signup-image-link">Create an account</a>
    </div>

    <!-- Sign in form -->
    <div class="signin-form">
        <h1 class="form-title">Sign In</h1>
        <form method="post" action="login" class="login-form" id="login-form">
            <div class="form-group">
                <input type="text" name="username" id="username" placeholder="Username" />
            </div>
            <div class="form-group">
                <input type="password" name="password" id="password" placeholder="Password" />
            </div>
            <div class="form-group">
                <input type="checkbox" name="remember-me" id="remember-me" />
                <label for="remember-me" class="label-agree-term">Remember me</label>
            </div>
            <div class="form-group form-button">
                <button type="submit" name="signin" id="signin" class="form-submit">Log in</button>
            </div>
            <div class="social-login">
                <span class="social-label">Or login with</span>
                <ul class="socials">
                    <li><a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="#" class="social-icon"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#" class="social-icon"><i class="fab fa-google"></i></a></li>
                    <li><a href="#" class="social-icon"><i class="fab fa-instagram"></i></a></li>
                </ul>
            </div>
        </form>
    </div>
</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status === "failed") {
        swal("Sign In Failed", "The username or password you entered is incorrect. Please try again.", "error");
    }
</script>
</body>
</html>
