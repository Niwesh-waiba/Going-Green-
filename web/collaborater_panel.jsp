<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin-Collaborater</title>
        <link rel="stylesheet" href="styles/collaborater_panel.css" />
        <link rel="shortcut icon"
              href="image/logo.png"
              type="image/x-icon" />
    </head>
    <body>
        <%@include file="navBarForAdminPanel.html" %>
        <video autoplay loop muted src="image/bg_video.mp4" ></video>

        <div class="body">
            <%
                String get_data = "Select * from collaborators;";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sxc_GG", "root", "");
                    //Preparing statement to retrive data in database
                    PreparedStatement collabrater_data = con.prepareStatement(get_data);
                    //Storing retrive data from database
                    ResultSet collabrater_data_display = collabrater_data.executeQuery();
                    while (collabrater_data_display.next()) {
                        String cName = collabrater_data_display.getString("name");
                        String cEmail = collabrater_data_display.getString("email");
                        String cPhone = collabrater_data_display.getString("phone");
                        String cOrganization = collabrater_data_display.getString("organization");
                        String cProducts = collabrater_data_display.getString("special_products");
                        String cRemarks = collabrater_data_display.getString("remarks");
                        String cStatus = collabrater_data_display.getString("status");
                        String cCreatedOn = collabrater_data_display.getString("created_on");
            %>
            <div class="container">
                <div class="intro">
                    <div class="left_pane">
                        <h4>Name: <%= cName%></h4>
                        <u>Contact</u>
                        <h4>Email: <%= cEmail%></h4>
                        <h4>Phone: <%= cPhone%></h4>
                    </div>
                    <div class="right_pane">
                        <h4>Organization: <%= cOrganization%></h4>
                        <h4>Products: <%= cProducts%></h4>
                        <h4>On:<%= cCreatedOn%></h4>
                    </div>
                </div>
                <div class="buttons">
                    <form action="collabraterMap" method="post">
                        <input type="hidden" name="collab_id" value="<% out.print(collabrater_data_display.getString("id")); %>">
                        <input type="hidden" value="Accepted" name="status">
                        <input type="submit" class="accept" value="Accept"></input>
                    </form> 
                    <form action="collabraterMap" method="post">
                        <input type="hidden" name="collab_id" value="<% out.print(collabrater_data_display.getString("id")); %>">
                        <input type="hidden" value="Rejected" name="status">
                        <input type="submit" class="reject" value="Reject"></input>
                    </form>
                    <%
                        if (cStatus.equalsIgnoreCase("Rejected")) {
                    %>
                    <form action="collabraterMap" method="post">
                        <input type="hidden" name="collab_id" value="<% out.print(collabrater_data_display.getString("id")); %>">
                        <input type="hidden" value="Deleted" name="status">
                        <input type="submit" class="reject" value="Delete"></input>
                    </form>
                    <%                        }
                    %>
                </div>
                <%
                    if (cStatus.equalsIgnoreCase("Pending")) {
                        out.println("<h4 style='color: yellow;'>Status:" + cStatus + "</h4>");
                    } else if (cStatus.equalsIgnoreCase("Accepted")) {
                        out.println("<h4 style='color: blue;'>Status:" + cStatus + "</h4>");
                    } else if (cStatus.equalsIgnoreCase("Rejected")) {
                        out.println("<h4 style='color: red;'>Status:" + cStatus + "</h4>");
                    } else {
                        out.println("<h4 style='color: white;'>Status: Unidentified</h4>");
                    }
                %>
                <div class="about_us">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quae
                    perspiciatis quasi aliquam quidem fugiat magnam magni soluta consectetur
                    architecto tenetur, quam beatae assumenda neque repellendus fugit
                    incidunt explicabo sequi mollitia? <%= cRemarks%>
                </div>
            </div>
            <%  }
                    con.close();
                } catch (Exception e) {
                    out.println("Error Occured: " + e.getMessage());
                }
            %>
        </div>
    </body>
</html>
