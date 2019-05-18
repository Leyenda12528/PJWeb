<%-- 
    Document   : VERPDF
    Created on : 16-abr-2019, 10:09:05
    Author     : jorge
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="application/pdf; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import= "java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>

<sql:query var="newIDcasoqq" dataSource="jdbc/mysql" scope="request">
    select pdf, pdf_jefe as archivo from pdf_caso where id_caso = ?
    <sql:param value="${param.dip}"/>
</sql:query>
<c:forEach var="new1" items="${newIDcasoqq.rows}">
    <c:out value="${new1}"/>    
    <c:if test="${param.pit == 1}">
        <c:set var="archivo" value="${new1.pdf}"/>        
    </c:if>
    <c:if test="${param.pit == 2}">
        <c:set var="archivo" value="${new1.pdf_jefe}"/>
    </c:if>
</c:forEach>    
<%
    String fileR = "" + pageContext.getAttribute("archivo");
//CODIGO JSP 
        FileInputStream ficheroInput = new FileInputStream("C:\\Users\\jorge\\Desktop\\pdf\\" + fileR);
        int tamanoInput = ficheroInput.available();
        byte[] datosPDF = new byte[tamanoInput];
        ficheroInput.read(datosPDF, 0, tamanoInput);

        response.setHeader("Content-disposition", "inline; filename=" + fileR);
        response.setContentType("application/pdf");
        response.setContentLength(tamanoInput);
        response.getOutputStream().write(datosPDF);
        ficheroInput.close();

%>


