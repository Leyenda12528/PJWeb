<%-- 
    Document   : Casos
    Created on : 21-abr-2019, 22:45:40
    Author     : jorge
--%> 
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <%-- NUEVO ID DEL CASO --%>
    <c:set var="area" value="${fn:substring(loginB.departamento,0,3)}"/>
    <sql:query var="newIDcasoq" dataSource="jdbc/mysql" scope="request">
         select count(*) as dato from caso where id_caso like ?
        <sql:param value="${area}%"/>
    </sql:query>
    <c:forEach var="newIDcasofor" items="${newIDcasoq.rows}">
         <c:set var="correlativo" value="${newIDcasofor.dato}"/>
    </c:forEach>
    <%
        String cor = "" + pageContext.getAttribute("correlativo");
        String fec = new SimpleDateFormat("yy").format(new Date());
        int cor2 = Integer.parseInt(cor) + 1;
        cor = "" + cor2;
        while (cor.length() < 3)
        cor = "0" + cor;
        cor = fec + cor;
        pageContext.setAttribute("correlativo", cor);
    %>
    <c:set var="NewIdCaso" value="${area}${correlativo}" scope="request"/>

    
<%-- VER casos solicitados--%>    
    <sql:query var="solipq" dataSource="jdbc/mysql" scope="request">
        SELECT  caso.id_caso, caso.nombre_caso, pdf_caso.pdf
        FROM    caso INNER JOIN pdf_caso ON caso.id_caso = pdf_caso.id_caso
        WHERE   (caso.id_estado = 1) AND (caso.id_caso LIKE ?)
        <sql:param value="${area}%"/>
    </sql:query>
        
<%--Aceptando caso--%>
        <c:if test="${not empty param.aceptarC}">
            <sql:update var="aceptarcq" dataSource="jdbc/mysql" scope="request">
                update caso set id_estado = 3 where id_caso = ?
                <sql:param value="${param.aceptarC}"/>
            </sql:update>
        </c:if>
                
<%--Rechazando caso--%>
        <c:if test="${not empty param.aceptarC}">
            <sql:update var="aceptarcq" dataSource="jdbc/mysql" scope="request">
                update caso set id_estado = 3 where id_caso = ?
                <sql:param value="${param.aceptarC}"/>
            </sql:update>
        </c:if>                