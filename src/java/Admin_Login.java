import Package.Servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get credentials
        String email = request.getParameter("admin_email");
        String password = request.getParameter("admin_password");

        HttpSession session = request.getSession();

        // Hardcoded admin credentials
        String adminEmail = "yuvashree@stjosephs.ac.in";
        String adminPassword = "sjce_2136";

        if (email.equalsIgnoreCase(adminEmail) && password.equals(adminPassword)) {
            session.setAttribute("role", "admin");
            session.setAttribute("admin_email", email);
            response.sendRedirect("admin_home.jsp");
        } else {
            session.setAttribute("msg", "Invalid admin credentials. Please try again.");
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: disable GET method
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Use POST to login.");
    }
}
