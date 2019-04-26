<%-- 
    Document   : Solicitud
    Created on : 04-11-2019, 11:30:02 AM
    Author     : less_
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="usuario" value="${sessionScope['loginUser']}"/>
        <c:if test="${empty usuario}">
            <c:redirect url="Login.jsp">
                <c:param name="error" value="2"/>
            </c:redirect>
        </c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title>Solicitud</title>
    </head>
    <body id="page-top">         
        <div id="wrapper">
            <jsp:include page="/Controlador/Casos.jsp"/>
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container-fluid">
                <h4><fmt:message key="label.titlesoli" /></h4>
                <c:if test="${not empty param.exito}">
                    <div class="alert alert-info">
                        <strong><fmt:message key="label.solienvi"/>!</strong>
                        <br>
                    </div>
                </c:if>
                <div class="row col-md-5 centrado">
                    <form role="form" action="Controlador/ProcesarSoliPDF.jsp"  method="POST" enctype="multipart/form-data">
                        <div class="form-group input-group col-6">
                            <fmt:message key="label.idcaso"/>&nbsp;<input type="text" class="form-control" name="id_caso" id="id_caso" readonly="" value="${NewIdCaso}">
                        </div>
                        <div  class="form-group">                            
                            <input type="text" class="form-control" name="nombre_caso" id="nombre_caso" placeholder="<fmt:message key="label.namesoli"/>" required 
                                   pattern="[ A-Za-z0-9]+" title="Solo letras y numeros">
                        </div>
                        <div class="form-group">                            
                            <textarea class="form-control" rows="10" cols="60" name="descripcion_caso" id="descripcion_caso"
                                      onkeypress="return val(event)" required="" placeholder="<fmt:message key="label.descripsoli"/>"></textarea>
                        </div>
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
                        <input type="submit" class="btn btn-info btn-block" value="<fmt:message key="label.solisoli"/>" id="btnGuardar" name="btnGuardar" >
                    </form>
                </div>
            </div>
            <script type="text/javascript" src="assets/prop/java.js"></script>            
    </body>    
</html>
