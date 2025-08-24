import Package.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Staff_Log")
public class Staff_Log extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        try {
            String email = request.getParameter("email");
            String pass = request.getParameter("password");

            Servlet db = new Servlet(); // your custom DB helper class
            ResultSet rs = db.select("SELECT * FROM staff_registration WHERE email='" + email + "' AND password='" + pass + "'");

            if (rs != null && rs.next()) {
                int id = rs.getInt("id");
                session.setAttribute("msg", "Successfully Login");
                session.setAttribute("id", id);
                session.setAttribute("email", email);
                response.sendRedirect("staff_home.jsp"); // optional: change to your actual landing page
            } else {
                session.setAttribute("msg", "Invalid email or password");
                response.sendRedirect("staff_login.jsp");
            }

            db.close();
        } catch (Exception e) {
            session.setAttribute("msg", "Error: " + e.getMessage());
            e.printStackTrace(out);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method required.");
    }
}
