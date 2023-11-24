<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.database.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Record</title>
    <style>
        body {
            text-align: center;
        }

        h2 {
            margin-top: 30px;
        }

        .back-btn {
            background-color: yellow;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <% 
    DatabaseConnection dbConnection = new DatabaseConnection();
    Connection connection = dbConnection.getConnection();
    
    String deleteId = request.getParameter("deleteId");
    if (deleteId != null && !deleteId.isEmpty()) {
        try {
            PreparedStatement deleteStatement = connection.prepareStatement("DELETE FROM vehicle_service WHERE booking_id=?");
            deleteStatement.setString(1, deleteId);
            int rowsAffected = deleteStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                %>
                <h2>Record deleted successfully.</h2>
                <%
            } else {
                %>
                <h2>Failed to delete the record.</h2>
                <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
        %>
        <h2>No record to delete.</h2>
        <%
    }
    
    try {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>
    <button onclick="location.href='viewService.jsp';" class="back-btn">Back</button>
</body>
</html>
