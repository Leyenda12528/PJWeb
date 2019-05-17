<%-- 
    Document   : CasosAsignados
    Created on : 09-may-2019, 20:16:20
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
<c:if test="${loginB.id_cargo != 4 && loginB.id_cargo != 3}">
    <c:redirect url="../index.jsp">
        <c:param name="error" value="1"/>
    </c:redirect>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico"/>
        <title><fmt:message key="label.casosAsignados"/></title>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <jsp:include page="../Controlador/Casos.jsp"/>
            <jsp:include page="/Menu_1_1.jsp"/>
            <div class="container-fluid">
                <c:if test="${casosAsigq.rowCount < 1}">
                    <div class="alert alert-danger">
                        <strong><fmt:message key="label.sin-Casos-Asignados"/>!</strong>
                        <br>
                    </div>
                </c:if>
                <c:if test="${param.exito == 1}">
                    <div class="alert alert-info">
                        <strong><fmt:message key="label.bitacora-update"/></strong>
                        <br>
                    </div>
                </c:if>
                <c:if test="${param.exito == 2}">
                    <div class="alert alert-info">
                        <strong><fmt:message key="label.bitacora-final"/></strong>
                        <br>
                    </div>
                </c:if>
                <c:if test="${param.exito == 3}">
                    <div class="alert alert-info">
                        <strong><fmt:message key="label.caso-aceptado"/></strong>
                        <br>
                    </div>
                </c:if>
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.casosAsignados"/></h2>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary"><fmt:message key="label.inicio"/></a>
                </div>
                <%--Casos Asignados.....--%>
                <c:forEach var="casosAsigFor" items="${casosAsigq.rows}">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <div class="d-flex">
                                <div class="p-2">
                                    <div class="btn btn-block">
                                        <a  href="${pageContext.request.contextPath}/Bitacora.jsp?ca=${casosAsigFor.id_caso}">
                                            <h6 class="m-0 font-weight-bold text-gray-900"><c:out value="${casosAsigFor.id_caso}"/>
                                                <c:out value="${casosAsigFor.nombre_caso}"/></h6>
                                        </a>
                                    </div>
                                </div>                        
                                <c:if test="${loginB.id_cargo == 3}">
                                    <div class="ml-auto p-2">
                                        <a href="${pageContext.request.contextPath}/Controlador/BitacoraDAO.jsp?f=1&id_caso=${casosAsigFor.id_caso}" class="btn btn-danger"><fmt:message key="label.finalizar-bita"/></a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>                    
                </c:forEach>
            </div>
    </body>
</html>
