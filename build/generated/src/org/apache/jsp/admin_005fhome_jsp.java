package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005fhome_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');

    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("error.jsp");
        return;
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Admin Dashboard</title>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            margin: 0;\n");
      out.write("            font-family: 'Segoe UI', sans-serif;\n");
      out.write("            background: #0d0d0d;\n");
      out.write("            color: #f2f2f2;\n");
      out.write("            background-image: radial-gradient(circle at 20% 20%, #1a1a1a, #000);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Navigation Bar */\n");
      out.write("        .navbar {\n");
      out.write("            background-color: #1c1c1c;\n");
      out.write("            padding: 12px 30px;\n");
      out.write("            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: space-between;\n");
      out.write("            align-items: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .navbar h2 {\n");
      out.write("            color: #e0e0e0;\n");
      out.write("            margin: 0;\n");
      out.write("            letter-spacing: 1px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .nav-links a {\n");
      out.write("            color: #dcdcdc;\n");
      out.write("            text-decoration: none;\n");
      out.write("            margin-left: 30px;\n");
      out.write("            font-size: 16px;\n");
      out.write("            transition: all 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .nav-links a:hover, .nav-links .active {\n");
      out.write("            color: #ffffff;\n");
      out.write("            background: linear-gradient(90deg, #777, #444);\n");
      out.write("            padding: 6px 12px;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            box-shadow: 0 0 10px silver;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Welcome Box */\n");
      out.write("        .welcome-box {\n");
      out.write("            max-width: 700px;\n");
      out.write("            margin: 80px auto 40px;\n");
      out.write("            background-color: #1a1a1a;\n");
      out.write("            padding: 40px;\n");
      out.write("            border-radius: 20px;\n");
      out.write("            text-align: center;\n");
      out.write("            box-shadow: 0 0 20px rgba(192,192,192,0.2), inset 0 0 5px rgba(255,255,255,0.05);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .welcome-box h1 {\n");
      out.write("            font-size: 32px;\n");
      out.write("            color: #fff;\n");
      out.write("            margin-bottom: 15px;\n");
      out.write("            text-shadow: 0 0 8px rgba(255,255,255,0.1);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .welcome-box p {\n");
      out.write("            font-size: 18px;\n");
      out.write("            color: #ccc;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Admin Action Tiles */\n");
      out.write("        .tile-container {\n");
      out.write("            display: flex;\n");
      out.write("            flex-wrap: wrap;\n");
      out.write("            justify-content: center;\n");
      out.write("            gap: 30px;\n");
      out.write("            margin-bottom: 60px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .tile {\n");
      out.write("            background-color: #262626;\n");
      out.write("            padding: 30px 40px;\n");
      out.write("            border-radius: 15px;\n");
      out.write("            text-align: center;\n");
      out.write("            font-size: 16px;\n");
      out.write("            font-weight: bold;\n");
      out.write("            color: #f0f0f0;\n");
      out.write("            text-decoration: none;\n");
      out.write("            box-shadow:\n");
      out.write("                0 4px 10px rgba(0, 0, 0, 0.6),\n");
      out.write("                0 0 15px rgba(255, 255, 255, 0.1);\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .tile:hover {\n");
      out.write("            background: linear-gradient(to right, #3a3a3a, #2a2a2a);\n");
      out.write("            box-shadow: 0 0 12px rgba(255, 255, 255, 0.2);\n");
      out.write("            transform: translateY(-5px);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .footer {\n");
      out.write("            text-align: center;\n");
      out.write("            color: #aaa;\n");
      out.write("            font-size: 13px;\n");
      out.write("            padding-bottom: 30px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div class=\"navbar\">\n");
      out.write("        <h2>Admin Panel</h2>\n");
      out.write("        <div class=\"nav-links\">\n");
      out.write("            <a class=\"active\" href=\"admin_home.jsp\">Dashboard</a>\n");
      out.write("            <a href=\"admin_approve.jsp\">Approve Requests</a>\n");
      out.write("            <a href=\"admin_manage.jsp\">Manage Users</a>\n");
      out.write("            <a href=\"admin_login.jsp\">Logout</a>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"welcome-box\">\n");
      out.write("        <h1>Welcome, Admin! 👑</h1>\n");
      out.write("        <p>You have full control over the portal. Use the options below to manage users and oversee the system.</p>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"tile-container\">\n");
      out.write("        <a class=\"tile\" href=\"admin_approve.jsp\">📥 Approve Student Requests</a>\n");
      out.write("        <a class=\"tile\" href=\"admin_manage.jsp\">👤 Manage Registered Users</a>\n");
      out.write("        <a class=\"tile\" href=\"#\">📊 View Reports</a>\n");
      out.write("        <a class=\"tile\" href=\"#\">📢 Announcements</a>\n");
      out.write("        <a class=\"tile\" href=\"admin_login.jsp\">🚪 Logout</a>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"footer\">\n");
      out.write("        &copy; 2025 Student Portal | Designed for Power ✨\n");
      out.write("    </div>\n");
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
