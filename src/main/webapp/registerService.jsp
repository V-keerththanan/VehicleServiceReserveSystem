<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <style>
       
        .registration-form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        
    </style>
</head>
<body>
    <div class="registration-form">
        <h2>Register Vehicle</h2>
        <form action="register.jsp" method="post">
            Date of the service reservation: <input type="date" name="reservationDate" min="" required><br>
            Preferred time: 
            <select name="preferredTime">
                <option value="10 AM">10 AM</option>
                <option value="11 AM">11 AM</option>
                <option value="12 PM">12 PM</option>
            </select><br>
            Preferred Location: 
            <select name="preferredLocation">
                <!-- Options for locations -->
            </select><br>
            Vehicle Registration Number: <input type="text" name="vehicleNo" required><br>
            Current Mileage: <input type="number" name="mileage" required><br>
            Message: <input type="text" name="message"><br>
            <input type="submit" name="submit" value="Register">
        </form>
    </div>
</body>
</html>
