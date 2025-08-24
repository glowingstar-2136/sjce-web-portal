<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Login Page</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #1a1a1a;
            color: #f0f0f0;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #000;
            overflow: hidden;
            text-align: center;
        }

        li {
            display: inline;
        }

        li a {
            display: inline-block;
            color: white;
            text-align: center;
            padding: 14px 25px;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        li a:hover, .active {
            background-color: deeppink;
            border-radius: 5px;
        }

        .login-container {
            background-color: #2c2c2c;
            width: 40%;
            margin: 60px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(255, 20, 147, 0.6);
        }

        h2 {
            text-align: center;
            color: #f8c8dc;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #f8c8dc;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: deeppink;
            color: white;
            padding: 12px 20px;
            border: none;
            font-size: 18px;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #ff69b4;
        }
    </style>
</head>
<body>

    <ul>
        <li><a href="student_home.jsp">Home</a></li>
        <li><a href="index.html">Student Register</a></li>
        <li><a class="active" href="student_log.jsp">Student Login</a></li>
        <li><a href="staff_register.jsp">Staff Register</a></li>
        <li><a href="staff_login.jsp">Staff Login</a></li>
    </ul>

    <div class="login-container">
        <h2>Student Login</h2>
        <form action="Provider_Log" method="post" onsubmit="return Validate();">
            <div class="form-group">
                <label for="A_Name">User Mail ID</label>
                <input type="text" id="A_Name" name="Mail_ID" required>
            </div>

            <div class="form-group">
                <label for="A_Pass">Password</label>
                <input type="password" id="A_Pass" name="password" required>
            </div>

            <input type="submit" value="Login">
        </form>
    </div>

</body>
</html>
