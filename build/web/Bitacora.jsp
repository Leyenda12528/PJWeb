<%-- 
    Document   : Bitacora
    Created on : 04-11-2019, 11:45:31 AM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title><fmt:message key="label.bitacora"/></title>

    </head>
    <body id="page-top">
        <div id="wrapper">
            <jsp:include page="Menu_1_1.jsp" />
            <div class="container-fluid">
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.bitacora"/> <c:out value="${param.ca}"/></h2>
                    <a href="${pageContext.request.contextPath}/Casos/CasosAsignados.jsp" class="btn btn-primary"><fmt:message key="label.casosAsignados"/></a>
                </div>
                <hr class="sidebar-divider d-none d-md-block">
                <sql:query var="bitaq" dataSource="jdbc/mysql">
                    SELECT        bitacoras.id_caso, caso.nombre_caso, bitacoras.descripcion_actividad, caso.porcentaje_avance, bitacoras.observaciones
                     FROM            caso INNER JOIN
                     bitacoras ON caso.id_caso = bitacoras.id_caso
                    WHERE        caso.id_caso = ?
                    <sql:param value="${param.ca}"/>
                </sql:query>
                <c:forEach var="bitafor" items="${bitaq.rows}">
                    <c:set var="correlativo" value="${bitafor.porcentaje_avance}"/>
                
                <form role="form" action=""  method="POST" id="needs-validation">
                    <input type="hidden" id="id_caso" name="id_caso" value="<c:out value="${param.ca}"/>">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <strong><fmt:message key="label.observaciones"/></strong>
                                </div>
                                <textarea class="card-body form-group form-control" rows="8" cols="70" name="Observaciones" id="Observaciones"
                                          onkeypress="return val(event)" placeholder="<fmt:message key="label.observaciones"/>"></textarea>
                            </div>                            
                        </div>
                        <div class="col-lg-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <div class="d-inline-block pr-2"><strong><fmt:message key="label.porcentaje"/></strong></div>
                                    <div class="d-inline-block">
                                        <input type="number" class="form-control" id="porc" name="porc" 
                                               required="" width="5" min="0" max="100" value="${bitafor.porcentaje_avance}"/>
                                    </div>
                                </div>                                        
                                <div class="card-body">                                                                                                            
                                    <div class="card-header py-3">
                                        <strong><fmt:message key="label.actividad"/></strong>
                                    </div>
                                    <textarea class="form-group form-control" rows="8" cols="70" name="descripcion_act" id="descripcion_act" 
                                              onkeypress="return val(event)" placeholder="<fmt:message key="label.actividad"/>"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-info" value="<fmt:message key="label.guardar"/>" id="btnGuardar" name="btnGuardar">
                    <input type="submit" class="btn btn-info" value="<fmt:message key="label.guardar"/>" id="btnGuardar" name="btnGuardar">
                    <input type="submit" class="btn btn-info" value="<fmt:message key="label.guardar"/>" id="btnGuardar" name="btnGuardar">
                </form>
                </c:forEach>
            </div>
            <script type="text/javascript" src="assets/prop/java.js"></script>
    </body>
</html>
