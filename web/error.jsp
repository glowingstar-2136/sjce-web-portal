<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // JUST SHOW THE ERROR MESSAGE - NO REDIRECT LOGIC HERE
    String msg = (String) session.getAttribute("msg");
    session.removeAttribute("msg"); // Clear after displaying
%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            padding: 50px; 
        }
        h1 { color: #ff0000; }
    </style>
</head>
<body>
    <h1>Login Failed</h1>
    <p><%= msg != null ? msg : "Invalid username or password" %></p>
    <a href="student_log.jsp">Try Again</a>
</body>
</html>