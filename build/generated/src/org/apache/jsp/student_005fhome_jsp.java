package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Package.Servlet;
import java.sql.ResultSet;

public final class student_005fhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

    Integer id = (Integer) session.getAttribute("id"); // Note: lowercase 'id' here matches the login servlet
    String mail = (String) session.getAttribute("Mail_ID");

    if (id == null || mail == null) {
        session.setAttribute("msg", "Session expired. Please login again.");
        response.sendRedirect("error.jsp");
        return;
    }

    Servlet db = new Servlet();
    ResultSet userResult = db.select("SELECT * FROM stud_registration WHERE ID='" + id + "' AND MAIL_ID='" + mail + "'");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Student Home</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            background-color: #1a1a1a;\n");
      out.write("            color: #f0f0f0;\n");
      out.write("            font-family: 'Segoe UI', sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        ul {\n");
      out.write("            list-style-type: none;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            background-color: #000;\n");
      out.write("            overflow: hidden;\n");
      out.write("            text-align: center;\n");
      out.write("            box-shadow: 0 2px 10px deeppink;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        li {\n");
      out.write("            display: inline;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        li a {\n");
      out.write("            display: inline-block;\n");
      out.write("            color: white;\n");
      out.write("            padding: 14px 25px;\n");
      out.write("            text-decoration: none;\n");
      out.write("            transition: background 0.3s ease;\n");
      out.write("            border-radius: 5px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        li a:hover, .active {\n");
      out.write("            background-color: deeppink;\n");
      out.write("            box-shadow: 0 0 10px deeppink;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h1 {\n");
      out.write("            text-align: center;\n");
      out.write("            margin-top: 30px;\n");
      out.write("            color: #f8c8dc;\n");
      out.write("            text-shadow: 0 0 10px deeppink;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .info-box {\n");
      out.write("            background-color: #2c2c2c;\n");
      out.write("            width: 50%;\n");
      out.write("            margin: 30px auto;\n");
      out.write("            padding: 25px;\n");
      out.write("            border-radius: 15px;\n");
      out.write("            box-shadow: 0 0 15px deeppink;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .info-box p {\n");
      out.write("            font-size: 18px;\n");
      out.write("            color: #ffb6c1;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <ul>\n");
      out.write("        <li><a class=\"active\" href=\"student_home.jsp\">Home</a></li>\n");
      out.write("        <li><a href=\"index.html\">Register</a></li>\n");
      out.write("        <li><a href=\"student_log.jsp\">Logout</a></li>\n");
      out.write("    </ul>\n");
      out.write("\n");
      out.write("    ");

        if (userResult.next()) {
    
      out.write("\n");
      out.write("    <h1>Welcome, ");
      out.print( userResult.getString("NAME") );
      out.write("! 💖</h1>\n");
      out.write("\n");
      out.write("    <div class=\"info-box\">\n");
      out.write("        <p><strong>Mail ID:</strong> ");
      out.print( userResult.getString("MAIL_ID") );
      out.write("</p>\n");
      out.write("        <p><strong>Department:</strong> ");
      out.print( userResult.getString("DEPARTMENT") );
      out.write("</p>\n");
      out.write("        <p><strong>College:</strong> ");
      out.print( userResult.getString("COLLEGE") );
      out.write("</p>\n");
      out.write("        <p><strong>Year:</strong> ");
      out.print( userResult.getString("YEAR") );
      out.write("</p>\n");
      out.write("    </div>\n");
      out.write("    ");

        } else {
            session.setAttribute("msg", "Invalid session details. Please login.");
            response.sendRedirect("error.jsp");
        }
        db.close();
    
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
