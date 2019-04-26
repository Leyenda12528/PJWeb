<%-- 
    Document   : prueba
    Created on : 10-abr-2019, 15:24:14
    Author     : jorge
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="pru" scope="session" class="Beans.pru"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/prueba.css">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title>Login</title>
        <title>Probar Session</title>
    </head>
    <body>
        
        <c:set var="prueba" value="${param.id}"/>
        <%
            request.setAttribute("prueba", "dato de prueba");
        %>
        <c:set var="usuario" value="${sessionScope['loginUser']}"/>
        <c:if test="${empty usuario}">
            <c:redirect url="Login.jsp">
                <c:param name="error" value="Session :C"/>
            </c:redirect>
        </c:if>
        <h1>Hello World!</h1>
        <h1>Hello World!</h1>
        <a href="PP.jsp">Probando Session</a>
        <hr>
        <label><c:out value="${pru.nombre} dd"/></label><br/>
                    <label><c:out value="${pru.apellido}"/></label>
        <hr>
        <a class="nav-link" href="#" onclick="index.html">
                    <i class="fas fa-sitemap"></i>
                    <span>Distribución</span></a>
        <h1>Hello World!</h1>
        <p><fmt:message key="label.usuario"/> <strong><c:out value="${usuario}"/></strong></p>        
        <input type="text" value="${prueba}"/>
        <img src="Imas/prueba.jpg">
    </body>
</html>
