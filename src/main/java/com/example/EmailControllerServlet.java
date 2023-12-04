package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/EmailControllerServlet")
public class EmailControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmailController emailController;

    @Override
    public void init() throws ServletException {
        super.init();
        DBUtil.init();
        emailController = new EmailController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (UserDAO.validateUser(username, password)) {
                
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } else {
                
                response.sendRedirect("login.jsp?error=1");
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

