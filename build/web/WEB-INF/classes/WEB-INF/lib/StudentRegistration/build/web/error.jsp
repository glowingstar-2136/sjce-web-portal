<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Oops! Something Went Wrong 💔</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #1a1a1a;
            color: #f8c8dc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            text-align: center;
            animation: glowIn 1s ease-out forwards;
        }

        h1 {
            font-size: 50px;
            margin-bottom: 20px;
            text-shadow: 0 0 15px deeppink;
            color: #ff69b4;
        }

        p {
            font-size: 20px;
            margin-bottom: 30px;
            color: #ffb6c1;
            text-shadow: 0 0 8px deeppink;
        }

        a {
            text-decoration: none;
            padding: 12px 25px;
            background-color: deeppink;
            color: white;
            font-size: 18px;
            border-radius: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 0 10px deeppink;
        }

        a:hover {
            background-color: #ff69b4;
            box-shadow: 0 0 20px #ff69b4;
        }

        @keyframes glowIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>

    <h1>Oops... 💔</h1>
    <p><%= session.getAttribute("msg") != null ? session.getAttribute("msg") : "Something went wrong." %></p>
    
    <a href="student_log.jsp">Back to Login</a>

</body>
</html>
