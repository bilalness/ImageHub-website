package com.uniquedeveleper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("username");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            // Set the JDBC URL with the serverTimezone parameter
            String jdbcURL = "jdbc:mysql://localhost:3306/userlogin?useSSL=false&serverTimezone=UTC";
            try (Connection con = DriverManager.getConnection(jdbcURL, "root", "bilal1994")) {
                // Determine if input is an email or username
                String query = "select * from users where (uemail = ? or uname = ?) and upwd = ?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, input);
                pst.setString(2, input);
                pst.setString(3, upwd);

                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    session.setAttribute("name", rs.getString("uname"));
                    dispatcher = request.getRequestDispatcher("index.jsp");
                } else {
                    request.setAttribute("status", "failed");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
