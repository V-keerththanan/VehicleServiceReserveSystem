package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.database.DatabaseConnection;

@WebServlet("/deleteRecord")
public class DeleteRecordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deleteId = request.getParameter("deleteId");
        if (deleteId != null && !deleteId.isEmpty()) {
            try {
                DatabaseConnection dbConnection = new DatabaseConnection();
                Connection connection = dbConnection.getConnection();

                PreparedStatement deleteStatement = connection.prepareStatement("DELETE FROM vehicle_service WHERE booking_id=?");
                deleteStatement.setString(1, deleteId);
                int rowsAffected = deleteStatement.executeUpdate();

                if (rowsAffected > 0) {
                    response.getWriter().write("Record deleted successfully.");
                    response.sendRedirect(request.getContextPath() + "/viewService.jsp"); 
                } else {
                    response.getWriter().write("Failed to delete the record.");
                }

                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Failed to delete the record.");
            }
        } else {
            response.getWriter().write("No record to delete.");
        }
    }
}
