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
</head>
<body>
    
        <h2>Add Email</h2>
        <form action="EmailControllerServlet" method="post">
            Email: <input type="email" name="email" required list="emailOptions">
               <datalist id="emailOptions">
                   <option value="@hotmail.com">
                   <option value="@gmail.com">
                   <option value="@yahoo.com">
               </datalist><br>
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add">
        </form>
        
        <br>
        
        <a href="showEmails.jsp">Show Emails</a>
    
</body>
</html>
