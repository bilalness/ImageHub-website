package com.imagehub;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/image")
public class ImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imageId = request.getParameter("id");

        String url = "jdbc:mysql://localhost:3306/userlogin?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "bilal1994";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement("SELECT image FROM images WHERE id = ?")) {

            statement.setString(1, imageId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                Blob imageBlob = rs.getBlob("image");
                response.setContentType("image/jpeg");
                try (OutputStream outputStream = response.getOutputStream()) {
                    outputStream.write(imageBlob.getBytes(1, (int) imageBlob.length()));
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 if image not found
            }

        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
