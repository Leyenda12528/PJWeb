<%-- 
    Document   : Bitacora
    Created on : 04-11-2019, 11:45:31 AM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:useBean id="now" class="java.util.Date" />

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
                    <h3 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.bitacora"/> <c:out value="${param.ca}"/></h3>
                    <a href="${pageContext.request.contextPath}/Casos/CasosAsignados.jsp" class="btn btn-primary"><fmt:message key="label.casosAsignados"/></a>
                </div>
                <hr class="sidebar-divider d-none d-md-block">
                <sql:query var="bitaq" dataSource="jdbc/mysql">
                    SELECT        bitacoras.id_caso, caso.nombre_caso, bitacoras.descripcion_actividad, caso.porcentaje_avance, bitacoras.observaciones,
                                caso.id_estado
                     FROM            caso INNER JOIN
                     bitacoras ON caso.id_caso = bitacoras.id_caso
                    WHERE        caso.id_caso = ?
                    <sql:param value="${param.ca}"/>
                </sql:query>
                <c:forEach var="bitafor" items="${bitaq.rows}">
                    <h5>${bitafor.nombre_caso}</h5>
                    <form role="form" action="${pageContext.request.contextPath}/Controlador/BitacoraDAO.jsp"  method="POST">
                        <input type="hidden" id="id_caso" name="id_caso" value="<c:out value="${param.ca}"/>">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card shadow mb-4">
                                    <div class="card-header ">
                                        <div class="d-inline-block pr-2"><strong><fmt:message key="label.porcentaje"/></strong></div>
                                        <div class="d-inline-block">
                                            <input type="number" class="form-control" id="porc" name="porc" 
                                                   required="" width="5" min="0" max="100" value="${bitafor.porcentaje_avance}"
                                                   <c:if test="${loginB.id_cargo == 4}">
                                                       readonly=""
                                                   </c:if>/>
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 bg-primary text-white">
                                        <strong><fmt:message key="label.actividad"/></strong>
                                    </div>
                                    <textarea class="card-body form-group form-control" rows="8" cols="70" name="descripcion_act" id="descripcion_act" 
                                              onkeypress="return val(event)" placeholder="<fmt:message key="label.actividad"/>"
                                              <c:if test="${loginB.id_cargo == 4}">
                                                  readonly=""
                                              </c:if>
                                              <c:if test="${loginB.id_cargo == 3}">
                                                  required=""
                                              </c:if>                                              
                                              >${bitafor.descripcion_actividad}
                                    </textarea>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 bg-primary text-white">
                                        <strong><fmt:message key="label.observaciones"/></strong>
                                    </div>
                                    <textarea class="card-body form-group form-control" rows="8" cols="70" name="Observaciones" id="Observaciones"
                                              onkeypress="return val(event)" 
                                              placeholder="<fmt:message key="label.observaciones"/>"
                                              <c:if test="${loginB.id_cargo == 4 && bitafor.id_estado == 4}">
                                                  required=""
                                              </c:if>
                                              <c:if test="${loginB.id_cargo == 3}">
                                                  readonly=""
                                              </c:if>
                                              <c:if test="${bitafor.id_estado != 4}">
                                                  readonly=""
                                              </c:if>
                                              >${bitafor.observaciones}
                                    </textarea>
                                </div>
                                        <%--RECHAZAR--%>
                                <c:if test="${loginB.id_cargo == 4 && bitafor.id_estado == 4}">
                                    <div class="d-flex justify-content-end">
                                        <div class="pr-2"><input type="submit" class="btn btn-danger" value="<fmt:message key="label.rechazar-bita"/>" id="btnRechazarBita" name="btnRechazarBita"></div>
                                    </div>                            
                                </c:if>
                                            <%--ACTUALIZAR--%>
                                <c:if test="${loginB.id_cargo == 3}">
                                    <div class="d-flex justify-content-end">
                                        <div class="pr-2"><input type="submit" class="btn btn-info" value="<fmt:message key="label.actualizar-bita"/>" id="btnActualizarBita" name="btnActualizarBita"></div>
                                    </div>
                                </c:if>
                            </div>
                        </div>                        
                        
                    </form>
                        <%--ACEPTAR--%>
                    <form role="form" action="${pageContext.request.contextPath}/Controlador/BitacoraDAO.jsp"  method="POST">
                        <c:if test="${loginB.id_cargo == 4 && bitafor.id_estado == 4}">
                            <input type="hidden" id="id_caso" name="id_caso" value="<c:out value="${param.ca}"/>">
                            <div class="d-flex justify-content-end">
                                <div class="pr-2"><strong><fmt:message key="label.fecha-produccion"/></strong></div>
                                <div class="pr-2">                                    
                                    <input  type="date" class="form-control"  min="<fmt:formatDate pattern = "dd-MM-yyyy" value = "${now}"/>" name="fechaprodc" id="fechaprodc" required>
                                </div>
                                <div class="pr-2"><input type="submit" class="btn btn-primary" value="<fmt:message key="label.aceptar-bita"/>" id="btnAceptarBita" name="btnAceptarBita"></div>
                            </div><br/><br/>
                        </c:if>
                    </form>
                </c:forEach>
            </div>
            <script type="text/javascript" src="assets/prop/java.js"></script>
    </body>
</html>
