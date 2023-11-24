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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <style>
       
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       
        header nav {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        header nav ul {
            list-style-type: none;
        }

        header nav ul li {
            display: inline;
            margin-right: 20px;
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        
        .profile-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh; /* Adjust height as needed */
        }

        .profile-card {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            max-width: 500px; /* Adjust maximum width as needed */
            text-align: center; /* Center-align card content */
        }

        .avatar-container {
            width: 150px;
            height: 150px;
            overflow: hidden;
            border-radius: 50%;
            margin: 0 auto 20px; /* Center the avatar and add margin */
        }

        .avatar {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .user-profile {
            text-align: left;
            margin-bottom: 20px; 
        }

        .user-profile p {
            margin-bottom: 15px;
        }

        
        @media (max-width: 768px) {
            .profile-card {
                width: 80%; /* Adjust width as needed */
            }
        }
    </style>
</head>
<body>

<%
    String introspectionEndpointUrl = "https://api.asgardeo.io/t/keerthan/oauth2/introspect";
    String accessToken = (String) session.getAttribute("access_token");
    String idToken = (String) session.getAttribute("id_token");
    String userName = ""; 
    String phoneNumber ="";
    String givenName="";
    String lastName= "";
    String country="";
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
        givenName = jsonObject.optString("given_name");
        lastName = jsonObject.optString("family_name");
        
        JSONObject addressObject = jsonObject.optJSONObject("address");

        
        country = (addressObject != null) ? addressObject.optString("country") : "";
        session.setAttribute("username", userName);
            
            

        } catch (IOException e) {
            out.println("Error: " + e.getMessage());
            
        }
    } else {
        
    }
%>
	
<header>
    <!-- Navigation bar -->
    <nav>
        <ul style="display: flex; justify-content: space-between;">
            <li><a href="registerService.jsp">Register Service</a></li>
            <li><a href="allService.jsp">All Reservation</a></li>
            <li><a href="futureService.jsp">Future Reservation</a></li>
            <li><a href="https://api.asgardeo.io/t/keerthan/oidc/logout" id="logout-link">Log Out</a></li>

        </ul>
    </nav>
</header>

<main>
    <div class="profile-container">
        <div class="profile-card">
        	<h2>User Profile</h2>
            <div class="avatar-container">

                <img src="images/avatar.avif" alt="Avatar" class="avatar">
            </div>
            <div class="user-profile">
                <p><strong>Email:</strong> <span id="email"><%= userName %></span></p>
                <p><strong>Name:</strong> <span id="name"><%= givenName +" "+ lastName %></span></p>
                <p><strong>Phone:</strong> <span id="phone"><%= phoneNumber %></span></p>
                <p><strong>Country:</strong> <span id="phone"><%= country %></span></p>
                
            </div>
        </div>
    </div>
</main>

<!-- Footer or additional content -->

</body>
</html>
