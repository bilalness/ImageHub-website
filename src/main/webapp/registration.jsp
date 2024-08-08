<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Main css -->
<link rel="stylesheet" href="css/registration-style.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="signup-container">
    <!-- Sign up form -->
    <div class="signup-form">
        <h2 class="form-title">Sign Up</h2>
        <form method="post" action="register" class="register-form" id="register-form">
            <div class="form-group">
                <i class="fas fa-user icon"></i>
                <input type="text" name="name" id="name" placeholder="Your Name" />
            </div>
            <div class="form-group">
                <i class="fas fa-envelope icon"></i>
                <input type="email" name="email" id="email" placeholder="Your Email" />
            </div>
            <div class="form-group">
                <i class="fas fa-lock icon"></i>
                <input type="password" name="pass" id="pass" placeholder="Password" />
            </div>
            <div class="form-group">
                <i class="fas fa-lock icon"></i>
                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" />
            </div>
            <div class="form-group">
                <i class="fas fa-phone icon"></i>
                <input type="text" name="contact" id="contact" placeholder="Contact no" />
            </div>
            <div class="form-group">
                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                <label for="agree-term" class="label-agree-term"><span></span>I agree to all statements in <a href="#" class="term-service">Terms of service</a></label>
            </div>
            <div class="form-group form-button">
                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
            </div>
        </form>
    </div>

    <!-- Sign up image -->
    <div class="signup-image">
        <figure>
            <img src="images/signup-image.jpg" alt="Sign up image">
        </figure>
        <a href="login.jsp" class="signup-image-link">I am already a member</a>
    </div>
</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status === "success") {
        swal("Welcome!", "Your account has been created successfully. We're excited to have you on board! You can now log in and start using our services.", "success");
    }
</script>
</body>
</html>
