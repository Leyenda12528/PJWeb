<%-- 
    Document   : otro
    Created on : 05-14-2019, 08:37:21 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:query var="vista" dataSource="jdbc/mysql" >
    SELECT ca.id_caso,ca.nombre_caso,ca.descrip_req,ca.descripcion_jefedes,ca.fecha_limite,ca.fecha_produccion,ca.porcentaje_avance,b.id_bitacora,b.observaciones,b.descripcion_actividad,et.nombre_estado
    FROM caso ca
    INNER JOIN bitacoras b ON b.id_caso=ca.id_caso 
    INNER JOIN estados et ON et.id_estado=ca.id_estado
    WHERE ca.id_caso=?
    <sql:param value="${param.variable}"/>
</sql:query>
<sql:query var="vista2" dataSource="jdbc/mysql" >
    SELECT CONCAT(nombre_emp,' ',apellidos) nombre_emp from empleados e
    INNER JOIN cargo cg ON cg.id_cargo=e.id_cargo 
    INNER JOIN departamentos dep ON dep.id_depto=e.id_depto 
    WHERE dep.nombre_depto=? and e.id_cargo=1 
    <sql:param value="${param.depto}"/>
</sql:query> 
<sql:query var="vista3" dataSource="jdbc/mysql" >
    SELECT CONCAT(nombre_emp,' ',apellidos) nombre_emp from empleados e
    INNER JOIN cargo cg ON cg.id_cargo=e.id_cargo 
    INNER JOIN departamentos dep ON dep.id_depto=e.id_depto 
    WHERE dep.nombre_depto=? and e.id_cargo=2 
    <sql:param value="${param.depto}"/>
</sql:query> 

<c:forEach items="${vista2.rows}" var="jd">
    <c:set var="JD" value="${jd.nombre_emp}"/>
   
</c:forEach>
<c:forEach items="${vista3.rows}" var="jf">
    <c:set var="JF" value="${jf.nombre_emp}"/>
</c:forEach>
<c:if test="${vista.rowCount < 1}">
    <sql:query var="vista" dataSource="jdbc/mysql" >
        SELECT ca.id_caso,ca.nombre_caso,ca.descrip_req,ca.descripcion_jefedes, ca.descrip_rechazo,ca.fecha_limite,ca.fecha_produccion,
         ca.porcentaje_avance,et.nombre_estado
        FROM caso ca        
        INNER JOIN estados et ON et.id_estado=ca.id_estado
        WHERE ca.id_caso=?
        <sql:param value="${param.variable}"/>
    </sql:query>
</c:if>
<c:forEach items="${vista.rows}" var="l">
    <c:set var="nombre" value="${l.nombre_caso}"/>
    <c:set var="idc" value="${l.id_caso}"/>
    <c:set var="des1" value="${l.descrip_req}"/>
    <c:set var="des2" value="${l.descripcion_jefedes}"/>
    <c:set var="des3" value="${l.descrip_rechazo}"/>
    <c:set var="fecha1" value="${l.fecha_limite}"/>
    <c:set var="fecha2" value="${l.fecha_produccion}"/>
    <c:set var="avance" value="${l.porcentaje_avance}"/>
    <c:set var="idb" value="${l.id_bitacora}"/>
    <c:set var="obs" value="${l.observaciones}"/>
    <c:set var="desA" value="${l.descripcion_Actividad}"/>
    <c:set var="estado" value="${l.nombre_estado}"/>
</c:forEach>
<c:set var="nombres" value="${param.variable}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="modal-header">
            <h4 class="modal-title w-100" id="myModalLabel"><fmt:message key="label.info-caso"/></h4>
        </div>
        <div class="modal-body">
            <h4 class="small font-weight-bold"><fmt:message key="label.avance"/><span class="float-right">${avance}%</span></h4>
            <div class="progress mb-4">
                <div id="barra" class="progress-bar bg-info" role="progressbar" style="width: ${avance}%" aria-valuenow="${avance}" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <span class="font-weight-bold"></span>
            <div class="col mr-2">
                <div class="text-xs font-weight-bold text-primary text-center mb-1">${nombre}   ${idc}</div>
            </div>
            <div class="col mr-2">
                <div class="text-xs font-weight-bold text-warning text-center mb-1">${estado}</div>
            </div>
            <div class="col mr-2">
                <div class="text-xs font-weight-light text-lg text-gray-600 mb-1"><fmt:message key="label.jf"/>: ${JF} </div>
                <h6 class="m-0 font-weight-normal text-gray-100"><fmt:message key="label.descripcion"/>: ${des1}</h6>
            </div>
            <div class="col mr-2">
                <div class="text-xs font-weight-light text-lg text-gray-600 mb-1"><fmt:message key="label.jd"/>: ${JD}</div>
                <c:if test="${empty des3}">
                    <h6 class="m-0 font-weight-normal text-gray-100"><fmt:message key="label.descripcion"/>: ${des2}</h6>
                </c:if>                
                <c:if test="${not empty des3}">
                    <h6 class="m-0 font-weight-normal text-gray-100"><fmt:message key="label.descrip-rechazo"/>: ${des3}</h6>
                </c:if>
            </div>
            <div class="col mr-2">
                <div class="text-xs font-weight-light text-lg text-gray-600 mb-1"><fmt:message key="label.fecha-limite"/> ${fecha1}</div>

            </div>
            <div class="col mr-2">
                <div class="text-xs font-weight-light text-lg text-gray-600 mb-1"><fmt:message key="label.fecha-produccion"/> ${fecha2}</div>       
            </div>    
            <c:if test="${empty des3}">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-black-50 mb-1"><fmt:message key="label.info"/> <fmt:message key="label.bitacora"/></div>
                    <h6  class="text-xs font-weight-light text-lg text-gray-600 mb-1"><fmt:message key="label.codigoe"/>: ${idb}</h6>
                    <h6  class="text-xs font-weight-light text-lg text-gray-600 mb-1"><fmt:message key="label.observaciones"/>: ${obs}</h6>
                    <h6  class="text-xs font-weight-light text-lg text-gray-600 mb-1"><fmt:message key="label.descrip-activ"/>: ${desA}</h6>
                </div>
            </c:if>
        </div>
        <div class="modal-footer">
        </div>
    </body>
    
</html>

