<%-- 
    Document   : index
    Created on : 04-16-2019, 10:50:23 AM
    Author     : less_
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="usuario" value="${sessionScope['loginUser']}"/>
<c:if test="${empty usuario}">
    <c:redirect url="Login.jsp">
        <c:param name="error" value="2"/>
    </c:redirect>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title><fmt:message key="label.inicio"/></title>
    </head>
    <body id="page-top">
        <div id="wrapper">            
            <jsp:include page="Menu_1_1.jsp" />
            <jsp:include page="Controlador/Casos.jsp" />            
            <div class="container-fluid">
                <c:if test="${param.error == 1}">
                    <div class="alert alert-danger">
                        <strong><fmt:message key="label.permisos1"/></strong>
                        <br>
                    </div>
                </c:if>
                <div  id="menu2">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.bienvenido"/>
                                <c:out value="${loginB.nombre}"/>
                            </h6>
                        </div>
                        <div class="card-body">
                            <p><fmt:message key="label.info"/></p>
                            <c:if test="${loginB.id_cargo != 0}">
                                <p class="mb-0"><fmt:message key="label.codigo"/>: <c:out value="${loginB.id_departamento}"/>  <fmt:message key="label.selectdepto"/>: <c:out value="${loginB.departamento}"/> </p>
                            </c:if>
                            <p class="mb-0"><fmt:message key="label.selectcargo"/>: <c:out value="${loginB.cargo}"/> </p>
                        </div>
                    </div>
                    <!-- Content Row -->
                    <div class="row">

                        <!-- JEFE FUNCIONAL Y  
                                JEFE DESARROLLO
                        -->
                        <c:if test="${loginB.id_cargo == 1 || loginB.id_cargo == 2}">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1"><fmt:message key="label.titulocasos"/></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><a href="${pageContext.request.contextPath}/generarReporte.jsp" class="text-gray-800"><fmt:message key="label.rtitle"/></a></div>
                                            </div>
                                            <div class="col-auto">                                            
                                                <i class="fas fa-file-invoice fa-2x text-gray-500"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Earnings (Monthly) Card Example
                            JEFE FUNCIONAL
                            <fmt:message key="label.finalizados"/>
                            -->
                            <c:if test="${loginB.id_cargo == 2}">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-danger shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1"><fmt:message key="label.titulocasos"/></div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><a href="${pageContext.request.contextPath}/Solicitud.jsp" class="text-gray-800"><fmt:message key="label.nuevasoli"/></a></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar-check fa-2x text-gray-500"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Pending Requests Card Example 
                                JEFE DESARROLLO
                            -->
                            <c:if test="${loginB.id_cargo == 1}">

                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-warning shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"><a class="text-primary" href="${pageContext.request.contextPath}/Casos/SolicitudP.jsp"><fmt:message key="label.solp"/></a></div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${solipq.rowCount}"/></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-exclamation-triangle fa-2x text-gray-500"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:if>
                        </c:if>

                        <%--PROGRAMADOR o TESTER--%>
                        <c:if test="${loginB.id_cargo == 3 || loginB.id_cargo == 4}">

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><fmt:message key="label.titulocasos"/></div>
                                                <div class="h5 mb-0 font-weight-bold"><a class="text-gray-800" href="${pageContext.request.contextPath}/Casos/CasosAsignados.jsp"><fmt:message key="label.casosAsignados"/></a></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar-check fa-2x text-gray-500"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example 
                           TESTER
                            -->
                            <c:if test="${loginB.id_cargo == 4}">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><fmt:message key="label.titulocasos"/></div>
                                                    <div class="h5 mb-0 font-weight-bold"><a href="${pageContext.request.contextPath}/Casos/CasosRespuestaT.jsp" class="text-gray-800"><fmt:message key="label.espera"/></a></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-500"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Earnings (Monthly) Card Example 
                                PROGRAMADOR
                            -->
                            <c:if test="${loginB.id_cargo == 3}">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-danger shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><fmt:message key="label.titulocasos"/></div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><a href="${pageContext.request.contextPath}/Casos/CasosDevueltosP.jsp" class="text-gray-800"><fmt:message key="label.devuelto-observaciones"/></a></div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-ban fa-2x text-gray-500"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </c:if>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-gray-800 text-uppercase mb-1"><strong><fmt:message key="label.titulocasos"/></strong></div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><a href="${pageContext.request.contextPath}/Modal/principal.jsp" class="text-gray-800"><fmt:message key="label.detalles"/></a></div>
                                        </div>
                                        <div class="col-auto">                                            
                                            <i class="fas fa-file-signature fa-3x text-gray-500"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${loginB.id_cargo == 0}">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><strong><fmt:message key="label.mantenimientoe"/></strong></div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><a href="${pageContext.request.contextPath}/Empleados/ingresarEmpleado.jsp" class="text-gray-800"><fmt:message key="label.TituloIe"/></a></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-plus-circle fa-3x text-gray-500"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>                                            
                    </div>
                </div>
            </div>

    </body>
</html>
