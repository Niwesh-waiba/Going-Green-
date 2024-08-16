<%-- 
    Document   : test
    Created on : Jan 26, 2024, 8:18:00 PM
    Author     : aayus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession login_check = request.getSession(false);
            String temp = (String) login_check.getAttribute("user_id");
            boolean user_status = (boolean) login_check.getAttribute("logged");
            String user_name = (String) request.getAttribute("user_name");

            out.println("<h1>" + user_status + "</h1>");
            out.println("<h1>" + user_name + "</h1>");
            out.println("<h1>" + temp + "</h1>");

        %>
        <a href="logoutMap">LogOut</a>
    </body>
</html>
