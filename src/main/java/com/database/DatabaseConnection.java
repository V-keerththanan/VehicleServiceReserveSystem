package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public Connection getConnection() {
		Connection connection=null;
		String url = "jdbc:mysql://51.132.137.223:3306/isec_assessment2";
	    String username = "isec";
	    String password = "EUHHaYAmtzbv";

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        connection = DriverManager.getConnection(url, username, password);

	        // Log a success message
	        System.out.println("Database connection established successfully.");
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();

	        // Log an error message
	        System.err.println("Failed to establish database connection.");
	    }
	    return connection;
	}

}
