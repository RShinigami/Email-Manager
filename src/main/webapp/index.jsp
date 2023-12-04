<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Email Manager</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
        }

        
        h1 {
            color: #007bff;
        }

        
        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            color: #0056b3;
        }


        body > div {
            margin: 20px auto;
            max-width: 600px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

       
        hr {
            border: 1px solid #007bff;
            margin-top: 20px;
        }

       
        body > div a {
            display: block;
            margin: 10px 0;
        }
    </style>
</head>
<body>

    <h1>Welcome to Email Manager</h1>
    <hr>
    <br>
   
    <a href="EmailControllerServlet?action=show">Show all Emails</a><br>
    <br>
    <a href="addEmail.jsp">Add a new Email</a>
    
</body>
</html>
