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

        // Form input fields
        String name = "", phone_num = "", age = "", blood_group = "", address = "", department = "", year = "", mail_id = "";
        String fileName = "", saveFile = "";
        byte[] fileData = null;

        FileInputStream fis = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (!isMultipart) {
                out.println("Form must have enctype=multipart/form-data.");
                return;
            }

            // File upload handling
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));

            for (FileItem item : items) {
                if (item.isFormField()) {
                    // Get form fields
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8");

                    switch (fieldName.toLowerCase()) {
                        case "name": name = fieldValue; break;
                        case "phone_num": phone_num = fieldValue; break;
                        case "age": age = fieldValue; break;
                        case "blood_group": blood_group = fieldValue; break;
                        case "address": address = fieldValue; break;
                        case "department": department = fieldValue; break;
                        case "year": year = fieldValue; break;
                        case "mail_id": mail_id = fieldValue; break;
                    }
                } else {
                    // Get file data
                    fileName = new File(item.getName()).getName();
                    fileData = item.get();
                }
            }

            // Save uploaded image to disk (optional)
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = request.getServletContext().getRealPath("/") + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                saveFile = uploadPath + File.separator + fileName;
                try (FileOutputStream fos = new FileOutputStream(saveFile)) {
                    fos.write(fileData);
                }
                fis = new FileInputStream(saveFile);
            }

            // DB Connection
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_form", "root", "admin");

            // Check duplicate mail_id in both approved and pending tables
            String checkQuery = "SELECT mail_id FROM stud_registration WHERE mail_id = ? UNION SELECT mail_id FROM pending_stud_requests WHERE mail_id = ?";
            pstmt = con.prepareStatement(checkQuery);
            pstmt.setString(1, mail_id);
            pstmt.setString(2, mail_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("msg", "You’ve already submitted a request. Please wait until the admin approves your registration.");
                response.sendRedirect("request.jsp");
                return;
            }

            // Insert into pending_stud_requests table
            String insertQuery = "INSERT INTO pending_stud_requests (name, phone_num, age, blood_group, address, department, year, mail_id, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, phone_num);
            pstmt.setString(3, age);
            pstmt.setString(4, blood_group);
            pstmt.setString(5, address);
            pstmt.setString(6, department);
            pstmt.setString(7, year);
            pstmt.setString(8, mail_id);
            pstmt.setBinaryStream(9, (fis != null) ? fis : null);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                session.setAttribute("msg", "Your request has been sent for approval. Please wait.");
                response.sendRedirect("request.jsp");
            } else {
                session.setAttribute("msg", "Something went wrong. Try again.");
                response.sendRedirect("register.jsp");
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles Student Registration Requests with Image Upload (No Password)";
    }
}
