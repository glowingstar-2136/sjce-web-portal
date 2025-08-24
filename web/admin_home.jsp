<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("error.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #0d0d0d;
            color: #f2f2f2;
            background-image: radial-gradient(circle at 20% 20%, #1a1a1a, #000);
        }

        /* Navigation Bar */
        .navbar {
            background-color: #1c1c1c;
            padding: 12px 30px;
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            color: #e0e0e0;
            margin: 0;
            letter-spacing: 1px;
        }

        .nav-links a {
            color: #dcdcdc;
            text-decoration: none;
            margin-left: 30px;
            font-size: 16px;
            transition: all 0.3s;
        }

        .nav-links a:hover, .nav-links .active {
            color: #ffffff;
            background: linear-gradient(90deg, #777, #444);
            padding: 6px 12px;
            border-radius: 8px;
            box-shadow: 0 0 10px silver;
        }

        /* Welcome Box */
        .welcome-box {
            max-width: 700px;
            margin: 80px auto 40px;
            background-color: #1a1a1a;
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 0 20px rgba(192,192,192,0.2), inset 0 0 5px rgba(255,255,255,0.05);
        }

        .welcome-box h1 {
            font-size: 32px;
            color: #fff;
            margin-bottom: 15px;
            text-shadow: 0 0 8px rgba(255,255,255,0.1);
        }

        .welcome-box p {
            font-size: 18px;
            color: #ccc;
        }

        /* Admin Action Tiles */
        .tile-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-bottom: 60px;
        }

        .tile {
            background-color: #262626;
            padding: 30px 40px;
            border-radius: 15px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            color: #f0f0f0;
            text-decoration: none;
            box-shadow:
                0 4px 10px rgba(0, 0, 0, 0.6),
                0 0 15px rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .tile:hover {
            background: linear-gradient(to right, #3a3a3a, #2a2a2a);
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.2);
            transform: translateY(-5px);
        }

        .footer {
            text-align: center;
            color: #aaa;
            font-size: 13px;
            padding-bottom: 30px;
        }

    </style>
</head>
<body>

    <div class="navbar">
        <h2>Admin Panel</h2>
        <div class="nav-links">
            <a class="active" href="admin_home.jsp">Dashboard</a>
            <a href="admin_approve.jsp">Approve Requests</a>
            <a href="admin_manage.jsp">Manage Users</a>
            <a href="admin_login.jsp">Logout</a>
        </div>
    </div>

    <div class="welcome-box">
        <h1>Welcome, Admin! 👑</h1>
        <p>You have full control over the portal. Use the options below to manage users and oversee the system.</p>
    </div>

    <div class="tile-container">
        <a class="tile" href="admin_approve.jsp">📥 Approve Student Requests</a>
        <a class="tile" href="admin_manage.jsp">👤 Manage Registered Users</a>
        <a class="tile" href="#">📊 View Reports</a>
        <a class="tile" href="#">📢 Announcements</a>
        <a class="tile" href="admin_login.jsp">🚪 Logout</a>
    </div>

    <div class="footer">
        &copy; 2025 Student Portal | Designed for Power ✨
    </div>

</body>
</html>
