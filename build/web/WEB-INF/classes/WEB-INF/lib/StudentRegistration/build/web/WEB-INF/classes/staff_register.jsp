
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COLLEGE DATA MANAGEMENT</title>
         <link rel="stylesheet" href="css/style.css"/>
    </head>
   
    <body>
         <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a  href="index.jsp">Student Register</a></li>
            <li><a href="student_login.jsp">Student Login</a></li>
            <li><a  href="staff_register.jsp">Staff Register</a></li>
            <li><a href="staf_login.jsp">Staff Login</a></li>            
        </ul>
         <h>STAFF REGISTER</h>
       <form action="staff_register" enctype="multipart/form-data" method="post" onsubmit="return Validate_Data(true)">
 <table>
 <tr>
 <td>First Name</td>
 <td><input type="text" name="first_name"></td>
 </tr>
 <tr>
 <td>Last Name</td>
 <td><input type="text" name="last_name"></td>
 </tr>
 <tr>
 <td>MAIL ID</td>
 <td><input type="text" name="Mail_ID"></td>
 </tr>
 <tr>
 <td>Password</td>
 <td><input type="password" name="password"></td>
 </tr>
 <tr>
 <td>address</td>
 <td><input type="address" name="address"></td>
 </tr>
 <tr>
 <td>image</td>
 <td><input type="file" value="" id="Image" name="Image" required></td>
 </tr>
 <tr>
 <BR>
 </table>
 <td>SUBMIT</td>
 <td><input type="submit" value="REGISTER"></td>
 </tr>
 
 </form>
    </body>
</html>
