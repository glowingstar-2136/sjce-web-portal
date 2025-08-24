<%@ page import="java.sql.*, java.io.*" %>
<%
    int uid = Integer.parseInt(request.getParameter("id"));
    String connectionURL = "jdbc:mysql://localhost:3306/Registration_Form";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    InputStream sImage = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(connectionURL, "root", "admin");
        ps = con.prepareStatement("SELECT image FROM stud_registration WHERE id = ?");
        ps.setInt(1, uid);
        rs = ps.executeQuery();

        if (rs.next()) {
            sImage = rs.getBinaryStream("image");

            response.reset();
            response.setContentType("image/jpeg");

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = sImage.read(buffer)) != -1) {
                response.getOutputStream().write(buffer, 0, bytesRead);
            }
            sImage.close();
        } else {
            out.println("No image found for this id.");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception ex) {
            out.println("Closing error: " + ex.getMessage());
        }
    }
%>
