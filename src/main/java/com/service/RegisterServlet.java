import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationDate = request.getParameter("reservationDate");
        String preferredTime = request.getParameter("preferredTime");
        String preferredLocation = request.getParameter("preferredLocation");
        String vehicleNo = request.getParameter("vehicleNo");
        String mileage = request.getParameter("mileage");
        String message = request.getParameter("message");

        // Input validation - Add your validation logic here
        if (reservationDate == null || preferredTime == null || preferredLocation == null || vehicleNo == null || mileage == null) {
            response.sendRedirect("registration.jsp"); // Redirect to registration page on invalid data
            return;
        }

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/your_database";
        String dbUsername = "your_username";
        String dbPassword = "your_password";

        // Insert into the database
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword)) {
            String sql = "INSERT INTO vehicle_service (reservation_date, preferred_time, preferred_location, vehicle_no, mileage, message) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, reservationDate);
            statement.setString(2, preferredTime);
            statement.setString(3, preferredLocation);
            statement.setString(4, vehicleNo);
            statement.setString(5, mileage);
            statement.setString(6, message);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("success.jsp"); // Redirect to success page after successful insertion
            } else {
                response.sendRedirect("error.jsp"); // Redirect to error page if insertion fails
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page on database error
        }
    }
}
