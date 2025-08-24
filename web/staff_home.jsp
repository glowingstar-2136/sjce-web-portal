<%@page import="Package.Servlet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Integer id = (Integer) session.getAttribute("id");
    String email = (String) session.getAttribute("email");

    if (id == null || email == null) {
        session.setAttribute("msg", "Session expired. Please login again.");
        response.sendRedirect("error.jsp");
        return;
    }

    Servlet db = new Servlet();
    ResultSet rs = db.select("SELECT * FROM staff_registration WHERE id='" + id + "' AND email='" + email + "'");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Home</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #101010;
            color: #f0f0f0;
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
        }

        li a:hover, .active {
            background: linear-gradient(to right, #3d3d3d, #2a2a2a);
            transform: translateY(-2px);
            border-radius: 5px;
        }

        h1 {
            text-align: center;
            margin: 40px 0 20px;
            color: #cfcfcf;
            text-shadow: 0 0 8px rgba(255, 255, 255, 0.1);
        }

        .info-box {
            background-color: #1c1c1c;
            width: 60%;
            margin: 0 auto 30px;
            padding: 25px 30px;
            border-radius: 20px;
            box-shadow:
                0 10px 25px rgba(0, 0, 0, 0.7),
                0 0 20px rgba(192, 192, 192, 0.1),
                inset 0 1px 1px rgba(255, 255, 255, 0.05);
        }

        .info-box p {
            font-size: 18px;
            margin: 10px 0;
            color: #ddd;
        }

        .nav-tiles {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            margin: 30px auto;
            width: 80%;
        }

        .tile {
            background-color: #2a2a2a;
            padding: 25px 35px;
            border-radius: 15px;
            width: 200px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            color: #f0f0f0;
            text-decoration: none;
            box-shadow:
                0 4px 10px rgba(0, 0, 0, 0.6),
                0 0 10px rgba(255, 255, 255, 0.05);
            transition: all 0.3s ease;
        }

        .tile:hover {
            background: linear-gradient(to right, #3d3d3d, #2a2a2a);
            box-shadow: 0 0 15px rgba(255,255,255,0.15);
            transform: translateY(-5px);
        }

        .notice-board {
            width: 60%;
            margin: 40px auto;
            background-color: #1c1c1c;
            padding: 20px 25px;
            border-radius: 15px;
            box-shadow: 0 0 12px rgba(192,192,192,0.1);
        }

        .notice-board h3 {
            color: #dcdcdc;
            border-bottom: 1px solid #444;
            padding-bottom: 10px;
        }

        .notice-board ul {
            list-style: square;
            padding-left: 25px;
            color: #ccc;
        }

        .notice-board li {
            margin: 8px 0;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <ul>
        <li><a class="active" href="index.html">Home</a></li>
        <li><a href="staff_details.jsp">Staff Details</a></li>
        <li><a href="staff_login.jsp">Logout</a></li>
    </ul>

    <% if (rs.next()) { %>
    <h1>Welcome, <%= rs.getString("name") %>! 💼</h1>

    <div class="info-box">
        <p><strong>Department:</strong> <%= rs.getString("department") %></p>
        <p><strong>Designation:</strong> <%= rs.getString("designation") %></p>
        <p><strong>Qualification:</strong> <%= rs.getString("qualification") %></p>
        <p><strong>Joining Date:</strong> <%= rs.getString("joining_date") %></p>
        <p><strong>Email:</strong> <%= rs.getString("email") %></p>
    </div>

    <div class="nav-tiles">
        <a class="tile" href="staff_details.jsp">👤 View Profile</a>
        <a class="tile" href="#">📁 Upload Materials</a>
        <a class="tile" href="#">🧾 View Attendance</a>
        <a class="tile" href="#">📝 Add Marks</a>
        <a class="tile" href="#">🔐 Change Password</a>
        <a class="tile" href="staff_login.jsp">🚪 Logout</a>
    </div>

    <div class="notice-board">
        <h3>📢 Staff Announcements</h3>
        <ul>
            <li>📅 Faculty development program on July 10.</li><br>
            <li>📝 Submit syllabus plan by June 25.</li><br>
            <li>📌 Departmental meeting on Friday at 3 PM.</li><br>
            <li>💡 Update your subject schedule by next week.</li><br>
        </ul>
    </div>

    <% } else {
        session.setAttribute("msg", "Invalid session. Please login again.");
        response.sendRedirect("error.jsp");
    }
    db.close();
    %>

</body>
</html>
