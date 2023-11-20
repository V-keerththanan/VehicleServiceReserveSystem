<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.database.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Services</title>
    <style>
        /* Your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .center {
            text-align: center;
        }

        .no-registration {
            text-align: center;
            color: red;
            margin-top: 20px;
            font-weight: bold;
        }

         .delete-btn {
        background-color: red;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        display: inline-block; /* Ensure the delete button is displayed inline */
    }

        .home-button {
            background-color: yellow;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            display: block;
            margin: auto;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Registered Services</h2>
    <% 
    String obtained_username = (String) request.getSession().getAttribute("username");
    DatabaseConnection dbConnection = new DatabaseConnection();
    Connection connection = dbConnection.getConnection();
    try {
        if (request.getParameter("serviceId") != null) {
            int serviceIdToDelete = Integer.parseInt(request.getParameter("serviceId"));
            PreparedStatement deleteStatement = connection.prepareStatement("DELETE FROM vehicle_service WHERE service_id=? AND username=?");
            deleteStatement.setInt(1, serviceIdToDelete);
            deleteStatement.setString(2, obtained_username);
            int rowsAffected = deleteStatement.executeUpdate();
            // Check if the delete operation was successful
            if (rowsAffected > 0) {
                out.println("<p class='center'>Record deleted successfully.</p>");
            } else {
                out.println("<p class='center'>Failed to delete the record.</p>");
            }
        }

        PreparedStatement ps = connection.prepareStatement("SELECT * FROM vehicle_service WHERE username=?");
        ps.setString(1, obtained_username);
        ResultSet rs = ps.executeQuery();
        boolean hasRegistrations = false; // Flag to track if registrations exist
        %>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Vehicle No</th>
                    <th>Mileage</th>
                    <th>Message</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% int count = 1;
                while (rs.next()) {
                    hasRegistrations = true; // Set flag to true if registrations exist
                    %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= rs.getDate("date") %></td>
                        <td><%= rs.getTime("time") %></td>
                        <td><%= rs.getString("location") %></td>
                        <td><%= rs.getString("vehicle_no") %></td>
                        <td><%= rs.getInt("mileage") %></td>
                        <td><%= rs.getString("message") %></td>
                        <td>
                           <button class="delete-btn" onclick="deleteRecord(<%= rs.getInt("service_id") %>)">Delete</button>
                        </td>
                    </tr>
                    <% } // End of while loop
                    if (!hasRegistrations) { // If no registrations exist, display message
                        %>
                        <tr>
                            <td colspan="8" class="center no-registration">There are no registrations yet.</td>
                        </tr>
                        <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (connection != null && !connection.isClosed()) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                %>
            </tbody>
        </table>
        
        
        
        <button class="home-button" onclick="window.location.href='home.jsp'">Home</button>
</body>
</html>
