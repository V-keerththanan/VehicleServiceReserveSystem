<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/home.css">
    <script src="JS/profile.js"></script>
    <title>User Profile</title>
</head>
<body>
    <div class="profile-container">
        <div class="profile-card">
            <h2><span id="givenName"></span></h2>
            <div class="avatar-container">
                <img src="images/avatar.avif" alt="Avatar" class="avatar">
            </div>
            <p><strong>Email:</strong> <span id="email"></span></p>
            <p><strong>Phone:</strong> <span id="phone"></span></p>
        </div>

        <div class="services-list">
            <h2>Registered Services</h2>
            <ul>
                <li>Service 1 <button class="delete-button">Delete</button></li>
                <li>Service 2 <button class="delete-button">Delete</button></li>
                <!-- Add more services as needed -->
            </ul>
        </div>
    </div>

    <div class="registration-form">
        <h2>Register Vehicle</h2>
        <form action="registerVehicle.jsp" method="post">
            Date of the service reservation: <input type="date" name="reservationDate" min="<%=java.time.LocalDate.now()%>" required><br>
            Preferred time: 
            <select name="preferredTime">
                <option value="10 AM">10 AM</option>
                <option value="11 AM">11 AM</option>
                <option value="12 PM">12 PM</option>
            </select><br>
            Preferred Location: 
            <select name="preferredLocation">
                <option value="District 1">District 1</option>
                <option value="District 2">District 2</option>
                <!-- Add more districts as needed -->
            </select><br>
            Vehicle Registration Number: <input type="text" name="vehicleNo" required><br>
            Current Mileage: <input type="text" name="mileage" required><br>
            Message: <input type="text" name="message"><br>
            Username: <input type="text" name="username" required><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
