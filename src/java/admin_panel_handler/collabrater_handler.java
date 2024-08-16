/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin_panel_handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aayus
 */
@WebServlet(name = "collabrater_handler", urlPatterns = {"/collabrater_handler"})
public class collabrater_handler extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            //Get the status to update in database
            String status = request.getParameter("status");
            //Identify the collabrater id to update status
            String collab_id = request.getParameter("collab_id");
            //SQL to update status of particular collabrater
            String update_status_sql = "UPDATE collaborators SET status = ? WHERE id = ?;";

            //Delete rejected forms
            String delete_form_sql = "DELETE FROM collaborators WHERE id = ?";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sxc_GG", "root", "");
                if (status.equalsIgnoreCase("Deleted")) {
                    PreparedStatement status_update = con.prepareStatement(delete_form_sql);
                    status_update.setString(1, collab_id);
                    int form_deleted = status_update.executeUpdate();
                    if (form_deleted != 0) {
                        con.close();
                        RequestDispatcher redirect = request.getRequestDispatcher("collaborater_panel.jsp");
                        redirect.forward(request, response);
                    } else {
                        out.println("Error while updating status please try again");
                    }
                }
                PreparedStatement status_update = con.prepareStatement(update_status_sql);
                status_update.setString(1, status);
                status_update.setString(2, collab_id);
                int status_update_detect = status_update.executeUpdate();
                if (status_update_detect != 0) {
                    RequestDispatcher redirect = request.getRequestDispatcher("collaborater_panel.jsp");
                    redirect.forward(request, response);
                } else {
                    out.println("Error while updating status please try again");
                }
                con.close();
            } catch (Exception e) {
                out.println("Error Occured: " + e.getMessage());
            }

        }
    }
}
