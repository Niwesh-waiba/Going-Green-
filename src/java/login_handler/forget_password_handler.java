/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package login_handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security_protocol.hashing;

/**
 *
 * @author aayus
 */
@WebServlet(name = "forget_password_handler", urlPatterns = {"/forget_password_handler"})
public class forget_password_handler extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            //Email to identify the user tw change the password
            String user_email = request.getParameter("user-email");
            //Old password to verify the user
            String old_password = request.getParameter("old-password");
            //Update password after verification
            String new_password = request.getParameter("new-password");

            //Convert password into hash value
            new_password = hashing.hashMD5(new_password);
            old_password = hashing.hashMD5(old_password);

            //SQL for updating user password
            String update_password_sql = "UPDATE user_details SET user_password = ? WHERE user_email = ?;";
            //SQL to get user data for validation
            String get_data = "SELECT user_email, user_password FROM user_details;";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sxc_GG", "root", "");
                //Preparing statement to retrive data in database
                PreparedStatement get_user_data = con.prepareCall(get_data);
                //Storing retrive data from database
                ResultSet user_logs_data = get_user_data.executeQuery();
                //Initilizing flags  for validation
                boolean user_validate_flag = false;
                //Verifying user with data in database
                while (user_logs_data.next()) {
                    String gEmail = user_logs_data.getString("user_email"),
                            gPass = user_logs_data.getString("user_password");
                    //Execute and break loop when user is verified
                    if (gEmail.equals(user_email) && gPass.equals(old_password)) {
                        user_validate_flag = true;
                        break;
                    }
                    //Or else it dont verify user
                }
                if (user_validate_flag) {
                    //Preparing statement to update data in database
                    PreparedStatement set_user_data = con.prepareCall(update_password_sql);
                    //Storing update status from database
                    int inspect_update=set_user_data.executeUpdate();
                    RequestDispatcher dispatch = request.getRequestDispatcher("Dashboard.html");
                    dispatch.include(request, response);
                } else {
                    out.println("Wrong Email or Password");
                    RequestDispatcher dispatch = request.getRequestDispatcher("login.html");
                    dispatch.include(request, response);
                }

            } catch (Exception e) {
                out.println("Error occured: " + e.getMessage());
            }

        }
    }
}
