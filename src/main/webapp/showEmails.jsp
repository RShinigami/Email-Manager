<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.*" %>
<%@ page import="com.example.controller.*" %>
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
    
    <script>
        function validateEmail() {
            const emailInput = document.getElementById("email");
            const emailValue = emailInput.value;
            const validDomains = ["hotmail.com", "gmail.com", "yahoo.com"];
            const error = document.getElementById("error");

            
            var isValid = validDomains.some(function(domain) {
                return emailValue.endsWith("@" + domain);
            });

            if (!isValid) {
                error.innerHTML = "Invalid email";
                emailInput.focus();
                return false;
            }

            
            document.getElementById("error").innerHTML = "";

            return true;
        }
    </script>
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
    <form action="EmailControllerServlet" method="post" onsubmit="return validateEmail();">
        Email: <input type="email" id="email" name="email" required placeholder="Example@gmail.com" list="emailOptions">
               <datalist id="emailOptions">
                   <option value="@hotmail.com">
                   <option value="@gmail.com">
                   <option value="@yahoo.com">
               </datalist>
        <input type="hidden" name="action" value="add">
        <input type="submit" value="Add">
    </form><br>
    <br>
    <span style="color: red;" id="error"></span>
</body>
</html>
