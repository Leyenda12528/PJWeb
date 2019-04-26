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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("         <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\r\n");
      out.write("          <title>Bitacora</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("                       \r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <h3>Bitacora</h3>\r\n");
      out.write("            <p>\r\n");
      out.write("            <h5></h5>\r\n");
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
      out.write("                        <span class=\"\"></span><strong>");
      if (_jspx_meth_fmt_message_0(_jspx_page_context))
        return;
      out.write(" </strong>");
      out.write("\r\n");
      out.write("                        <br/><span class=\"\"></span><strong>");
      if (_jspx_meth_fmt_message_1(_jspx_page_context))
        return;
      out.write(" </strong>  ");
      out.write("\r\n");
      out.write("                        <div class=\"input-group\">\r\n");
      out.write("                            <input size=\"500\" type=\"text\" class=\"form-control\" name=\"nombre_caso\" id=\"nombre_caso\" placeholder=\"\" required>\r\n");
      out.write("                            <span  class=\"help-block\" ></span>  \r\n");
      out.write("\r\n");
      out.write("                        </div> \r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                     <div class=\"form-group\">\r\n");
      out.write("                         <span class=\"glyphicon glyphicon-asterisk\"></span><strong>");
      if (_jspx_meth_fmt_message_2(_jspx_page_context))
        return;
      out.write("</strong>\r\n");
      out.write("                        <div class=\"input-group\">\r\n");
      out.write("                            <textarea class=\"form-control\" rows=\"15\" cols=\"50\" name=\"descripcion_act\" id=\"descripcion_act\"></textarea>\r\n");
      out.write("                             <span  class=\"help-block\" ></span>  \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <span class=\"help-block\" ></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                     <div class=\"form-group\">\r\n");
      out.write("                         <span class=\"glyphicon glyphicon-asterisk\"></span><strong>");
      if (_jspx_meth_fmt_message_3(_jspx_page_context))
        return;
      out.write("</strong>\r\n");
      out.write("                        <div class=\"input-group\">\r\n");
      out.write("                            <textarea class=\"form-control\" rows=\"15\" cols=\"50\" name=\"Observaciones\" id=\"Observaciones\"></textarea>\r\n");
      out.write("                             <span  class=\"help-block\" ></span>  \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <span class=\"help-block\" ></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                    <input type=\"submit\" class=\"btn btn-info\" value=\"");
      if (_jspx_meth_fmt_message_4(_jspx_page_context))
        return;
      out.write("\" id=\"btnGuardar\" name=\"btnGuardar\" >\r\n");
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

  private boolean _jspx_meth_fmt_message_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_message_2 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _jspx_tagPool_fmt_message_key_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_message_2.setPageContext(_jspx_page_context);
    _jspx_th_fmt_message_2.setParent(null);
    _jspx_th_fmt_message_2.setKey("label.actividad");
    int _jspx_eval_fmt_message_2 = _jspx_th_fmt_message_2.doStartTag();
    if (_jspx_th_fmt_message_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_2);
      return true;
    }
    _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_2);
    return false;
  }

  private boolean _jspx_meth_fmt_message_3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_message_3 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _jspx_tagPool_fmt_message_key_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_message_3.setPageContext(_jspx_page_context);
    _jspx_th_fmt_message_3.setParent(null);
    _jspx_th_fmt_message_3.setKey("label.observaciones");
    int _jspx_eval_fmt_message_3 = _jspx_th_fmt_message_3.doStartTag();
    if (_jspx_th_fmt_message_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_3);
      return true;
    }
    _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_3);
    return false;
  }

  private boolean _jspx_meth_fmt_message_4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_message_4 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _jspx_tagPool_fmt_message_key_nobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_message_4.setPageContext(_jspx_page_context);
    _jspx_th_fmt_message_4.setParent(null);
    _jspx_th_fmt_message_4.setKey("label.guardar");
    int _jspx_eval_fmt_message_4 = _jspx_th_fmt_message_4.doStartTag();
    if (_jspx_th_fmt_message_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_4);
      return true;
    }
    _jspx_tagPool_fmt_message_key_nobody.reuse(_jspx_th_fmt_message_4);
    return false;
  }
}
