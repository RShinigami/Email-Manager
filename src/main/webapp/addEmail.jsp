<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Email</title>
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

        form {
            margin: 20px auto;
            max-width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form input {
            margin-bottom: 10px;
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
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

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            color: #0056b3;
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
    <h2>Add Email</h2>
    <form action="EmailControllerServlet" method="post" onsubmit="return validateEmail();">
        Email: <input type="email" id="email" name="email" required placeholder="Example@gmail.com" list="emailOptions">
        <datalist id="emailOptions">
            <option value="@hotmail.com">
            <option value="@gmail.com">
            <option value="@yahoo.com">
        </datalist><br>
        <input type="hidden" name="action" value="add">
        <input type="submit" value="Add">
    </form>
  
    <br>

    <a href="showEmails.jsp">Show All Emails</a><br>
    <br>
    
    <span style="color: red;" id="error"></span>
</body>
</html>
