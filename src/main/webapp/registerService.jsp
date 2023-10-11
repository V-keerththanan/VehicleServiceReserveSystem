 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    <%
    if(request.getMethod().equals("POST")) {
        String url = "jdbc:mysql://51.132.137.223:3306/isec_assessment2";
        String username = "isec";
        String password = "EUHHaYAmtzbv";
        String query = "INSERT INTO vehicle_service (date, time, location, vehicle_no, mileage, message, username) VALUES (?, ?, ?, ?, ?, ?, ?)";

        if (request.getParameter("submit") != null) {
            // Get form data
            String dateString = request.getParameter("reservationDate");
            String timeString = request.getParameter("preferredTime");
            String location = request.getParameter("preferredLocation");
            String mileageStr = request.getParameter("mileage");
            int mileage = Integer.parseInt(mileageStr);
            String vehicleNo = request.getParameter("vehicleNo");
            String message = request.getParameter("message");
            String obtained_username = "<script>document.write(profile_username);</script>";
            %>
            <script>
    			 alert("Message: <%= obtained_username %>");
				</script>
             <%
           
            try {
            	Connection connection = new DatabaseConnection().getConnection();
                PreparedStatement preparedStatement;
                // Convert date string to Date object
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = dateFormat.parse(dateString);
                java.sql.Date date = new java.sql.Date(parsedDate.getTime());

                // Convert time string to Time object
                SimpleDateFormat timeFormat = new SimpleDateFormat("hh a");
                java.util.Date parsedTime = timeFormat.parse(timeString);
                java.sql.Time time = new java.sql.Time(parsedTime.getTime());

                preparedStatement = connection.prepareStatement(query);

                // Set parameters for the prepared statement
                preparedStatement.setDate(1, date);
                preparedStatement.setTime(2, time);
                preparedStatement.setString(3, location);
                preparedStatement.setString(4, vehicleNo);
                preparedStatement.setInt(5, mileage);
                preparedStatement.setString(6, message);
                preparedStatement.setString(7,obtained_username);

                // Execute the SQL query
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    
                	 %>
                     <script>
             			 alert("Registerd Success!!");
             			window.location.href = "home.jsp";
         				</script>
                      <%
                      
                } else {
                	 %>
                     <script>
             			 alert("Registerd Failure!");
             			window.location.href = "home.jsp";
         				</script>
                      <%
                    
                }

            } catch (Exception e) {
            	e.printStackTrace();
                String errorMessage = "An error occurred: " + e.getMessage();
                %>
               <script>
       			 alert("Message: <%= errorMessage %>");
       			window.location.href = "home.jsp";
   				</script>
                <%
              
            }
        }
    }
    %>
    
%>
 

</body>
</html>
 
 
 