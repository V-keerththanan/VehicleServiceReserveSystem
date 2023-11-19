<%@page import="com.database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
DatabaseConnection dbConnection = new DatabaseConnection();
Connection connection = dbConnection.getConnection();
out.println(connection); %>
</body>
</html>