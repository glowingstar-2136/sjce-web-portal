<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
        session.removeAttribute("msg");
    } else {
        msg = "Your registration request has been submitted successfully!";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Submitted</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #101010;
            color: #e0e0e0;
            background-image: radial-gradient(circle at 30% 30%, #1f1f1f, #0e0e0e);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background-color: #1c1c1c;
            padding: 40px 60px;
            border-radius: 15px;
            box-shadow:
                0 8px 20px rgba(0, 0, 0, 0.7),
                0 0 20px rgba(255, 255, 255, 0.07),
                inset 0 1px 1px rgba(255, 255, 255, 0.04);
            text-align: center;
            max-width: 500px;
        }

        h1 {
            color: #ffffff;
            margin-bottom: 20px;
            text-shadow: 0 0 8px rgba(255,255,255,0.1);
        }

        p {
            font-size: 16px;
            color: #cccccc;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            margin: 0 10px;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            background: linear-gradient(to right, #4d4d4d, #2e2e2e);
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(to right, #6b6b6b, #444444);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

    <div class="box">
        <h1>Request Submitted</h1>
        <p><%= msg %></p>

        <a href="student_log.jsp" class="btn">Go to Login</a>
        <a href="index.html" class="btn">Back to Home</a>
    </div>

</body>
</html>
