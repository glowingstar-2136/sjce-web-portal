<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #101010;
            color: #f0f0f0;
            background-image: radial-gradient(circle at 30% 30%, #1f1f1f, #0e0e0e);
        }

        .container {
            width: 400px;
            margin: 100px auto;
            background-color: #1c1c1c;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(255,255,255,0.07);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #eaeaea;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="email"], input[type="password"] {
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            background-color: #2a2a2a;
            color: #ffffff;
        }

        input[type="submit"] {
            padding: 12px;
            border: none;
            border-radius: 10px;
            background-color: #444;
            color: #f0f0f0;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #5a5a5a;
        }

        .message {
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
            color: #ff9999;
        }

        .new-user {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .new-user a {
            color: #87cefa;
            text-decoration: none;
        }

        .new-user a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Student Login</h2>

        <!-- Display Message (if any) -->
        <%
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>
            <div class="message"><%= msg %></div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <form action="Stud_Log" method="post">
            <input type="email" name="mail_id" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>

        <div class="new-user">
            New user? <a href="register.jsp">Request Registration</a>
        </div>
    </div>
        <script>
    function validate() {
        // Get student email and password input values
        var email = document.getElementById("student_email").value.trim();
        var password = document.getElementById("student_password").value;

        // Validate email format
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailPattern.test(email)) {
            alert("Please enter a valid student email address.");
            return false;
        }

        // Validate password length
        if (password.length < 6) {
            alert("Password must be at least 6 characters long.");
            return false;
        }

        return true; // All checks passed
    }
</script>

</body>
</html>
