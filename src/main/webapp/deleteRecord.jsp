<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.database.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Record</title>
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
                out.println("<h2>Record deleted successfully.</h2>");
            } else {
                out.println("<h2>Failed to delete the record.</h2>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
        out.println("<h2>No record to delete.</h2>");
    }
    
    try {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
