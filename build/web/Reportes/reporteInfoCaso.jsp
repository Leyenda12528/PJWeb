<%-- 
    Document   : reporteInfoCaso
    Created on : 05-17-2019, 11:42:59 AM
    Author     : less_
--%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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


%>


