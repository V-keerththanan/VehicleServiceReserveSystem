package com.service;

import com.database.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String username = (String) request.getSession().getAttribute("username");
        String reservationDate = request.getParameter("reservationDate");
        String preferredTime = request.getParameter("preferredTime");
        String preferredLocation = request.getParameter("preferredLocation");
        String vehicleNo = request.getParameter("vehicleNo");
        int mileage = 0;
        String message = request.getParameter("message");
        java.sql.Date reservation_date=null;
        java.sql.Time preffered_time = null;
        
        try {
        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        	java.util.Date parsedDate = dateFormat.parse(reservationDate);
        	reservation_date = new java.sql.Date(parsedDate.getTime());

        	
        	SimpleDateFormat timeFormat = new SimpleDateFormat("hh a");
        	java.util.Date parsedTime = null;
        	try {
        	    parsedTime = timeFormat.parse(preferredTime);
        	} catch (ParseException e) {
        	    
        	    e.printStackTrace();
        	}
        	
        	if (parsedTime != null) {
        	    preffered_time = new java.sql.Time(parsedTime.getTime());
        	}
            mileage = Integer.parseInt(request.getParameter("mileage"));
            if (mileage < 0) {
                mileage=0;
            }
        } catch (NumberFormatException e) {
            mileage=0;
        } catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        if (reservationDate.isEmpty() || preferredTime.isEmpty() || preferredLocation.isEmpty() || vehicleNo.isEmpty()) {
            response.sendRedirect("status.jsp?type=emptyFields");
            return;
        }

       
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection connection = dbConnection.getConnection();
        try (connection) {
            
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO vehicle_service (date,time, location, vehicle_no, mileage, message, username) VALUES (?, ?, ?, ?, ?, ?, ?)"
            );

            preparedStatement.setDate(1, reservation_date);
            preparedStatement.setTime(2, preffered_time);
            preparedStatement.setString(3, preferredLocation);
            preparedStatement.setString(4, vehicleNo);
            preparedStatement.setInt(5, mileage);
            preparedStatement.setString(6, message);
            preparedStatement.setString(7, username);

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
        	try {
				connection.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
        }
    }
}
