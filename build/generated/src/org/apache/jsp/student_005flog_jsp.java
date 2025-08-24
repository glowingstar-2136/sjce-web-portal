package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class student_005flog_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>STUDENT LOGIN PAGE</title>\n");
      out.write("        <link rel =\"stylesheet\" href=\"css/style.css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"index.html\">Home</a></li>\n");
      out.write("            <li><a href=\"index.html\">Student Register</a></li>\n");
      out.write("            <li><a class = \"active\" href=\"student_log.jsp\">Student Login</a></li>\n");
      out.write("            <li><a href = \"staff_register.jsp\">Staff Register</a></li>\n");
      out.write("            <li><a href =\"staff_login.jsp\">Staff Login</a></li>\n");
      out.write("        </ul>\n");
      out.write("        \n");
      out.write("        <form action=\"Provider_Log\" method=\"post\" onsubmit=\"return Validate();\">\n");
      out.write("            <center>\n");
      out.write("                <font face=\"Georgia\" color=\"#0C6E69\"><h2>STUDENT LOGIN PAGE</h2></font><br><br>\n");
      out.write("                <table border =\"5\">\n");
      out.write("                    <tr>\n");
      out.write("                        <td><font face = \"Georgia\" color=\"black\">USER MAIL ID: </font></td>\n");
      out.write("                        <td><input type=\"text\" id=\"A_Name\" name=\"Mail_ID\"></td>\n");
      out.write("                    <tr>\n");
      out.write("                    <tr><td colspan=\"2\"><br></td></tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><font face = \"Georgia\" color=\"black\">PASSWORD:</font></td>\n");
      out.write("                        <td><input type=\"password\" id=\"A_Pass\" name=\"password\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("                <br><br>\n");
      out.write("                <input type =\"submit\" value=\"Submit\">\n");
      out.write("            </center>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
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
