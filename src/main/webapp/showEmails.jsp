<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Email" %>
<%@ page import="com.example.EmailController" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show Emails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
        }

        h2 {
            color: #007bff;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 10px 0;
        }

        form {
            display: inline;
        }

        h2 + form {
            margin-top: 20px;
        }

        form input {
            margin-right: 10px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h2>Emails:</h2>
    <ul>
        <% EmailController emailController = new EmailController();
           List<Email> emails = emailController.getAllEmails();
           for (Email email : emails) { %>
            <li>
                <%= email.getEmail() %>
                <form action="EmailControllerServlet" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="email" value="<%= email.getEmail() %>">
                    <input type="submit" value="Delete">
                </form>
            </li>
        <% } %>
    </ul>

    <h2>Add Email</h2>
    <form action="EmailControllerServlet" method="post">
        Email: <input type="email" name="email" required list="emailOptions">
               <datalist id="emailOptions">
                   <option value="@hotmail.com">
                   <option value="@gmail.com">
                   <option value="@yahoo.com">
               </datalist>
        <input type="hidden" name="action" value="add">
        <input type="submit" value="Add">
    </form>
</body>
</html>
