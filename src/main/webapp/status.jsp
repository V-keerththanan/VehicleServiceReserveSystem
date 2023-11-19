<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Status</title>
</head>
<body>
    <% 
        String status = request.getParameter("status");
        String type = request.getParameter("type");
        if (status != null && status.equals("success")) { 
    %>
        <h1>Registration Successful</h1>
        <p>Your registration has been successfully processed.</p>
        <!-- Add any other success-related content here -->
    <% } else { %>
        <h1>Registration Error</h1>
        <% 
            if (type != null && type.equals("emptyFields")) { 
        %>
            <p>Please fill in all the required fields.</p>
        <% } else { %>
            <p>An error occurred during registration.</p>
        <% } %>
        <!-- Add any other error-related content here -->
    <% } %>
</body>
</html>
