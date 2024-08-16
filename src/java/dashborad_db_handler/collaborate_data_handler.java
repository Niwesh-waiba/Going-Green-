package dashborad_db_handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "build_data_handler", urlPatterns = {"/build_data_handler"})
public class collaborate_data_handler extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String name = request.getParameter("fname") + " " + request.getParameter("lname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String org = request.getParameter("organization");
            String products = request.getParameter("products");
            String location = request.getParameter("location");
            String remarks = request.getParameter("remark");
            String status = "Pending";

            String send_build_data = "INSERT INTO collaborators (name, email, phone, organization, special_products, location_details, remarks, status) VALUES (?, ?, ?, ?, ?, ?, ? ,?)";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/sxc_GG", "root", "");
                PreparedStatement insert_data = con.prepareStatement(send_build_data);
                insert_data.setString(1, name);
                insert_data.setString(2, email);
                insert_data.setString(3, phone);
                insert_data.setString(4, org);
                insert_data.setString(5, products);
                insert_data.setString(6, location);
                insert_data.setString(7, remarks);
                insert_data.setString(8, status);
                int status_update_detect = insert_data.executeUpdate();
                if (status_update_detect != 0) {
                    out.println("<script>alert('You Will be notify with the update shortly');</script>");
                    RequestDispatcher redirect = request.getRequestDispatcher("collaborate_page.html");
                    redirect.include(request, response);
                } else {
                    out.println("Error while updating status please try again");
                }
                con.close();

            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
            }
        }
    }

}
