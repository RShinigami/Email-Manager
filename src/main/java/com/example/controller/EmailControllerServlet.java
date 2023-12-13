package com.example.controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.*; 
import com.example.model.*;
import java.io.IOException;

@WebServlet("/EmailControllerServlet")
public class EmailControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int MAX_LOGIN_ATTEMPTS = 3;
	private EmailController emailController;

    @Override
    public void init(ServletConfig config) throws ServletException {
        DBUtil.init();
        emailController = new EmailController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");

        if (loginAttempts == null) {
            loginAttempts = 0;
        }

        if ("login".equals(action)) {
            if (loginAttempts < MAX_LOGIN_ATTEMPTS-1) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (UserDAO.validateUser(username, password)) {
                    session.setAttribute("username", username);
                    session.removeAttribute("loginAttempts");
                    response.sendRedirect("index.jsp");
                } else {
                    loginAttempts++;
                    session.setAttribute("loginAttempts", loginAttempts);
                    response.sendRedirect("login.jsp?error=1&attempts=" + (MAX_LOGIN_ATTEMPTS - loginAttempts));
                }
            } else {
                session.invalidate(); 
                response.sendRedirect("error.jsp");
            }
        } else if ("signup".equals(action)) {
            
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phoneNumber");

            
            User user = new User(firstName, lastName, username, password, phoneNumber);
            UserDAO.addUser(user);

            response.sendRedirect("login.jsp");
        
        } else if ("add".equals(action)) {
            String email = request.getParameter("email");
            emailController.addEmail(email);
            response.sendRedirect("showEmails.jsp");
        } else if ("delete".equals(action)) {
            String email = request.getParameter("email");
            emailController.deleteEmail(email);
            response.sendRedirect("showEmails.jsp");
        }

        }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         response.sendRedirect("showEmails.jsp");
    }
    
   
}

