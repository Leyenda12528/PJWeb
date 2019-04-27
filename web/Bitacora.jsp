<%-- 
    Document   : Bitacora
    Created on : 04-11-2019, 11:45:31 AM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title><fmt:message key="label.bitacora"/></title>
    </head>
    <body id="page-top">
        <div id="wrapper">
            <jsp:include page="Menu_1_1.jsp" />
            <div class="container-fluid">
                <h3><fmt:message key="label.bitacora"/></h3>                
                <div class="row col-md-10 centrado">
                    <form role="form" action=""  method="POST" id="needs-validation">
                        <div class="col-md-10">
                            <div  class="form-group">
                                <strong><fmt:message key="label.idcaso"/> </strong>
                                <strong><fmt:message key="label.nombrecaso"/> </strong>                                
                            </div>                            
                            <div class="form-group">                                
                                <strong><fmt:message key="label.actividad"/></strong>
                                <textarea class="form-control" rows="8" cols="70" name="descripcion_act" id="descripcion_act" 
                                         onkeypress="return val(event)" placeholder="<fmt:message key="label.actividad"/>"></textarea>
                            </div>
                            <div class="form-group">                                
                                <textarea class="form-control" rows="8" cols="70" name="Observaciones" id="Observaciones"
                                         onkeypress="return val(event)" placeholder="<fmt:message key="label.observaciones"/>"></textarea>
                            </div>
                            <input type="submit" class="btn btn-info" value="<fmt:message key="label.guardar"/>" id="btnGuardar" name="btnGuardar" >
                            <input type="submit" class="btn btn-info" value="<fmt:message key="label.guardar"/>" id="btnGuardar" name="btnGuardar" >
                        </div>
                    </form>
                </div>   
            </div>
            <script type="text/javascript" src="assets/prop/java.js"></script>
    </body>
</html>
