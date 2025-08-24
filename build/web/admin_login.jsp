<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0d0d0d;
            background-image: radial-gradient(circle at top left, #222, #000);
            color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            background: #1a1a1a;
            border: 1px solid #555;
            border-radius: 15px;
            padding: 40px 50px;
            box-shadow:
                0 0 15px rgba(255, 255, 255, 0.1),
                0 0 25px rgba(192, 192, 192, 0.2);
            width: 400px;
        }

        .login-box h2 {
            margin-bottom: 30px;
            color: #ffffff;
            text-shadow: 0 0 8px silver;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 12px 0 20px;
            border: none;
            border-radius: 8px;
            background: #2b2b2b;
            color: white;
            font-size: 16px;
            box-shadow: inset 0 0 5px #444;
        }

        .login-box button {
            background: linear-gradient(to right, #444, #1c1c1c);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: 0.3s ease;
        }

        .login-box button:hover {
            background: linear-gradient(to right, #777, #333);
            box-shadow: 0 0 10px silver;
        }

        .note {
            margin-top: 15px;
            font-size: 13px;
            color: #aaa;
        }
    </style>
    <script>
    function Validate() {
        var email = document.getElementById("A_Name").value.trim();
        var password = document.getElementById("A_Pass").value;

        // Allow only the specific admin email
        if (email !== "yuvashree@stjosephs.ac.in") {
            alert("Only authorized admin email is allowed.");
            return false;
        }

        // Password must be at least 6 characters
        if (password.length < 6) {
            alert("Password must be at least 6 characters long.");
            return false;
        }

        return true;
    }
</script>

</head>
<body>
    <div class="login-box">
        <h2>Admin Login Panel</h2>
        <form action="Admin_Login" method="post" onsubmit="return validateAdminLogin();">
            <input type="text" id="admin_email" name="admin_email" placeholder="Admin Email" required>
            <input type="password" id="admin_password" name="admin_password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="note">Only authorized personnel allowed.</div>
    </div>
</body>
</html>
