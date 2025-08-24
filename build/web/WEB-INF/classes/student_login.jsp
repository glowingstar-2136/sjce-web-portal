<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>STUDENT LOGIN PAGE</title>
    <link rel="stylesheet" href="css/style.css"/>

</head>

<body>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="index.jsp">Student Register</a></li>
        <li><a class="active" href="student_login.jsp">Student Login</a></li>
        <li><a href="staff_register.jsp">Staff Register</a></li>
        <li><a href="staf_login.jsp">Staff Login</a></li>            
    </ul>

    <form action="Provider_Login" method="post" onsubmit="return Validate();">
        <center>
            <font face="Georgia" color="#0C6E69"><h2>STUDENT LOGIN PAGE</h2></font><br><br>
            <table border="5">
                <tr>
                    <td><font face="Georgia" color="black">USER MAIL ID :</font></td>
                    <td><input type="text" id="A_Name" name="Mail_ID"></td>
                </tr>
                <tr><td colspan="2"><br></td></tr>
                <tr>
                    <td><font face="Georgia" color="black">PASSWORD :</font></td>
                    <td><input type="password" id="A_Pass" name="password"></td>
                </tr>
            </table>
            <br><br>
            <input type="submit" value="Submit">
        </center>
    </form>
    
     <script>
        function Validate() {
            // Get input values
            var email = document.getElementById("A_Name").value.trim();
            var password = document.getElementById("A_Pass").value;

            // Email format validation
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Password validation
            if (password.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }

            return true; // Validation passed
        }
    </script>
    
</body>
</html>
