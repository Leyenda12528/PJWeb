<%-- 
    Document   : SolicitudP
    Created on : 27-abr-2019, 1:24:05
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
<c:if test="${loginB.id_cargo != 1}">
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
        <title><fmt:message key="label.solip"/></title>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <jsp:include page="../Controlador/Casos.jsp"/>
            <jsp:include page="/Menu_1_1.jsp"/>
            <div class="container-fluid">
                <c:if test="${not empty param.exito}">
                    <div class="alert alert-info">
                        <strong><fmt:message key="label.respuestaCasosend"/>!</strong>
                        <br>
                    </div>
                </c:if>
                <c:if test="${solipq.rowCount < 1}">
                    <div class="alert alert-primary">
                        <strong><fmt:message key="label.sinSoli"/>!</strong>
                        <br>
                    </div>
                </c:if>
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.solp"/></h2>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary"><fmt:message key="label.inicio"/></a>
                </div>
                <hr class="sidebar-divider">
                <c:forEach var="solipFor" items="${solipq.rows}" varStatus="status">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><c:out value="${solipFor.id_caso}"/>
                                <c:out value="${solipFor.nombre_caso}"/></h6>
                        </div>
                        <div class="card-body">
                            <c:if test="${fn:length(solipFor.pdf)>4}">
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/#?"><fmt:message key="label.verpdfjf"/></a>
                            </c:if>
                                <%--${pageContext.request.contextPath}/Controlador/Casos.jsp?aceptarC=${solipFor.id_caso}--%>
                            <a title="<fmt:message key="label.aceptarC"/>" class="btn btn-success" onclick="" href="${pageContext.request.contextPath}/Casos/RespuestaP.jsp?C=${solipFor.id_caso}&d=1"><fmt:message key="label.aceptarC"/></a>
                            <a title="<fmt:message key="label.rechazarC"/>" class="btn btn-secondary" onclick="" href="${pageContext.request.contextPath}/Casos/RespuestaP.jsp?C=${solipFor.id_caso}&d=2"><fmt:message key="label.rechazarC"/></a>
                            <%--p2('${solipFor.id_caso}')--%>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <%--
            <script type="text/javascript">                
                function p2(dato)
                {
                    alertify.confirm( "¿Dese rechazar este caso "+dato+" ?", function (e) {
                        if (e) window.window.location.href="ListarCasos.jsp"; 
                    });
                }                
            </script>--%>
    </body>
</html>
