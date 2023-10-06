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

    <div class="button-container" onclick="window.location.href='https://api.asgardeo.io/t/keerthan/oauth2/authorize?response_type=code&client_id=JM_7WpOmTfFSczq_oLOkfBHWp3oa&scope=openid%20address%20email%20phone%20profile&redirect_uri=http%3A%2F%2Flocalhost%3A8082%2FVEHICLE_SERVICE_SYSTEM%2Fauthorize.jsp'">
        <button id="continueButton">Continue With Asgardio!</button>
    </div>
    
 

</body>
</html>
