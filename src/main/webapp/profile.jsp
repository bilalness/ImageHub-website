<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Profile</title>
    <link rel="stylesheet" href="css/profile-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
</head>
<body>

    <header>
        <h1>Welcome, <%= request.getSession().getAttribute("username") %></h1>
    </header>

	<section class="upload-section">
	    <div class="upload-bar">
	        <div class="upload-icon">
	            <label for="file-input">
	                <i class="fas fa-upload"></i>
	            </label>
	        </div>
	        <div class="upload-text">
	            <span id="upload-label">Upload a New Photo</span>
	        </div>
	        <div class="upload-button">
	            <button type="button" id="upload-btn">Upload</button>
	        </div>
	        <form id="upload-form" action="upload" method="post" enctype="multipart/form-data">
	            <input type="file" id="file-input" name="image" accept="image/*" style="display:none;" required>
	        </form>
	    </div>
	</section>


    <section>
        <div class="gallery">
            <%
                String dbUrl = "jdbc:mysql://localhost:3306/userlogin?useSSL=false&serverTimezone=UTC";
                String dbUser = "root";
                String dbPassword = "bilal1994";
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    String sql = "SELECT id, filename FROM images WHERE uploaded_by = (SELECT id FROM users WHERE uname = ?)";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, (String) request.getSession().getAttribute("username"));
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String imageId = rs.getString("id");
                        String filename = rs.getString("filename");
            %>
                        <div class="photo">
                            <img src="image?id=<%= imageId %>" alt="<%= filename %>" onclick="openModal('<%= imageId %>')">
                        </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </div>
    </section>

    <div id="modal" class="modal">
        <span class="close" onclick="closeModal()">&times;</span>
        <img class="modal-content" id="modal-img">
    </div>

    <script src="js/profile-script.js"></script>
</body>
</html>
