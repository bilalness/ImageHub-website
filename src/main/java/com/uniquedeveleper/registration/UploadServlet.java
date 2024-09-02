package com.imagehub;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/userlogin?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "bilal1994";

        Part filePart = request.getPart("image");
        String filename = filePart.getSubmittedFileName();

        try (InputStream inputStream = filePart.getInputStream();
             Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement(
"INSERT INTO images (filename, image, uploaded_by) SELECT ?, ?, id FROM users WHERE uname=?")) {

            statement.setString(1, filename);
            statement.setBlob(2, inputStream);
            statement.setString(3, (String) request.getSession().getAttribute("username"));

            statement.executeUpdate();
            response.sendRedirect("profile.jsp");
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
