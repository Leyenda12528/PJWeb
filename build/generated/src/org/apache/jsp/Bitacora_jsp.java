package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Bitacora_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_fmt_message_key_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_fmt_message_key_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_fmt_message_key_nobody.release();
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("         <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("          <title>Bitacora</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("                       \n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h3>Bitacora</h3>\n");
      out.write("            <p>\n");
      out.write("            <h5></h5>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("    </div> \n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <h3></h3>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row col-md-5\">\n");
      out.write("            <form role=\"form\" action=\"\"  method=\"POST\" id=\"needs-validation\" > ");
      out.write("\n");
      out.write("                <div class=\"col-md-10\">\n");
      out.write("                    <div class=\"well well-sm\"><strong><span class=\"glyphicon glyphicon-asterisk\"></span>Campos requeridos</strong></div>\n");
      out.write("                    <div  class=\"form-group\">\n");
      out.write("                        <span class=\"\"></span>");
      if (_jspx_meth_fmt_message_0(_jspx_page_context))
        return;
      out.write(' ');
      out.write("\n");
      out.write("                        <br/><span class=\"\"></span>");
      if (_jspx_meth_fmt_message_1(_jspx_page_context))
        return;
      out.write("   ");
      out.write("\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input size=\"500\" type=\"text\" class=\"form-control\" name=\"nombre_caso\" id=\"nombre_caso\" placeholder=\"\" required>\n");
      out.write("                            <span  class=\"help-block\" ></span>  \n");
      out.write("\n");
      out.write("                        </div> \n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                     <div class=\"form-group\">\n");
      out.write("                        <label for=\"descripcion\"><span class=\"glyphicon glyphicon-asterisk\"></span>Descrpción Actividad:</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <textarea class=\"form-control\" rows=\"15\" cols=\"50\" name=\"descripcion_act\" id=\"descripcion_act\"></textarea>\n");
      out.write("                             <span  class=\"help-block\" ></span>  \n");
      out.write("                        </div>\n");
      out.write("                        <span class=\"help-block\" ></span>\n");
      out.write("                    </div>\n");
      out.write("                     <div class=\"form-group\">\n");
      out.write("                        <label for=\"descripcion\"><span class=\"glyphicon glyphicon-asterisk\"></span>Observaciones:</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <textarea class=\"form-control\" rows=\"15\" cols=\"50\" name=\"Observaciones\" id=\"Observaciones\"></textarea>\n");
      out.write("                             <span  class=\"help-block\" ></span>  \n");
      out.write("                        </div>\n");
      out.write("                        <span class=\"help-block\" ></span>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"direccion\"><span class=\"glyphicon glyphicon-asterisk\"></span>Dirección:</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input type=\"text\" size=\"500\"  class=\"form-control\" id=\"direccion\" name=\"direccion\" placeholder=\"Ingrese su dirección\" required>\n");
      out.write("                           <span  class=\"help-block\" ></span>  \n");
      out.write("                        </div>\n");
      out.write("                      \n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"telefono\"><span class=\"glyphicon glyphicon-asterisk\"></span>Telefono:</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input type=\"text\" size=\"500\" class=\"form-control\" id=\"telefono\" name=\"telefono\" placeholder=\"Ingresa el telefono\" required>\n");
      out.write("                            <span  class=\"help-block\" ></span>  \n");
      out.write("                        </div>\n");
      out.write("                       \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"correo\"><span class=\"glyphicon glyphicon-asterisk\"></span> Correo:</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input type=\"text\" size=\"500\" class=\"form-control\" id=\"email\" name=\"email\" placeholder=\"Ingrese su e-mail\" required >\n");
      out.write("                           <span class=\"help-block\"></span>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"password\"><span class=\"glyphicon glyphicon-asterisk\"></span>Contraseña:</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input type=\"password\" size=\"500\"  class=\"form-control\" id=\"password\" name=\"password\" placeholder=\"Ingrese su contraseña\" required >\n");
      out.write("                             <span class=\"help-block\" id=\"error\"></span>\n");
      out.write("                        </div>\n");
      out.write("                     \n");
      out.write("                    </div>\n");
      out.write("                    <input type=\"submit\" class=\"btn btn-info\" value=\"Guardar\" id=\"btnGuardar\" name=\"btnGuardar\" >\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");
if (request.getParameter("resultado") != null) {
            
      out.write("\n");
      out.write("            <div class=\"alert alert-success col-md-10\">\n");
      out.write("                <b>");
      out.print(request.getParameter("resultado"));
      out.write("</b>\n");
      out.write("            </div>\n");
      out.write("            ");

                }
            
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!--notese el uso de jsp:include -->\n");
      out.write("     \n");
      out.write("    </div>\n");
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

  private boolean _jspx_meth_fmt_message_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_message_0 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _jspx_tagPool_fmt_message_key_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_message_0.setPageContext(_jspx_page_context);
    _jspx_th_fmt_message_0.setParent(null);
    _jspx_th_fmt_message_0.setKey("label.idcaso");
    int _jspx_eval_fmt_message_0 = _jspx_th_fmt_message_0.doStartTag();
    if (_jspx_th_fmt_message_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_0);
      return true;
    }
    _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_0);
    return false;
  }

  private boolean _jspx_meth_fmt_message_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_message_1 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _jspx_tagPool_fmt_message_key_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_message_1.setPageContext(_jspx_page_context);
    _jspx_th_fmt_message_1.setParent(null);
    _jspx_th_fmt_message_1.setKey("label.nombrecaso");
    int _jspx_eval_fmt_message_1 = _jspx_th_fmt_message_1.doStartTag();
    if (_jspx_th_fmt_message_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_1);
      return true;
    }
    _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_1);
    return false;
  }
}
