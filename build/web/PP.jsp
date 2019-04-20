<%-- 
    Document   : PP
    Created on : 20-abr-2019, 10:13:23
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="usuario" value="${sessionScope['loginUser']}"/>
    <c:if test="${empty usuario}">
            <c:redirect url="Login.jsp">
                <c:param name="error" value="Session :C"/>
            </c:redirect>
        </c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body id="page-top">         
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" /> 
            <div class="container-fluid">
                <h1>Hello World!</h1>
            </div>
        
        
    </body>
</html>
