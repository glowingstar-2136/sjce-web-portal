<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>STUDENT FORM</title>
    <link rel="stylesheet" href="css/style.css"/>

</head>
<body>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a class="active" href="index.jsp">Student Register</a></li>
        <li><a href="student_login.jsp">Student Login</a></li>
        <li><a href="staff_register.jsp">Staff Register</a></li>
        <li><a href="staf_login.jsp">Staff Login</a></li>
    </ul>

    <form action="register" enctype="multipart/form-data" method="post" class="form-container" onsubmit="return Validate_Data(true)">

        <div class="form-group">
            <label for="first_name">First Name</label>
            <input type="text" name="first_name" id="first_name" oninput="handleInput('first_name')">
        </div>

        <div class="form-group">
            <label for="last_name">Last Name</label>
            <input type="text" name="last_name" id="last_name" oninput="handleInput('last_name')">
        </div>

        <div class="form-group">
            <label for="Mail_ID">Mail ID</label>
            <input type="text" name="Mail_ID" id="Mail_ID" oninput="handleInput('Mail_ID')">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" oninput="handleInput('password')">
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" name="address" id="address" oninput="handleInput('address')">
        </div>

        <div class="form-group">
            <label for="Image">Upload Image</label>
            <input type="file" name="Image" id="Image" onchange="handleInput('Image')" required>
        </div>

        <div class="form-group">
            <input type="submit" value="REGISTER">
        </div>

    </form>
       <script>
  function Validate_Data() {
        // Police Station Name Validation
        var first_name = document.getElementById("first_name").value.trim();
        if (!first_name.match(/^[a-zA-Z\s]+$/)) {
            alert("First Name should contain only letters and spaces");
            return false;
              }
        
        var last_name = document.getElementById("last_name").value.trim();
        if (!last_name.match(/^[a-zA-Z\s]+$/)) {
            alert("Last Name should contain only letters and spaces");
            return false;
              }
        
        // Email Validation
        var email = document.getElementById("Mail_ID").value.trim();
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!emailPattern.test(email)) {
            alert("Invalid email format");
            return false;
        }
        
        // Password Validation
        var password = document.getElementById("password").value;
        if (password.length < 6) {
            alert("Password must be at least 6 characters long");
            return false;
        }
        
        
        // Address Validation
        var address = document.getElementById("address").value.trim();
        if (!address.match(/^[a-zA-Z\s]+$/)) {
            alert("Address should contain only letters and spaces");
            return false;
        }
        
      
        // Image Upload Validation
        var image = document.getElementById("Image").value;
        if (image === "") {
            alert("Please upload an image");
            return false;
        }
        
      
        return true; 
        }
    
</script>
</body>
</html>
