<%-- 
    Document   : Plogin
    Created on : 10-abr-2019, 0:35:00
    Author     : jorge
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:useBean id="pru" scope="session" class="Beans.pru"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title>PLogin</title>
    </head>
    <body>
        <%String correo = request.getParameter("correo");%>
        <c:set var="correo" value="${param.correo}"/>
        <c:set var="contra" value="${param.contra}"/>        
        
        <sql:query var="q1" dataSource="jdbc/mysql">
            SELECT id_empleado from empleados where correo = ? and password_emp = sha2(?,256)
            <sql:param value="${correo}"/>
            <sql:param value="${contra}"/>
        </sql:query>
       
        <c:if test="${q1.rowCount < 1}">
            <c:redirect url="Login.jsp">                                                
                 <c:param name="error" value="Usuario/Contraseña Incorrecto"/>
            </c:redirect>
        </c:if>
        <c:forEach var="name" items="${q1.rows}">
            <c:set var="usuari" value="${name.id_empleado}"/>
        </c:forEach>
        <c:set scope="session"
                   var="loginUser"
                   value="${usuari}"/>
        <c:set target="${pru}" property="nombre" value="${correo}"/>
            <c:set target="${pru}" property="apellido" value="${contra}"/>
        <c:redirect url="Menu.jsp"/>             
    </body>
</html>
