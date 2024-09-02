<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ImageHub</title>
    <link rel="stylesheet" href="css/home-style.css">
</head>
<body>
    <!-- Header with Navigation -->
    <header>
        <div class="logo">
            <h1>ImageHub</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#" id="login-button">Login</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content Area -->
    <div class="content">
        <h2>Welcome to ImageHub</h2>
        <p>Your place to explore, share, and discover amazing images.</p>
    </div>

    <!-- Login Modal -->
    <div id="login-modal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            <h2>Login</h2>
            <form id="login-form" action="login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="Login">
                </div>
                <p class="switch-modal">Don't have an account? <a href="#" id="register-link">Register</a></p>
            </form>
        </div>
    </div>

    <!-- Register Modal -->
    <div id="register-modal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            <h2>Create an Account</h2>
            <form id="register-form" action="register" method="post">
                <div class="form-group">
                    <label for="new-username">Username</label>
                    <input type="text" id="new-username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="new-email">Email</label>
                    <input type="email" id="new-email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="new-password">Password</label>
                    <input type="password" id="new-password" name="password" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="Register">
                </div>
                <p class="switch-modal">Already have an account? <a href="#" id="login-link">Login</a></p>
            </form>
        </div>
    </div>

    <footer>
        <p>© 2024 ImageHub By Bilal Ness</p>
    </footer>

    <!-- JavaScript -->
    <script>
        const loginButton = document.getElementById('login-button');
        const loginModal = document.getElementById('login-modal');
        const registerModal = document.getElementById('register-modal');
        const registerLink = document.getElementById('register-link');
        const loginLink = document.getElementById('login-link');
        const closeButtons = document.querySelectorAll('.close-button');

        // Open Login Modal
        loginButton.onclick = function() {
            loginModal.style.display = 'block';
        }

        // Switch to Register Modal
        registerLink.onclick = function() {
            loginModal.style.display = 'none';
            registerModal.style.display = 'block';
        }

        // Switch to Login Modal
        loginLink.onclick = function() {
            registerModal.style.display = 'none';
            loginModal.style.display = 'block';
        }

        // Close Modal
        closeButtons.forEach(button => {
            button.onclick = function() {
                loginModal.style.display = 'none';
                registerModal.style.display = 'none';
            }
        });

        // Close Modal when clicking outside of it
        window.onclick = function(event) {
            if (event.target == loginModal) {
                loginModal.style.display = 'none';
            }
            if (event.target == registerModal) {
                registerModal.style.display = 'none';
            }
        }
    </script>
</body>
</html>
