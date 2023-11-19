package com.service;

import com.database.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String reservationDate = request.getParameter("reservationDate");
        String preferredTime = request.getParameter("preferredTime");
        String preferredLocation = request.getParameter("preferredLocation");
        String vehicleNo = request.getParameter("vehicleNo");
        int mileage = 0;
        String message = request.getParameter("message");

        // Validate and sanitize mileage (assuming mileage is a positive integer)
        try {
            mileage = Integer.parseInt(request.getParameter("mileage"));
            if (mileage < 0) {
                mileage=0;
            }
        } catch (NumberFormatException e) {
            mileage=0;
        }

        if (reservationDate.isEmpty() || preferredTime.isEmpty() || preferredLocation.isEmpty() || vehicleNo.isEmpty()) {
            response.sendRedirect("status.jsp?type=emptyFields");
            return;
        }

       
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection connection = dbConnection.getConnection()
        try (connection) {
            // Insert data into the database
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO YourTableName (reservation_date, preferred_time, preferred_location, vehicle_no, mileage, message) " +
                            "VALUES (?, ?, ?, ?, ?, ?)"
            );

            preparedStatement.setString(1, reservationDate);
            preparedStatement.setString(2, preferredTime);
            preparedStatement.setString(3, preferredLocation);
            preparedStatement.setString(4, vehicleNo);
            preparedStatement.setInt(5, mileage);
            preparedStatement.setString(6, message);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("status.jsp?status=success"); 
            } else {
                response.sendRedirect("status.jsp?status=error"); 
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
            response.sendRedirect("status.jsp?status=error"); 
        }finally {
        	connection.close();
        }
    }
}
