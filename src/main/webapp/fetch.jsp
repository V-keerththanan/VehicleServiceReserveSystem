<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader, java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.Iterator" %>
<%
    String introspectionEndpointUrl = "https://api.asgardeo.io/t/keerthan/oauth2/introspect";
    String accessToken = (String) session.getAttribute("access_token");
    String idToken = (String) session.getAttribute("id_token");
out.print(accessToken);
out.print(idToken);
    if (accessToken != null && idToken != null) {
        try {
        	
            URL url = new URL("https://api.asgardeo.io/t/keerthan/oauth2/userinfo");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "Bearer " + accessToken);
			
   
            
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            connection.disconnect();

            String responseJSON = content.toString();
 
        JSONObject jsonObject = new JSONObject(responseJSON);

        String userName = jsonObject.optString("username");
        String email = jsonObject.optString("email");
        out.println("Username: " + userName);
        out.println("Email: " + email);
           
            
            

        } catch (IOException e) {
            out.println("Error: " + e.getMessage());
            
        }
    } else {
        
    }
%>
