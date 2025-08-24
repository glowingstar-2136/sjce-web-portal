<%-- 
    Document   : student_login
    Created on : 8 Dec, 2022, 11:37:16 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="staff_login" method="post" onsubmit="return AdminValidate();">
                                  <center> <font face="Georgia" color="#0C6E69"> <h2>STUDENT LOGIN PAGE</h2></font> <br><br>
                                  <br><table border="5">
                                          
                    <tr><td> <font face="Georgia" color="black"> USER MAIL ID :</td><td><input type="text" value="" id="A_Name" name="Mail_ID" onkeypress="return  number(event)"></td></tr>
                    <tr></tr><tr></tr>
                    <tr><td><font face="Georgia" color="black">PASSWORD :</td><td><input type="password" value="" id="A_Pass" name="password"></td></tr>
                   
                    </table>
                                      <br><br>
                                      <input type="submit" value="Submit"></center>
                                        </form>
    </body>
</html>
