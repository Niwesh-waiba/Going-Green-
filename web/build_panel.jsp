<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <link rel="icon"
              href="image/logo.png"
              type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin-Build</title>
        <link rel="stylesheet" href="styles/build_panel.css" />
    </head>
    <body>
        <%@include file="navBarForAdminPanel.html" %>
        
        <div class="body">
            <video autoplay loop muted src="image/bg_video.mp4"></video>
            <%
            String get_data = "Select * from gg_build_form;";
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sxc_GG", "root", "");
                    //Preparing statement to retrive data in database
                    PreparedStatement build_data = con.prepareStatement(get_data);
                    //Storing retrive data from database
                    ResultSet build_data_display = build_data.executeQuery();
                    while (build_data_display.next()) {
                        String bName = build_data_display.getString("name");
                        String bEmail = build_data_display.getString("email");
                        String bPhone = build_data_display.getString("phone");
                        String bLocation = build_data_display.getString("location_details");
                        String bComments = build_data_display.getString("comments");
                        String bCreatedOn = build_data_display.getString("created_on");
                        String bStatus = build_data_display.getString("status");
                        %>
                        <div class="container">
                <div class="intro">
                    <div class="left_pane">
                        <h4>Name:  <%= bName%> </h4>
                        <u>Contact:</u>
                        <h4>Email: <%= bEmail%></h4>
                        <h4>Phone:<%= bName%></h4>
                        <h4>Address: <%= bLocation%></h4>
                    </div>
                    <div class="right_pane">
                        <h4>Comments:  <%= bComments%></h4>
                        <h4>On: <%= bCreatedOn%></h4>
                    </div>
                </div>
                <div class="buttons">
                    <h4 style="color: blue;">Status: <%= bStatus%></h4>
                    <form action="buildMap" method="post">
                        <input type="hidden" name="build_id" value="<% out.print(build_data_display.getString("id")); %>">
                        <%
                            if (!bStatus.equalsIgnoreCase("Responded")) {
                        %>
                        <input type="hidden" value="Responded" name="status">
                        <input type="submit" class="accept" value="Respond"></input>
                        <%
                            }
                        %>
                    </form> 
                </div>
            </div>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error Occured: " + e.getMessage());
                }
            %>
        </div>
    </body>
</html>
