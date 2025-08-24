import Package.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Stud_Log")
public class Stud_Log extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        try {
            String mail = request.getParameter("mail_id");
            String pass = request.getParameter("password");

            // First check if the user is admin
            if (mail != null && pass != null && 
                mail.equalsIgnoreCase("yuvashreecv@gmail.com") && pass.equals("glowingstar_2136")) {
                session.setAttribute("msg", "Welcome, Admin!");
                session.setAttribute("mail_id", mail);
                session.setAttribute("role", "admin");
                response.sendRedirect("admin.jsp");
                return;  // This return is crucial to stop further execution
            }

            // Only proceed with student login if not admin
            Servlet db = null;
            try {
                db = new Servlet(); // your custom DB helper class
                ResultSet rs = db.select("SELECT * FROM stud_registration WHERE mail_id='" + mail + "' AND password='" + pass + "'");

                if (rs != null && rs.next()) {
                    int id = rs.getInt("id");
                    session.setAttribute("msg", "Successfully Logged In!");
                    session.setAttribute("id", id);
                    session.setAttribute("mail_id", mail);
                    session.setAttribute("role", "student");
                    response.sendRedirect("student_home.jsp");
                } else {
                    session.setAttribute("msg", "Invalid username or password.");
                    response.sendRedirect("error.jsp");
                }
            } finally {
                if (db != null) {
                    db.close(); // always close connection
                }
            }
        } catch (Exception e) {
            session.setAttribute("msg", "Error: " + e.getMessage());
            response.sendRedirect("error.jsp");
            e.printStackTrace(out);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method required.");
    }
}