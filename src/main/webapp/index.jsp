<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Vehicle Service Center</title>
    <style>
        body {
            background-image: url('images/welcome.jpg'); /* Replace 'path_to_your_background_image.jpg' with the actual path to your background image */
            background-size: cover;
            background-position: center center;
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            height: 100vh;
            padding: 0 20px;
            flex-direction: column;
        }

        .welcome-message {
            text-align: left;
            font-size: 24px;
            color: #333333;
            margin-top: 20px;
        }

        .button-container {
            text-align: left;
        }

        button {
            padding: 15px 30px;
            margin-top: 80px;
            font-size: 18px;
            background-image: linear-gradient(to bottom, #FFD700, #C0C0C0); /* Gradient from Light Gold to Silver */
            color: #333333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-image: linear-gradient(to bottom, #C0C0C0, #FFD700); /* Reverse gradient on hover */
        }
    </style>
</head>
<body>
    <div class="welcome-message">
        Welcome to Vehicle Service Center
    </div>

    <div class="button-container">
        <button id="continueButton">Continue With Asgardio!</button>
    </div>

    <script>
        document.getElementById('continueButton').addEventListener('click', function() {
            // Add your action here
            alert('Button clicked!'); // Placeholder action
        });
    </script>
</body>
</html>
