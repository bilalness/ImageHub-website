package com.uniquedeveleper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistartionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String umobile = request.getParameter("contact");
        RequestDispatcher dispatcher = null;
        
        try {
            // Set the JDBC URL with the serverTimezone parameter
            String jdbcURL = "jdbc:mysql://localhost:3306/userlogin?useSSL=false&serverTimezone=UTC";
            try (Connection con = DriverManager.getConnection(jdbcURL, "root", "bilal1994")) {
                PreparedStatement pst = con.prepareStatement("insert into users (uname, upwd, uemail, umobile) values(?, ?, ?, ?)");
                pst.setString(1, uname);
                pst.setString(2, upwd);
                pst.setString(3, uemail);
                pst.setString(4, umobile);
                
                int rowCount = pst.executeUpdate();
                dispatcher = request.getRequestDispatcher("registration.jsp");
                if (rowCount > 0) {
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("status", "failed");
                }
                dispatcher.forward(request, response);
                return; // Ensure no further processing after forward
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Only call sendRedirect if an exception occurs
        response.sendRedirect("login.jsp");
    }
}
