<%@page import="Package.Servlet"%>
<%@page import="java.sql.ResultSet"%>
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
    ResultSet rs = db.select("SELECT * FROM stud_registration WHERE id='" + id + "' AND mail_id='" + mail + "'");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Home</title>
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

        .quick-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
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

.info-text {
    flex: 2;
}

.info-text p {
    font-size: 18px;
    margin: 12px 0;
    color: #ddd;
}

.info-image {
    flex: 1;
    width: 180px;
    height: 280px;
    border: 2px solid #c0c0c0;
    border-radius: 12px;
    box-shadow: 0 0 18px silver;
    overflow: hidden;
    background-color: #0e0e0e;
}

.info-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center center;
    border-radius: 10px;
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

    <!-- Navigation bar -->
    <ul>
        <li><a class="active" href="index.html">Home</a></li>
        <li><a href="student_details.jsp">Student Details</a></li>
        <li><a href="student_log.jsp">Logout</a></li>
    </ul>

    <% if (rs.next()) { %>

    <h1>Welcome, <%= rs.getString("name") %>! 💖</h1>

    <div class="quick-info">
    <div class="info-text">
        <p><strong>Department:</strong> <%= rs.getString("department") %></p>
        <p><strong>Year:</strong> <%= rs.getString("year") %> Batch</p>
        <p><strong>Phone Number:</strong><%= rs.getString("phone_num")%></p>
        <p><strong>Mail ID:</strong> <%= rs.getString("mail_id") %></p>
    </div>
    <div class="info-image">
        <img src="image.jsp?id=<%= rs.getInt("id") %>" alt="Student Image">
    </div>
</div>


    <!-- Navigation Tiles -->
    <div class="nav-tiles">
        <a class="tile" href="student_details.jsp">📋 View Profile</a>
        <a class="tile" href="#">📚 Course Materials</a>
        <a class="tile" href="#">📊 View Results</a>
        <a class="tile" href="#">📝 Request Bonafide</a>
        <a class="tile" href="#">🔐 Change Password</a>
        <a class="tile" href="student_log.jsp">🚪 Logout</a>
    </div>

    <!-- Notice Board -->
    <div class="notice-board">
        <h3>📣 Announcements</h3>
        <ul>
            <li>📅 Midterm exams begin from July 15.</li><br>
            <li>🎓 Placement training starts next week.</li><br>
            <li>📝 Internal assignment submission due by June 25.</li><br>
            <li>📌 Update your profile details if outdated.</li><br>
        </ul>
    </div>

    <% } else {
        session.setAttribute("msg", "Invalid session details. Please login again.");
        response.sendRedirect("error.jsp");
    }
    db.close();
    %>

</body>
</html>
