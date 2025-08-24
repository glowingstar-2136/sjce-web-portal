<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration Request</title>
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
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.4);
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

        .form-container {
            width: 50%;
            margin: 50px auto;
            padding: 40px;
            background-color: #1c1c1c;
            border-radius: 20px;
            box-shadow:
                0 10px 30px rgba(0, 0, 0, 0.7),
                0 0 20px rgba(192, 192, 192, 0.1),
                inset 0 1px 1px rgba(255, 255, 255, 0.05);
        }

        h2 {
            text-align: center;
            color: #cfcfcf;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 10px 14px;
            background-color: #292929;
            border: none;
            border-radius: 10px;
            color: #fff;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 14px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            background: linear-gradient(to right, #3d3d3d, #2a2a2a);
            color: #f0f0f0;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #505050, #383838);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

    <ul>
        <li><a href="index.html">Home</a></li>
        <li><a class="active" href="register.jsp">Student Register</a></li>
        <li><a href="student_log.jsp">Student Login</a></li>
        <li><a href="staff_login.jsp">Staff Login</a></li>
    </ul>

    <div class="form-container">
        <h2>Student Registration Request</h2>
        <form action="Registration_Form" method="post" enctype=multipart/form-data>

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="mail_id">Email</label>
                <input type="email" id="mail_id" name="mail_id" required>
            </div>

            <div class="form-group">
                <label for="phone_num">Phone Number</label>
                <input type="text" id="phone_num" name="phone_num" required>
            </div>

            <div class="form-group">
                <label for="department">Department</label>
                <input type="text" id="department" name="department" required>
            </div>

            <div class="form-group">
                <label for="year">Year</label>
                <select id="year" name="year" required>
                    <option value="">Select Year</option>
                    <option value="1st">1st Year</option>
                    <option value="2nd">2nd Year</option>
                    <option value="3rd">3rd Year</option>
                    <option value="4th">4th Year</option>
                </select>
            </div>

            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" required>
            </div>

            <div class="form-group">
                <label for="blood_group">Blood Group</label>
                <input type="text" id="blood_group" name="blood_group" required>
            </div>
            
            <div class="form-group">
                <label for="image">Image</label>
                <input type="file" id="image" name="image" required>
            </div>
            
            <
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" rows="3" required></textarea>
            </div>

            <input type="submit" value="Request Registration">
        </form>
    </div>

</body>
</html>

