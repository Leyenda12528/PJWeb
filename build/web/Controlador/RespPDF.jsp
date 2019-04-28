<%-- 
    Document   : RespPDF
    Created on : 27-abr-2019, 22:17:14
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

<jsp:include page="Consultas.jsp"/>
<c:forEach var="cDestinofor" items="${q8.rows}">
    <c:set var="cDestino"  value="${cDestinofor.correo}"/>
</c:forEach>

<c:set var="id_caso" value=""/>
<c:set var="descripcion" value=""/>
<c:set var="tipo" value=""/>

<c:set var="correo" value="${loginB.correo}"/>
<c:set var="contraP" value="${loginB.contraP}"/>
<c:set var="pdfJD" value=""/>

<%
    String correo = "" + pageContext.getAttribute("correo");
    String contraP = "" + pageContext.getAttribute("contraP");
    String cDestino = "" + pageContext.getAttribute("cDestino");
    String asunto = "", mjs = "", descripcion = "", id = "", pdfJD = "", tipo = "";

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
                if (uploaded.getFieldName().equals("descripcion")) {
                    descripcion = uploaded.getString();
                }
                if (uploaded.getFieldName().equals("tipo")) {
                    tipo = uploaded.getString();
                }
            } else {
                if (uploaded.getName().length() > 0) {
                    int numero = new File(ruta).list().length + 1;
                    String nombreFile = String.valueOf(numero) + uploaded.getName();
                    File fichero = new File(ruta, nombreFile);
                    uploaded.write(fichero);
                    pdfJD = nombreFile;
                } else {
                    pdfJD = "";
                }
            }
        }
        asunto = "Respuesta a Solicitud Caso " + id;
        if(tipo.equals("1")) mjs ="Saludos.\nFelicidades su caso ha sido aceptado.\n Con las siguientes observaciones:\n\n\t " + descripcion;
        else mjs = "Saludos.\n Lastimosamente su caso no ha sido aceptado por las siguientes razones:\n\n\t " + descripcion;
        Controlador control = new Controlador();
        Correo c = new Correo();
        c.setCorreoUser(correo);
        c.setContra(contraP);
        c.setCorreoDestino(cDestino);
        c.setAsunto(asunto);
        c.setMensaje(mjs);
        if (pdfJD.length() > 0) {
            c.setNombreArchivo(pdfJD);
            c.setRutaArchivo("C:/Users/jorge/Desktop/pdf/" + pdfJD);
        }
        control.enviar(c);

        pageContext.setAttribute("id_caso", id);
        pageContext.setAttribute("tipo", tipo);
        pageContext.setAttribute("descripcion", descripcion);
        pageContext.setAttribute("pdfJD", pdfJD);

    } catch (Exception e) {
        out.print("" + e.getMessage());
    }
%>

<%-- Aceptando caso--%>
<c:if test="${tipo == 1}">
    <sql:update var="ac" dataSource="jdbc/mysql" scope="request">
        update caso set id_estado = 3, descripcion_jefedes = ? where id_caso = ?
        <sql:param value="${descripcion}"/>
        <sql:param value="${id_caso}"/>
    </sql:update>
    <sql:update var="ac2" dataSource="jdbc/mysql" scope="request">
        update pdf_caso set pdf_jefe = ? where id_caso = ?
        <sql:param value="${pdfJD}"/>
        <sql:param value="${id_caso}"/>
    </sql:update>
</c:if>

<%-- Rechazando caso--%>
<c:if test="${tipo == 2}">
    <sql:update var="rc" dataSource="jdbc/mysql" scope="request">
        update caso set id_estado = 2, descrip_rechazo = ? where id_caso = ?
        <sql:param value="${descripcion}"/>
        <sql:param value="${id_caso}"/>
    </sql:update>
</c:if>
<c:redirect url="../Casos/SolicitudP.jsp">
    <c:param name="exito" value="1"/>
</c:redirect>
