<%-- 
    Document   : Plogin
    Created on : 10-abr-2019, 0:35:00
    Author     : jorge
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="correo" value="${param.correo}"/>
        <c:set var="contra" value="${param.contra}"/>
        <c:set var="error" value="login first"/>
        
        <sql:query var="q1" dataSource="jdbc/mysql">
            SELECT nombre_emp from empleados where correo = ? and password_emp = sha2(?,256)
            <sql:param value="${correo}"/>
            <sql:param value="${contra}"/>
        </sql:query>
       
        <c:if test="${q1.rowCount < 1}">
            <c:redirect url="index.jsp">                
                <c:param name="error" value="${error}"/>
            </c:redirect>
        </c:if>
            <div class="container">
                <div class="panel-primary">
                    <div class="panel-heading">
                        <c:forEach var="name" items="${q1.rows}">
                            Bienvenido:<c:out value="${name.nombre_emp}"/>
                        </c:forEach>
                         Bienvenido: <c:out value="${q1.rows.nombre_emp}"/>           <%--             --%>
                    </div>
                    <div class="panel-body"></div>
                </div>
            </div>
    </body>
</html>
