<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Image - ImageHub</title>
    <link rel="stylesheet" href="css/upload-style.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>ImageHub</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="upload-content">
        <h2>Upload Image</h2>
        <form id="upload-form" action="upload" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="image">Upload Image:</label>
                <input type="file" id="image" name="image" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Uploadd Image">
            </div>
        </form>
    </div>

    <footer>
        <p>© 2024 ImageHub By Bilal Ness</p>
    </footer>
</body>
</html>
