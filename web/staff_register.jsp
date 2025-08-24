<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff Registration</title>
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

        .form-container {
    background-color: #1c1c1c; /* Darker but distinct from background */
    width: 55%;
    margin: 50px auto;
    padding: 40px;
    border-radius: 20px;
    box-shadow:
        0 10px 30px rgba(0, 0, 0, 0.7),         /* Deep shadow below */
        inset 0 1px 1px rgba(255, 255, 255, 0.05), /* Slight top inset */
        0 0 20px rgba(192, 192, 192, 0.1);       /* Soft silver glow around */
    backdrop-filter: blur(3px);
}

        h1 {
            text-align: center;
            color: #cfcfcf;
            margin-bottom: 40px;
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
input[type="file"],
input[type="password"] {
    display: block;
    width: 100%;
    padding: 12px 15px; /* Even padding left and right */
    font-size: 15px;
    border: none;
    border-radius: 10px;
    background: #292929;
    color: #fff;
    box-shadow: inset 1px 1px 2px #111, inset -1px -1px 2px #2e2e2e;
    outline: none;
    transition: all 0.3s ease;
    box-sizing: border-box; /* ensures padding doesn't overflow the width */
    margin: 0 auto; /* for proper alignment */
}

        input[type="text"]:focus,
        input[type="file"]:focus,
        input[type="password"]:focus {
            box-shadow: 0 0 8px rgba(200,200,200,0.3);
            background-color: #2f2f2f;
        }

        input[type="submit"] {
    background: linear-gradient(to right, #3d3d3d, #2a2a2a); /* Same as navbar hover */
    color: #f0f0f0;
    padding: 14px 25px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s, box-shadow 0.3s ease;
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
        <li><a class="active" href="staff_register.jsp">Staff Register</a></li>
        <li><a href="staff_login.jsp">Staff Login</a></li>
    </ul>

    <div class="form-container">
        <h1>Staff Registration</h1>
        <form action="Staff_Regis" method="post" enctype="multipart/form-data">
            
            <!-- Basic Info -->
            <div class="form-group"><label>Name:</label><input type="text" name="name" required></div>
            <div class="form-group"><label>Staff ID:</label><input type="text" name="staff_id" required></div>
            <div class="form-group"><label>Email:</label><input type="text" name="email" required></div>
            <div class="form-group"><label>Password:</label><input type="password" name="password" required></div>
            <div class="form-group"><label>Mobile:</label><input type="text" name="mobile" required></div>
            <div class="form-group">
                <label>Gender:</label>
                <select name="gender" required>
                    <option value="" disabled selected>Select</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Others">Others</option>
                </select>
            </div>
            <div class="form-group"><label>Date of Birth:</label><input type="text" name="dob" required></div>
            <div class="form-group"><label>Address:</label><input type="text" name="address" required></div>

            <!-- Professional Info -->
            <div class="form-group"><label>Department:</label><input type="text" name="department" required></div>
            <div class="form-group"><label>Designation:</label><input type="text" name="designation" required></div>
            <div class="form-group"><label>Qualification:</label><input type="text" name="qualification" required></div>
            <div class="form-group"><label>Experience (Years):</label><input type="text" name="experience_years" required></div>
            <div class="form-group"><label>Joining Date:</label><input type="text" name="joining_date" required></div>
            <div class="form-group"><label>Salary:</label><input type="text" step="0.01" name="salary" required></div>

            <!-- Personal Info -->
            <div class="form-group"><label>Religion:</label><input type="text" name="religion"></div>
            <div class="form-group"><label>Mother Tongue:</label><input type="text" name="mother_tongue"></div>
            <div class="form-group"><label>Upload Image:</label><input type="file" name="image"></div>

            <div class="form-group"><input type="submit" value="Register"></div>
        </form>
    </div>

</body>
</html>