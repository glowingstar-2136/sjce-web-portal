<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String msg = (String) session.getAttribute("msg");
    // Get credentials from SESSION instead of request parameters
    String mail = (String) session.getAttribute("mail_id");
    String role = (String) session.getAttribute("role");

    // Clear session message after use
    session.removeAttribute("msg");

    // If admin is in session but reached error page, redirect them
    if ("admin".equals(role) {
        response.sendRedirect("admin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Access Denied - Error</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0a0a0a;
            background-image: radial-gradient(circle at center, #1e1e1e, #0a0a0a);
            color: #e0e0e0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .error-card {
            background: #151515;
            padding: 50px 60px;
            border-radius: 18px;
            width: 55%;
            max-width: 620px;
            text-align: center;
            box-shadow:
                0 15px 40px rgba(0, 0, 0, 0.7),
                0 0 25px rgba(255, 255, 255, 0.08),
                inset 0 1px 1px rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(4px);
            animation: slideIn 0.6s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .error-card h1 {
            font-size: 44px;
            margin-bottom: 20px;
            color: #f0f0f0;
            text-shadow: 0 0 10px rgba(255,255,255,0.15);
        }

        .error-card p {
            font-size: 18px;
            color: #cccccc;
            margin-bottom: 35px;
            line-height: 1.6;
        }

        .error-card a {
            padding: 12px 28px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 10px;
            background: linear-gradient(to right, #3d3d3d, #2a2a2a);
            color: #f0f0f0;
            box-shadow: 0 5px 15px rgba(255,255,255,0.07);
            transition: all 0.3s ease;
        }

        .error-card a:hover {
            background: linear-gradient(to right, #5a5a5a, #333);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(255,255,255,0.15);
        }

        @keyframes slideIn {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="error-card">
        <h1>Oops! Something Went WRONG!!!</h1>
        <p><%= msg != null ? msg : "Unknown error occurred. Please try again." %></p>
        <a href="student_log.jsp">Back to Login</a>
    </div>
</body>
</html>