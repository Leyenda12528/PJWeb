<%-- 
    Document   : Perfil
    Created on : 18-may-2019, 5:52:36
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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico"/>
        <title><fmt:message key="label.perfil"/></title>
    </head>
    <body id="page-top">
        <div id="wrapper">            
            <jsp:include page="/Menu_1_1.jsp"/>
            <div class="container-fluid">
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.perfil"/></h2> 
                    <div class="col-auto">
                        <i class="fas fa-user fa-7xs text-gray-500"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary"><fmt:message key="label.inicio"/></a>
                </div>
                <hr class="sidebar-divider">
                <div class="card shadow mb-4">
                    <div class="card-header">
                        <h3 class="text-primary"><strong><fmt:message key="label.datos"/></strong></h3>
                    </div>
                    <div class="card-body">
                        <div><strong><fmt:message key="label.codigoe"/>: </strong> ${loginB.id}</div><br/>
                        <div><strong><fmt:message key="label.nombrecaso"/>: </strong> ${loginB.nombre}</div><br/>
                        <div><strong><fmt:message key="label.codigoe"/> <fmt:message key="label.deptoA"/>: </strong> ${loginB.id_departamento}</div><br/>
                        <div><strong><fmt:message key="label.deptoA"/>: </strong> ${loginB.departamento}</div><br/>
                        <div><strong><fmt:message key="label.codigoe"/> <fmt:message key="label.testcargo"/>: </strong> ${loginB.id_cargo}</div><br/>
                        <div><strong><fmt:message key="label.testcargo"/>: </strong> ${loginB.cargo}</div><br/>
                        <div><strong><fmt:message key="label.lstcorreo"/>: </strong> ${loginB.correo}</div><br/>
                    </div>
                </div>
            </div>
    </body>
</html>
