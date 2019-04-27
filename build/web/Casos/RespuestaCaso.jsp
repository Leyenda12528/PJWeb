<%-- 
    Document   : RespuestaCaso
    Created on : 27-abr-2019, 5:40:50
    Author     : jorge
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<c:set var="usuario" value="${sessionScope['loginUser']}"/>
<c:if test="${empty usuario}">
    <c:redirect url="../Login.jsp">
        <c:param name="error" value="2"/>
    </c:redirect>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico" />
        <title><fmt:message key="label.respuestap"/></title>
    </head>
    <body id="page-top">         
        <div id="wrapper">
            <jsp:include page="../Controlador/Casos.jsp"/>
            <jsp:include page="/Menu_1_1.jsp"/>
            <div class="container-fluid">
                
            </div>        
    </body>
</html>
