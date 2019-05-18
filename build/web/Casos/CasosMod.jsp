<%-- 
    Document   : CasosMod
    Created on : 17-may-2019, 17:48:53
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
<sql:query var="casosAsigq2" dataSource="jdbc/mysql">
    SELECT        bitacoras.id_caso, caso.nombre_caso, bitacoras.descripcion_actividad, caso.porcentaje_avance, bitacoras.observaciones
    FROM            bitacoras INNER JOIN
    caso ON bitacoras.id_caso = caso.id_caso INNER JOIN
    empleados_caso ON caso.id_caso = empleados_caso.id_caso
    WHERE        (empleados_caso.id_empleado = ?) AND (caso.id_estado <> 1) AND (caso.id_estado <> 2) AND (caso.id_estado <> 7)
    <sql:param value="${param.dip}"/>    
</sql:query>
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
            <jsp:include page="/Menu_1_1.jsp"/>
            <div class="container-fluid">
                <c:if test="${casosAsigq2.rowCount < 1}">
                    <div class="alert alert-warning">
                        <strong><fmt:message key="label.este-programador"/> <fmt:message key="label.sin-Casos-Asignados"/>!</strong>
                        <br>
                    </div>
                </c:if>
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.casosAsignados"/></h2>
                    <div class="d-flex justify-content-end">                        
                        <div class="pr-2">                                    
                            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary"><fmt:message key="label.inicio"/></a>
                        </div>
                        <div class="pr-2">
                            <a href="${pageContext.request.contextPath}/Empleados/programadores.jsp?op=0" class="btn btn-secondary"><fmt:message key="label.programadores"/></a>
                        </div>
                    </div>                                        
                </div>
                <%--Casos Asignados.....--%>
                <c:forEach var="casosAsigFor" items="${casosAsigq2.rows}">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <div class="d-flex">
                                <div class="p-2">
                                    <div class="btn btn-block">
                                        <h6 class="m-0 font-weight-bold text-gray-900"><c:out value="${casosAsigFor.id_caso}"/>
                                                <c:out value="${casosAsigFor.nombre_caso}"/></h6>
                                    </div>
                                </div>                        
                                <c:if test="${loginB.id_cargo == 1}">
                                    <div class="ml-auto p-2">
                                        <a href="${pageContext.request.contextPath}/Casos/asignacionEmpleados.jsp?caR=${casosAsigFor.id_caso}" class="btn btn-danger"><fmt:message key="label.modificar-asignacion"/></a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>                    
                </c:forEach>
            </div>
    </body>
</html>
