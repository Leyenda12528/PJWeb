<%-- 
    Document   : ProcesarSoliPDF
    Created on : 21-abr-2019, 15:19:56
    Author     : jorge
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@page language="java" import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="Beans.Correo"%>
<%@page import="Beans.Controlador"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="Consultas.jsp"/>
<c:forEach var="cDestinofor" items="${q7.rows}">
    <c:set var="cDestino"  value="${cDestinofor.correo}"/>
</c:forEach>

<c:set var="id_caso" value=""/>
<c:set var="nombre_caso" value=""/>
<c:set var="descrip_caso" value=""/>
<c:set var="pdfJF" value=""/>
<c:set var="correo" value="${loginB.correo}"/>
<c:set var="contraP" value="${loginB.contraP}"/>
<c:set var="id_cargo" value="${loginB.id_cargo}"/>


<%
    String correo = "" + pageContext.getAttribute("correo");
    String contraP = "" + pageContext.getAttribute("contraP");
    String cDestino = "" + pageContext.getAttribute("cDestino");    
    String asunto = "", mjs = "";

    String id = "", nombre = "", descrip = "", pdfJF = "";

    String ruta = "C:\\Users\\jorge\\Desktop\\pdf";
    FileItemFactory fileFactory = new DiskFileItemFactory();
    ServletFileUpload servlet_ip = new ServletFileUpload(fileFactory);
    try {
        List items = servlet_ip.parseRequest(request);
        for (Object item : items) {
            FileItem uploaded = (FileItem) item;
            if (uploaded.isFormField()) {
                if (uploaded.getFieldName().equals("id_caso")) {
                    id = uploaded.getString();
                }
                if (uploaded.getFieldName().equals("nombre_caso")) {
                    nombre = uploaded.getString();
                }
                if (uploaded.getFieldName().equals("descripcion_caso")) {
                    descrip = uploaded.getString();
                }
            } else {
                if (uploaded.getName().length() > 0) {
                    int numero = new File(ruta).list().length + 1;
                    String nombreFile = String.valueOf(numero) + uploaded.getName();
                    File fichero = new File(ruta, nombreFile);
                    uploaded.write(fichero);
                    pdfJF = nombreFile;
                } else {
                    pdfJF = "";
                }
            }
        }
        asunto = "Solicitud de Caso " + id;
        mjs = "Saludos\n Envio una solicitud de un nuevo caso, con los siguiente detalles:\n\n\t" + descrip;
        Controlador control = new Controlador();
        Correo c = new Correo();
        c.setCorreoUser(correo);
        c.setContra(contraP);
        c.setCorreoDestino(cDestino);
        c.setAsunto(asunto);
        c.setMensaje(mjs);
        if (pdfJF.length() >0)
        {
            c.setNombreArchivo(pdfJF);
            c.setRutaArchivo("C:/Users/jorge/Desktop/pdf/" + pdfJF);
        }
        control.enviar(c);

        pageContext.setAttribute("id_caso", id);
        pageContext.setAttribute("nombre_caso", nombre);
        pageContext.setAttribute("descrip_caso", descrip);
        pageContext.setAttribute("pdfJF", pdfJF);

    } catch (Exception e) {
        out.print("" + e.getMessage());
    }
%>

<sql:update var="NewCasoq" dataSource="jdbc/mysql" scope="request">
    insert into caso values (?, ?, ?, ?, ?, 1, 0, ?, ?, CURRENT_DATE);
    <sql:param value="${id_caso}"/>
    <sql:param value="${nombre_caso}"/>
    <sql:param value="${descrip_caso}"/>
    <sql:param value=""/>
    <sql:param value=""/>
    <sql:param value=""/>
    <sql:param value=""/>
</sql:update>
<sql:update var="NewCasoq" dataSource="jdbc/mysql" scope="request">
    insert into pdf_caso values (?, ?, ?);
    <sql:param value="${id_caso}"/>
    <sql:param value="${pdfJF}"/>
    <sql:param value=""/>
</sql:update>
<c:redirect url="../Solicitud.jsp">
    <c:param name="exito" value="1"/>
</c:redirect>
<%--    
<form action="${pageContext.request.contextPath}/prueba2/VERPDF.jsp" method="post" target="_blank">
<input type="submit" value="VER">
</form>
--%>


