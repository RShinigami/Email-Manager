<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }

        h2 {
            color: #FF5733; 
        }

        p {
            color: #333;
            font-size: 16px;
        }

        #countdown {
            font-size: 24px;
            font-weight: bold;
            color: #FF5733; 
        }

        button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
    <script type="text/javascript">
        var countdown = 60; 

        function updateCountdown() {
            document.getElementById("countdown").innerHTML = countdown;
            if (countdown === 0) {
                document.getElementById("loginButton").removeAttribute("disabled");
            } else {
                countdown--;
                setTimeout(updateCountdown, 1000);
            }
        }

        window.onload = function() {
            updateCountdown();
        };
    </script>
</head>
<body>
    <h2>Error</h2>
    <p>
        Maximum login attempts reached.
    </p>
    <p>
        You can try again in <span id="countdown"></span> seconds.
    </p>
    <p>
        <button id="loginButton" onclick="window.location.href='login.jsp'" disabled>Go to Login Page</button>
    </p>
</body>
</html>
