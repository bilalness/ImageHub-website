<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to My Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e9ecef;
        }
        header {
            background-color: #007bff;
            color: white;
            padding: 1rem;
            text-align: center;
        }
        main {
            padding: 2rem;
        }
        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 1rem;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header>
        <h1>ImageHub</h1>
    </header>
    <main>
        <div class="container">
            <h2>Welcome!</h2>
            <p>This is the home page of my project. Please log in or register to continue.</p>
            <p>
                <a href="login.jsp">Login</a> | 
                <a href="registration.jsp">Register</a>
            </p>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 ImageHub By Bilal Ness</p>
    </footer>
</body>
</html>
