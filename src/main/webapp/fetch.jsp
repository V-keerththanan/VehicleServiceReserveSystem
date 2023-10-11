<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URL, java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader, java.io.IOException" %>

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
 
            

         
         String userName = jsonObject.get("username").getAsString();
         String email = jsonObject.get("email").getAsString();
           
            
            

        } catch (IOException e) {
            out.println("Error: " + e.getMessage());
            
        }
    } else {
        
    }
%>
