<%@page import="java.sql.ResultSet"%>
<%@page import="Package.Servlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Integer id = (Integer) session.getAttribute("id");
    String mail = (String) session.getAttribute("mail_id");

    if (id == null || mail == null) {
        session.setAttribute("msg", "Session expired. Please login again.");
        response.sendRedirect("error.jsp");
        return;
    }

    Servlet db = new Servlet();
    ResultSet userResult = db.select("SELECT * FROM stud_registration WHERE id='" + id + "' AND mail_id='" + mail + "'");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #101010;
            color: #e0e0e0;
            background-image: radial-gradient(circle at 30% 30%, #1f1f1f, #0e0e0e);
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #1c1c1c;
            box-shadow: 0 4px 10px rgba(0,0,0,0.4);
            text-align: center;
        }

        li {
            display: inline;
        }

        li a {
            display: inline-block;
            color: #f0f0f0;
            padding: 14px 25px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s;
            border-radius: 5px;
        }

        li a:hover, .active {
            background: linear-gradient(to right, #3d3d3d, #2a2a2a);
            transform: translateY(-2px);
        }

        h1 {
            text-align: center;
            margin-top: 40px;
            color: #eaeaea;
            text-shadow: 0 0 8px rgba(255,255,255,0.1);
        }

        .details-box {
            background-color: #1c1c1c;
            width: 60%;
            margin: 40px auto;
            padding: 40px;
            border-radius: 20px;
            box-shadow:
                0 15px 30px rgba(0, 0, 0, 0.7),
                0 0 20px rgba(255, 255, 255, 0.07),
                inset 0 1px 1px rgba(255, 255, 255, 0.04);
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }

        .detail-label {
            font-weight: bold;
            width: 30%;
            color: #ffffff;
        }

        .detail-value {
            width: 70%;
            color: #d0d0d0;
        }

    </style>
</head>
<body>

    <ul>
        <li><a href="index.html">Home</a></li>
        <li><a class="active" href="student_details.jsp">Student Details</a></li>
        <li><a href="student_log.jsp">Logout</a></li>
    </ul>

    <h1>Student Details</h1>

    <% if (userResult.next()) { %>
    <div class="details-box">
        <div class="detail-row">
            <div class="detail-label">Name:</div>
            <div class="detail-value"><%= userResult.getString("name") %></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">Mail ID:</div>
            <div class="detail-value"><%= userResult.getString("mail_id") %></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">Phone Number:</div>
            <div class="detail-value"><%= userResult.getString("phone_num") %></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">Department:</div>
            <div class="detail-value"><%= userResult.getString("department") %></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">Year:</div>
            <div class="detail-value"><%= userResult.getString("year") %></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">Age:</div>
            <div class="detail-value"><%= userResult.getString("age") %></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">Blood Group:</div>
            <div class="detail-value"><%= userResult.getString("blood_group") %></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">Address:</div>
            <div class="detail-value"><%= userResult.getString("address") %></div>
        </div>
    </div>
    <% } else {
        session.setAttribute("msg", "No user details found.");
        response.sendRedirect("error.jsp");
    }
    db.close();
    %>

</body>
</html>
