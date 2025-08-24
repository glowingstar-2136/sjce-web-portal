<%@page import="java.sql.ResultSet"%>
<%@page import="Connection.DbConnection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>INNOVATIVE RESIDENCE</title>
    </head>
     <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('images/bg.jpg'); /* Replace with your image path */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
        }

        h4 {
            margin-top: 30px;
            font-size: 24px;
            color: #1e1c1d;
            text-shadow: 1px 1px 3px black;
        }

        table {
            background-color: rgba(0, 0, 0, 0.7);
            border-collapse: collapse;
            width: 90%;
            color: #ffffff;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ffffff;
            text-align: center;
        }

        th {
            background-color: #333333;
        }

        img {
            border-radius: 8px;
        }
    </style>
    
    <body>
          <%
            Integer id = (Integer) session.getAttribute("id");
            String name = (String) session.getAttribute("Mail_ID");

            if (id != null && name != null) {
                try {
                    DbConnection db = new DbConnection();
                    ResultSet userResult = db.Select("SELECT * FROM student_register WHERE id='" + id + "' AND Mail_ID='" + name + "'");
                    if (userResult.next()) {
                 

        %>
      
        <%
            
            DbConnection db1 = new DbConnection();
            ResultSet ts = db1.Select("Select * from student_register  WHERE id='" + id + "' AND Mail_ID='" + name + "'");
             

        %>		

     
        
    <center>
        <br><h4>STUDENT DETAILS</h4><br>
        <br><table border="5">

            <tr><th>S_NO</th><th>FIRST NAME</th><th>LAST NAME</th><th>ADDRESS</th><th>MAIL ID</th><th>IMAGE</th></tr>                                       
                    <%                                              
                        while (ts.next()) {
                    %>
            <tr>
                <td><%=ts.getInt("id")%></td>
                <td><%=ts.getString("first_name")%></td>
                <td><%=ts.getString("last_name")%></td>
                <td><%=ts.getString("address")%></td>
                <td><%=ts.getString("Mail_ID")%></td>
                <td><img src="servlet_1.jsp?id=<%=ts.getInt("id")%> " style="width: 250px; height: 120px;"></td> 
            </tr>
            
            
            <%
                }
            %>
                <%                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            } else {
                session.setAttribute("msg", "Session Out Please Login");
                response.sendRedirect("error.jsp");
            }
        %>
        </table>
    </center>
</body>
</html>
