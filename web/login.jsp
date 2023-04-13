

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Input your information: </h1>
        <form action="MainController" method="POST" >
            User ID<input type="text" name="userID" required=""/></br>
            Password<input type="password" name="password" required=""/></br>
            <div class="g-recaptcha" data-sitekey="6Le4LsoeAAAAAPnsPCJP6VHYEZRqHn3KT8GF6OEx"></div>
            <input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset" />
        </form>
        
        
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>

            <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error %>
    </body>
</html>
