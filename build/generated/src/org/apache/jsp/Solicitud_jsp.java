package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Solicitud_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("         <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\r\n");
      out.write("         \r\n");
      out.write("        <title>Solicitud</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("                   \r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <h3>Solicitar caso</h3>\r\n");
      out.write("            <p>\r\n");
      out.write("          \r\n");
      out.write("       \r\n");
      out.write("        \r\n");
      out.write("    </div> \r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <h3></h3>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"row col-md-5\">\r\n");
      out.write("            <form role=\"form\" action=\"\"  method=\"POST\" id=\"needs-validation\" > ");
      out.write("\r\n");
      out.write("                <div class=\"col-md-10\">\r\n");
      out.write("                    <div class=\"well well-sm\"><strong><span class=\"glyphicon glyphicon-asterisk\"></span>Campos requeridos</strong></div>\r\n");
      out.write("                    <div  class=\"form-group\">\r\n");
      out.write("                        <label for=\"nombre\" ><span class=\"glyphicon glyphicon-asterisk\"></span>Código caso:</label>\r\n");
      out.write("                        <div class=\"input-group\">\r\n");
      out.write("                            <input size=\"500\" type=\"text\" class=\"form-control\" name=\"id_caso\" id=\"id_caso\" placeholder=\"\" required>\r\n");
      out.write("                            <span  class=\"help-block\" ></span>  \r\n");
      out.write("\r\n");
      out.write("                        </div> \r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"descripcion\"><span class=\"glyphicon glyphicon-asterisk\"></span>Descrpción:</label>\r\n");
      out.write("                        <div class=\"input-group\">\r\n");
      out.write("                            <textarea class=\"form-control\" rows=\"15\" cols=\"50\" name=\"descripcion\" id=\"descripcion\"></textarea>\r\n");
      out.write("                             <span  class=\"help-block\" ></span>  \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <span class=\"help-block\" ></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                    <input type=\"submit\" class=\"btn btn-info\" value=\"Guardar\" id=\"btnGuardar\" name=\"btnGuardar\" >\r\n");
      out.write("                    \r\n");
      out.write("                    <input type=\"submit\" class=\"btn btn-danger\" value=\"Cargar PDF\" id=\"btnGuardar\" name=\"btnPDF\" >\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("\r\n");
      out.write("            ");
      out.write("\r\n");
      out.write("            ");
if (request.getParameter("resultado") != null) {
            
      out.write("\r\n");
      out.write("            <div class=\"alert alert-success col-md-10\">\r\n");
      out.write("                <b>");
      out.print(request.getParameter("resultado"));
      out.write("</b>\r\n");
      out.write("            </div>\r\n");
      out.write("            ");

                }
            
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!--notese el uso de jsp:include -->\r\n");
      out.write("     \r\n");
      out.write("    </div>\r\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("    <script src=\"assets/jquery-3.3.1.min.js\"></script>\r\n");
      out.write("    <script src=\"assets/validacion.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
