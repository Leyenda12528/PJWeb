package org.apache.jsp.Reportes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import net.sf.jasperreports.engine.*;
import java.util.*;
import java.sql.*;
import java.io.*;

public final class reporteInfoCaso_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jproyecto", "root", "");
    File rf = new File(application.getRealPath("/Reportes/report3.jasper"));
    Map parameters = new HashMap();
    String idestado = request.getParameter("estadoc");
    String fecha1 = request.getParameter("fecha1");
    String fecha2 = request.getParameter("fecha2");
    String depto = request.getParameter("depto");
    parameters.put("idestado", idestado);
    parameters.put("fecha1", fecha1);
    parameters.put("fecha2", fecha2);
    parameters.put("depto", depto);
    byte[] bytes = JasperRunManager.runReportToPdf(rf.getPath(), parameters, con);
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream outp = response.getOutputStream();
    outp.write(bytes, 0, bytes.length);
    outp.flush();
    outp.close();



      out.write("\n");
      out.write("\n");
      out.write("\n");
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
