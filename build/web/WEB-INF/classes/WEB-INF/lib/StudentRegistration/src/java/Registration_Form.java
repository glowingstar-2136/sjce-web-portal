



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

@WebServlet(urlPatterns = {"/Registration_Form"})
public class Registration_Form extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        String NAME = "", PHONE_NUM = "", AGE = "", BLOOD_GROUP = "", ADDRESS = "", DEPARTMENT = "", COLLEGE = "", YEAR = "", MAIL_ID = "", PASSWORD = "";
        String fileName = "", saveFile = "";

        FileInputStream fis = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (!isMultipart) {
                out.println("Form must has enctype=multipart/form-data.");
                return;
            }

            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
            byte[] fileData = null;

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8");

                    switch (fieldName.toLowerCase()) {
                        case "name": NAME = fieldValue; break;
                        case "phone_num": PHONE_NUM = fieldValue; break;
                        case "age": AGE = fieldValue; break;
                        case "blood_group": BLOOD_GROUP = fieldValue; break;
                        case "address": ADDRESS = fieldValue; break;
                        case "department": DEPARTMENT = fieldValue; break;
                        case "college": COLLEGE = fieldValue; break;
                        case "year": YEAR = fieldValue; break;
                        case "mail_id": MAIL_ID = fieldValue; break;
                        case "password": PASSWORD = fieldValue; break;
                    }
                } else {
                    fileName = item.getName();
                    fileData = item.get();
                }
            }

            // Save image to disk (optional)
            String uploadPath = request.getServletContext().getRealPath("/") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            if (!fileName.isEmpty()) {
                saveFile = uploadPath + File.separator + fileName;
                try (FileOutputStream fos = new FileOutputStream(saveFile)) {
                    fos.write(fileData);
                }
                fis = new FileInputStream(new File(saveFile));
            }

            // Database connection
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_form", "root", "admin");

            // Check if email already exists
            String checkQuery = "SELECT * FROM stud_registration WHERE MAIL_ID = ?";
            pstmt = con.prepareStatement(checkQuery);
            pstmt.setString(1, MAIL_ID);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("msg", "Already exists. Please check values.");
                response.sendRedirect("index.html");
                return;
            }

            // Insert new student
            String insertQuery = "INSERT INTO stud_registration (NAME, PHONE_NUM, AGE, BLOOD_GROUP, ADDRESS, DEPARTMENT, COLLEGE, YEAR, MAIL_ID, PASSWORD, IMAGE) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, NAME); // auto_increment or placeholder
            pstmt.setString(2, PHONE_NUM);
            pstmt.setString(3, AGE);
            pstmt.setString(4, BLOOD_GROUP);
            pstmt.setString(5, ADDRESS);
            pstmt.setString(6, DEPARTMENT);
            pstmt.setString(7, COLLEGE);
            pstmt.setString(8, YEAR);
            pstmt.setString(9, MAIL_ID);
            pstmt.setString(10, PASSWORD);

            if (fis != null) {
                pstmt.setBinaryStream(11, fis, fis.available());
            } else {
                pstmt.setBinaryStream(11, null);
            }

            int result = pstmt.executeUpdate();
            if (result > 0) {
                session.setAttribute("msg", "Successfully Registered!");
                response.sendRedirect("index.html");
            } else {
                session.setAttribute("msg", "Registration Failed.");
                response.sendRedirect("index.html");
            }

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace(out);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
            try { if (fis != null) fis.close(); } catch (Exception e) {}
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles Student Registration Form submissions";
    }
}