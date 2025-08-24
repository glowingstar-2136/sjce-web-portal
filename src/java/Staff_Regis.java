import Package.Servlet;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.*;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

@WebServlet("/Staff_Regis")
public class Staff_Regis extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        // Declare fields
        String name = "", staff_id = "", email = "", password = "", mobile = "", gender = "", dob = "", address = "",
               department = "", designation = "", qualification = "", experience_years = "", joining_date = "",
               salary = "", religion = "", mother_tongue = "";

        FileInputStream fis = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] fileData = null;

        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (!isMultipart) {
                session.setAttribute("msg", "Form must have enctype=multipart/form-data.");
                response.sendRedirect("error.jsp");
                return;
            }

            // File Upload Setup
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8");

                    switch (fieldName) {
                        case "name": name = fieldValue; break;
                        case "staff_id": staff_id = fieldValue; break;
                        case "email": email = fieldValue; break;
                        case "password": password = fieldValue; break;
                        case "mobile": mobile = fieldValue; break;
                        case "gender": gender = fieldValue; break;
                        case "dob": dob = fieldValue; break;
                        case "address": address = fieldValue; break;
                        case "department": department = fieldValue; break;
                        case "designation": designation = fieldValue; break;
                        case "qualification": qualification = fieldValue; break;
                        case "experience_years": experience_years = fieldValue; break;
                        case "joining_date": joining_date = fieldValue; break;
                        case "salary": salary = fieldValue; break;
                        case "religion": religion = fieldValue; break;
                        case "mother_tongue": mother_tongue = fieldValue; break;
                    }
                } else if (!item.getName().isEmpty()) {
                    fileData = item.get();
                }
            }

            // DB Setup
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_form", "root", "admin");

            // Check for duplicate email
            String checkQuery = "SELECT id FROM staff_registration WHERE email = ?";
            pstmt = con.prepareStatement(checkQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("msg", "Email already registered.");
                response.sendRedirect("staff_login.jsp");
                return;
            }

            rs.close();
            pstmt.close();

            // Prepare Insert
            String insertQuery = "INSERT INTO staff_registration (name, staff_id, email, password, mobile, gender, dob, address, department, designation, qualification, experience_years, joining_date, salary, religion, mother_tongue, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(insertQuery);

            pstmt.setString(1, name);
            pstmt.setString(2, staff_id);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, mobile);
            pstmt.setString(6, gender);
            pstmt.setString(7, dob);
            pstmt.setString(8, address);
            pstmt.setString(9, department);
            pstmt.setString(10, designation);
            pstmt.setString(11, qualification);
            pstmt.setString(12, experience_years);
            pstmt.setString(13, joining_date);
            pstmt.setString(14, salary);
            pstmt.setString(15, religion);
            pstmt.setString(16, mother_tongue);

            if (fileData == null || fileData.length == 0) {
    session.setAttribute("msg", "Please upload an image to register.");
    response.sendRedirect("staff_register.jsp");
    return;
} else {
                pstmt.setBinaryStream(17, null);
            }

            int result = pstmt.executeUpdate();

            if (result > 0) {
                session.setAttribute("msg", "Staff Registered Successfully!");
                response.sendRedirect("staff_login.jsp");
            } else {
                session.setAttribute("msg", "Registration Failed. Try again.");
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            session.setAttribute("msg", "Error: " + e.getMessage());
            e.printStackTrace(out);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
            try { if (fis != null) fis.close(); } catch (Exception ignored) {}
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Staff Registration Servlet";
    }
}
