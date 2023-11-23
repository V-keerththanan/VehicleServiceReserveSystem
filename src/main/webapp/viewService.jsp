<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.database.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Records</title>
    <style>
      
       
        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
            margin-top: 20px;
            border: 2px solid #ddd;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
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

       .delete-btn {
    background-color: red;
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease; 
}

.delete-btn:hover {
    background-color: darkred; 
}
        .back-btn {
            background-color: yellow;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            display: block;
            margin: auto;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Available Records</h2>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
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
            <% 
            DatabaseConnection dbConnection = new DatabaseConnection();
            Connection connection = dbConnection.getConnection();
            Statement statement = null;
            ResultSet resultSet = null;
            
            try {
                String obtained_username = (String) request.getSession().getAttribute("username");
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM vehicle_service WHERE username=?");
                preparedStatement.setString(1, obtained_username);
                resultSet = preparedStatement.executeQuery();
                
                while (resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getString("booking_id") %></td>
                <td><%= resultSet.getDate("date") %></td>
                <td><%= resultSet.getTime("time") %></td>
                <td><%= resultSet.getString("location") %></td>
                <td><%= resultSet.getString("vehicle_no") %></td>
                <td><%= resultSet.getInt("mileage") %></td>
                <td><%= resultSet.getString("message") %></td>
                <td>
                    <form action="deleteRecord" method="post">
                        <input type="hidden" name="deleteId" value="<%= resultSet.getString("booking_id") %>">
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
            <% 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
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

    <button onclick="location.href='home.jsp';" class="back-btn">Back to Home</button>
</body>
</html>
