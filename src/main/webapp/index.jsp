<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Vehicle Service Center</title>
    <link rel="stylesheet" type="text/css" href="CSS/index.css">
    <script src="JS/index.js"></script>
    
</head>
<body>
    <div class="welcome-message">
        Welcome to Vehicle Service Center
    </div>

    <div class="button-container">
        <button id="continueButton">Continue With Asgardio!</button>
    </div>
    
    
    <script type="text/javascript">
    document.getElementById('continueButton').addEventListener('click', function() {
        window.location.href = 'facebook.com';
    });

    </script>

</body>
</html>
