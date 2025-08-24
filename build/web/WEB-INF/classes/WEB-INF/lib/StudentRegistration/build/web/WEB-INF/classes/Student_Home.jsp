

<%@page import="Connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FILE UPLOAD</title>
    </head>
    <ul>
        <li><a href="Student_Home.jsp">Home</a></li>
        <li><a href="staf_Home.jsp">Student Details</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
    <body>
        <h1>hello</h1>
          <%
            Integer id = (Integer) session.getAttribute("id");
            String name = (String) session.getAttribute("Mail_ID");

            if (id != null && name != null) {
                try {
                    DbConnection db = new DbConnection();
                    ResultSet userResult = db.Select("SELECT * FROM student_register WHERE id='" + id + "' AND Mail_ID='" + name + "'");
                    if (userResult.next()) {
                 

        %>
        
       
    
         
            <%                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            } else {
                session.setAttribute("msg", "Session Out Please Login");
                response.sendRedirect("error.jsp");
            }
        %>
    </body>
</html>
