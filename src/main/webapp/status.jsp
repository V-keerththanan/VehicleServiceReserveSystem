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
        <h1 style="text-align: center;">Registration Successful</h1>
        <p style="text-align: center;">Your registration has been successfully processed.</p>
        
    <% } else { %>
        <h1 style="text-align: center;">Registration Error</h1>
        
            <% 
                if (type != null && type.equals("emptyFields")) { 
            %>
                <p style="text-align: center;">Please fill in all the required fields.</p>
            <% } else { %>
                <p style="text-align: center;" >An error occurred during registration.</p>
            <% } %>
            
           
       
    <% } %>
     <a href="home.jsp" style="display: block; width: 100px; margin: 0 auto; text-align: center; padding: 10px; background-color: yellow; border-radius: 10px; text-decoration: none; color: black; transition: background-color 0.3s;">Back</a>

</body>
</html>
