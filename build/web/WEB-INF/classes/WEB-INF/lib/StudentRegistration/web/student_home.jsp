<%@page import="Package.Servlet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Integer id = (Integer) session.getAttribute("id"); // Note: lowercase 'id' here matches the login servlet
    String mail = (String) session.getAttribute("Mail_ID");

    if (id == null || mail == null) {
        session.setAttribute("msg", "Session expired. Please login again.");
        response.sendRedirect("error.jsp");
        return;
    }

    Servlet db = new Servlet();
    ResultSet userResult = db.select("SELECT * FROM stud_registration WHERE ID='" + id + "' AND MAIL_ID='" + mail + "'");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Home</title>
    <style>
        body {
            background-color: #1a1a1a;
            color: #f0f0f0;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #000;
            overflow: hidden;
            text-align: center;
            box-shadow: 0 2px 10px deeppink;
        }

        li {
            display: inline;
        }

        li a {
            display: inline-block;
            color: white;
            padding: 14px 25px;
            text-decoration: none;
            transition: background 0.3s ease;
            border-radius: 5px;
        }

        li a:hover, .active {
            background-color: deeppink;
            box-shadow: 0 0 10px deeppink;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #f8c8dc;
            text-shadow: 0 0 10px deeppink;
        }

        .info-box {
            background-color: #2c2c2c;
            width: 50%;
            margin: 30px auto;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 0 15px deeppink;
            text-align: center;
        }

        .info-box p {
            font-size: 18px;
            color: #ffb6c1;
        }
    </style>
</head>
<body>
    <ul>
        <li><a class="active" href="student_home.jsp">Home</a></li>
        <li><a href="index.html">Register</a></li>
        <li><a href="student_log.jsp">Logout</a></li>
    </ul>

    <%
        if (userResult.next()) {
    %>
    <h1>Welcome, <%= userResult.getString("NAME") %>! 💖</h1>

    <div class="info-box">
        <p><strong>Mail ID:</strong> <%= userResult.getString("MAIL_ID") %></p>
        <p><strong>Department:</strong> <%= userResult.getString("DEPARTMENT") %></p>
        <p><strong>College:</strong> <%= userResult.getString("COLLEGE") %></p>
        <p><strong>Year:</strong> <%= userResult.getString("YEAR") %></p>
    </div>
    <%
        } else {
            session.setAttribute("msg", "Invalid session details. Please login.");
            response.sendRedirect("error.jsp");
        }
        db.close();
    %>
</body>
</html>
