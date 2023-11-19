<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<%@page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader" %>
<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader, java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.Iterator" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/home.css">
   
    <title>User Profile</title>
</head>
<body>

	<%
    String introspectionEndpointUrl = "https://api.asgardeo.io/t/keerthan/oauth2/introspect";
    String accessToken = (String) session.getAttribute("access_token");
    String idToken = (String) session.getAttribute("id_token");
    String userName = ""; 
    String phoneNumber = "";
    if (accessToken != null && idToken != null) {
        try {
        	
            URL url = new URL("https://api.asgardeo.io/t/keerthan/oauth2/userinfo");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + accessToken);
			
   
            
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            connection.disconnect();

            String responseJSON = content.toString();
 
        JSONObject jsonObject = new JSONObject(responseJSON);

        userName = jsonObject.optString("username");
        String email = jsonObject.optString("email");
        phoneNumber = jsonObject.optString("phone_number");
        String givenName = jsonObject.optString("given_name");
        session.setAttribute("username", userName);
            
            

        } catch (IOException e) {
            out.println("Error: " + e.getMessage());
            
        }
    } else {
        
    }
%>
	 
    <div class="profile-container">
        <div class="profile-card">
            <h2><span id="givenName"></span></h2>
            <div class="avatar-container">
                <img src="images/avatar.avif" alt="Avatar" class="avatar">
            </div>
            <p><strong>Email:</strong> <span id="email"><%= userName %></span></p>
            <p><strong>Phone:</strong> <span id="phone"><%= phoneNumber %></span></p>
        </div>

        <div class="services-list">
            <h2>Registered Services</h2>
             <ul>
        <% 
        String obtained_username =(String) request.getSession().getAttribute("username");
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection connection = dbConnection.getConnection();
        out.println(connection);
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM vehicle_service WHERE username=?");
        ps.setString(1, obtained_username);
        ResultSet rs = ps.executeQuery();
        %>
        
       <%
	while (rs.next()) {
    String bookingid = rs.getString(1);
    String serviceTime = rs.getString(2).split(" ")[0]+","+ rs.getString(3); // Assuming service time is in the second column
    String vehicleNumber = rs.getString(5); // Assuming vehicle number is in the third column
	%>
    <li>
        booking-id: <%= bookingid %><br>
        Date & Time: <%= serviceTime %><br>
        Vehicle Number: <%= vehicleNumber %><br>
<button class="delete-button" onclick="<%
    ps = connection.prepareStatement("DELETE FROM vehicle_service WHERE booking_id = ?");
    ps.setString(1, bookingid);
    ps.executeUpdate();
%>
location.reload();
">Delete</button>
    </li>
	<% } %>
    </ul>
        </div>
    </div>

    <div class="registration-form">
        <h2>Register Vehicle</h2>
        <form action="registerService.jsp" method="post">
            Date of the service reservation: <input type="date" name="reservationDate" min="" required><br>
            Preferred time: 
            <select name="preferredTime">
                <option value="10 AM">10 AM</option>
                <option value="11 AM">11 AM</option>
                <option value="12 PM">12 PM</option>
            </select><br>
            Preferred Location: 
            <select name="preferredLocation">
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
            Message: <input type="text" name="message"><br>
            <input type="submit" name="submit" value="Register">
        </form>
       
    </div>
 
    
   
</body>
</html>
