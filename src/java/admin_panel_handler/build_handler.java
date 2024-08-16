package admin_panel_handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
@WebServlet(name = "build_handler", urlPatterns = {"/build_handler"})
public class build_handler extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            //Get the status to update in database
            String status = request.getParameter("status");
            //Identify the build id to update status
            String build_id = request.getParameter("build_id");

            //SQL to update status of particular build
            String update_status_sql = "UPDATE gg_build_form SET status = ? WHERE id = ?;";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sxc_GG", "root", "");
                PreparedStatement status_update = con.prepareStatement(update_status_sql);
                status_update.setString(1, status);
                status_update.setString(2, build_id);
                int status_update_detect = status_update.executeUpdate();
                if (status_update_detect != 0) {
                    
                    RequestDispatcher redirect = request.getRequestDispatcher("build_panel.jsp");
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
