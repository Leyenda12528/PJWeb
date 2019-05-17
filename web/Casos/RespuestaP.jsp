<%-- 
    Document   : RespuestaP
    Created on : 27-abr-2019, 20:18:18
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
        <title><fmt:message key="label.respuestap"/></title>
    </head>
    <body id="page-top">         
        <div id="wrapper">
            <jsp:include page="../Controlador/Casos.jsp"/>
            <jsp:include page="/Menu_1_1.jsp"/>
            <div class="container-fluid">                
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.respuestap"/></h2>
                    <a href="${pageContext.request.contextPath}/Casos/SolicitudP.jsp" class="btn btn-primary"><fmt:message key="label.volver"/></a>
                </div>
                <div class="row">
                    <sql:query var="resq" dataSource="jdbc/mysql">
                        select nombre_caso, descrip_req from caso where id_caso=?
                        <sql:param value="${param.C}"/>
                    </sql:query>
                    <c:forEach var="resFor" items="${resq.rows}">
                        <div class="col-lg-6">
                            <div class="card shadow mb-4">
                                <div class="card-header">
                                    <h6 class="media-heading font-weight-bold text-body"><fmt:message key="label.descripsoli"/>: ${resFor.nombre_caso}</h6>
                                </div>
                                <textarea class="card-body form-control" rows="10" cols="60" placeholder="<fmt:message key="label.descripsoli"/>" readonly="">${resFor.descrip_req}</textarea>
                            </div>                        
                        </div>
                        <div class="col-lg-6">
                            <div class="col-md-12 centrado">
                                <c:choose>
                                    <c:when test="${param.d == 1}">
                                        <h6 class="media-heading font-weight-bold text-info"><fmt:message key="label.aceptando"/></h6>
                                    </c:when>
                                    <c:when test="${param.d == 2}">
                                        <h6 class="media-heading font-weight-bold text-danger"><fmt:message key="label.rechazando"/></h6>
                                    </c:when>
                                </c:choose>                            
                                <form action="${pageContext.request.contextPath}/Controlador/RespPDF.jsp" method="post" enctype="multipart/form-data">
                                    <input type="text" class="form-group form-control text-center" id="id_caso" 
                                           name="id_caso" value="<c:out value="${param.C}"/>" readonly="">
                                    <div class="form-group">                            
                                        <textarea class="form-control" rows="10" cols="60" name="descripcion" id="descripcion"
                                                  onkeypress="return val(event)" required="" placeholder="<fmt:message key="label.descripcion"/>"></textarea>
                                    </div>
                                    <input type="hidden" id="tipo" name="tipo" value="${param.d}">
                                    <c:if test="${param.d == 1}">
                                        <div class="form-group">
                                            <div id="pdf" enctype="multipart/form-data"
                                                 ondragover="defecto(event); sobre();"
                                                 ondragenter="defecto(event); sobre();"
                                                 ondragleave="defecto(event); sobreEnd();"
                                                 ondrop="agregar(event); defecto(event); sobreEnd();"
                                                 >
                                                <label for="ifile" id="lfile">
                                                    <strong><span id="lab"><fmt:message key="label.pdf"/></span></strong>
                                                </label>
                                                <input type="file" name="ifile" id="ifile" accept="application/pdf" onchange="agregar(event);">
                                            </div>
                                        </div>                            
                                    </c:if>
                                    <input type="submit" class="btn btn-info btn-block" value="<fmt:message key="label.enviarRespuesta"/>" id="btnGuardar" name="btnGuardar">
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <script type="text/javascript" src="${pageContext.request.contextPath}/assets/prop/java.js"></script>
    </body>
</html>
