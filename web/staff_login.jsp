<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff Login Page</title>
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
        }

        li a:hover, .active {
            background: linear-gradient(to right, #3d3d3d, #2a2a2a);
            transform: translateY(-2px);
            border-radius: 5px;
        }

        .login-container {
            background-color: #1c1c1c;
            width: 40%;
            margin: 60px auto;
            padding: 40px;
            border-radius: 20px;
            box-shadow:
                0 10px 30px rgba(0, 0, 0, 0.7),
                inset 0 1px 1px rgba(255, 255, 255, 0.05),
                0 0 20px rgba(192, 192, 192, 0.1);
            backdrop-filter: blur(3px);
        }

        h2 {
            text-align: center;
            color: #cfcfcf;
            margin-bottom: 30px;
            text-shadow: 0 0 5px rgba(255,255,255,0.1);
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #ccc;
        }

        input[type="text"],
        input[type="password"] {
            display: block;
            width: 100%;
            padding: 12px 15px;
            font-size: 15px;
            border: none;
            border-radius: 10px;
            background: #292929;
            color: #fff;
            box-shadow: inset 1px 1px 2px #111, inset -1px -1px 2px #2e2e2e;
            outline: none;
            transition: all 0.3s ease;
            box-sizing: border-box;
            margin: 0 auto;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            box-shadow: 0 0 8px rgba(200,200,200,0.3);
            background-color: #2f2f2f;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #3d3d3d, #2a2a2a);
            color: #f0f0f0;
            padding: 14px 25px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #505050, #383838);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(255, 255, 255, 0.07);
        }
    </style>
</head>
<body>

    <ul>
        <li><a href="student_home.jsp">Home</a></li>
        <li><a href="register.jsp">Student Register</a></li>
        <li><a href="student_log.jsp">Student Login</a></li>
        <li><a href="staff_register.jsp">Staff Register</a></li>
        <li><a class="active" href="staff_login.jsp">Staff Login</a></li>
    </ul>

    <div class="login-container">
        <h2>Staff Login</h2>
        <form action="Staff_Log" method="post" autocomplete="off" onsubmit="return Validate();">

            <div class="form-group">
                <label for="A_Name">User Mail ID</label>
                <input type="text" id="A_Name" name="email">
            </div>

            <div class="form-group">
                <label for="A_Pass">Password</label>
                <input type="password" id="A_Pass" name="password">
            </div>

            <div style="text-align:center;">
                <input type="submit" value="Login">
            </div>
        </form>
        <div style="text-align: center; margin-top: 20px;">
    <p style="color: #aaa;">Don’t have an account? <a href="staff_register.jsp" style="color: #90caf9;">Request Access</a></p>
</div>
    </div>

</body>
</html>
