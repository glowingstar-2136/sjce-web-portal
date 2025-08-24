import Package.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Provider_Log")
public class Provider_Log extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        try {
            String mail = request.getParameter("Mail_ID");
            String pass = request.getParameter("password");

            Servlet db = new Servlet(); // your custom DB helper class
            ResultSet rs = db.select("SELECT * FROM stud_registration WHERE Mail_ID='" + mail + "' AND password='" + pass + "'");

            if (rs != null && rs.next()) {
                int ID = rs.getInt("ID");
                session.setAttribute("msg", "Successfully Login");
                session.setAttribute("ID", ID);
                session.setAttribute("Mail_ID", mail);
                response.sendRedirect("student_home.jsp");
            } else {
                session.setAttribute("msg", "Invalid user name or password");
                response.sendRedirect("error.jsp");
            }

            db.close(); // close connections
        } catch (Exception e) {
            session.setAttribute("msg", "Error: " + e.getMessage());
            e.printStackTrace(out);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: block GET method
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method required.");
    }
}
