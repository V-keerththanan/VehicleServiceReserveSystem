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
        body {
            font-family: 'Lato', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
       
        .registration-form {
            width: 80%;
            max-width: 500px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .registration-form h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .registration-form input[type="date"],
        .registration-form select,
        .registration-form input[type="text"],
        .registration-form input[type="number"],
        .registration-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .registration-form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .registration-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function validateForm() {
            var selectedDate = document.getElementsByName('reservationDate')[0].value;
            var date = new Date(selectedDate);
            var day = date.getDay(); 

            if (day === 0) { 
                alert('Shop is closed on Sunday. Please select another date.');
                return false; 
            }
            return true; 
        }
    </script>
</head>
<body>
    <div class="registration-form">
        <h2>Register Vehicle</h2>
        <form action="register" method="post" onsubmit="return validateForm()">
            Date of the service reservation: <input type="date" name="reservationDate" id="reservationDate" required><br>

<script>
  var today = new Date();
  today.setDate(today.getDate() + 1); 
  
  var nextDay = today.toISOString().split('T')[0]; 
  
  document.getElementById('reservationDate').setAttribute('min', nextDay);
</script>

            Preferred time: 
            <select name="preferredTime" required>
                <option value="10 AM">10 AM</option>
                <option value="11 AM">11 AM</option>
                <option value="12 PM">12 PM</option>
            </select><br>
            Preferred Location: 
            <select name="preferredLocation" required>
                <option value="Colombo">Colombo</option>
								<option value="Gampaga">Gampaga</option>
								<option value="Kaluthara">Kaluthara</option>
								<option value="Galle">Galle</option>
								<option value="Matara">Matara</option>
								<option value="Hambanthota">Hambanthota</option>
								<option value="Kandy">Kandy</option>
								<option value="Matale">Matale</option>
								<option value="Nuwara Eliya">Nuwara Eliya</option>
								<option value="Kegalle">Kegalle</option>
								<option value="Ratnapura">Ratnapura</option>
								<option value="Anuradhapura">Anuradhapura</option>
								<option value="Polonnaruwa">Polonnaruwa</option>
								<option value="Puttalam">Puttalam</option>
								<option value="Kurunegala">Kurunegala</option>
								<option value="Badulla">Badulla</option>
								<option value="Monaragala">Monaragala</option>
								<option value="Trincomalee">Trincomalee</option>
								<option value="Batticaloa">Batticaloa</option>
								<option value="Ampara">Ampara</option>
								<option value="Jaffna">Jaffna</option>
								<option value="Kilinochchi">Kilinochchi</option>
								<option value="Mannar">Mannar</option>
								<option value="Mullaitivu">Mullaitivu</option>
								<option value="Vavuniya">Vavuniya</option>
            </select><br>
            Vehicle Registration Number: <input type="text" name="vehicleNo" required><br>
            Current Mileage: <input type="number" name="mileage" required><br>
            Message: <input type="text" name="message" required><br>
            <input type="submit" name="submit" value="Register">
        </form>
    </div>
</body>
</html>
