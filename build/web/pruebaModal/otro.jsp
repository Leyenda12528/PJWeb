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
<c:forEach items="${vista.rows}" var="l">
    <c:set var="nombre" value="${l.nombre_caso}"/>
    <c:set var="idc" value="${l.id_caso}"/>
    <c:set var="des1" value="${l.descrip_req}"/>
    <c:set var="des2" value="${l.descripcion_jefedes}"/>
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </head>
    <body>


        <div class="modal-header">
            <h4 class="modal-title w-100" id="myModalLabel">Información de Caso</h4>

        </div>
        <div class="modal-body">
             <h4 class="small font-weight-bold">Avance<span class="float-right">${avance}%</span></h4>
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
                <div class="text-xs font-weight-light text-lg text-gray-600 mb-1">Jefe Funcional: ${JF} </div>
                <h6 class="m-0 font-weight-normal text-gray-100">Descripción: ${des1}</h6>
            </div>
            <div class="col mr-2">
                <div class="text-xs font-weight-light text-lg text-gray-600 mb-1">Jefe Desarrollo: ${JD}</div>
                 <h6 class="m-0 font-weight-normal text-gray-100">Descripción: ${des2}</h6>
            </div>
            <div class="col mr-2">
               <div class="text-xs font-weight-light text-lg text-gray-600 mb-1">Fecha Limite: ${fecha1}</div>
               
            </div>
               <div class="col mr-2">
                <div class="text-xs font-weight-light text-lg text-gray-600 mb-1">Fecha producción: ${fecha2}</div>       
            </div>    
            <div class="col mr-2">
                <div class="text-xs font-weight-bold text-success text-black-50 mb-1">Información Bitacora</div>
                <h6  class="text-xs font-weight-light text-lg text-gray-600 mb-1">Códio: ${idb}</h6>
                 <h6  class="text-xs font-weight-light text-lg text-gray-600 mb-1">Observaciones: ${obs}</h6>
                  <h6  class="text-xs font-weight-light text-lg text-gray-600 mb-1">Descripción de actividades: ${desA}</h6>
            </div>
        </div>
        <div class="modal-footer">

          
        </div>
    </body>
    <script type="text/javascript">
        var paramstr = window.location.search.substr(1);
        var paramarr = paramstr.split("&");
        var params = {};

        for (var i = 0; i < paramarr.length; i++) {
            var tmparr = paramarr[i].split("=");
            params[tmparr[0]] = tmparr[1];
        }
        if (params['variable']) {
            console.log('El valor del parámetro variable es: ' + params['variable']);
            alert('El valor del parámetro variable es: ' + params['variable']);
        } else {
            console.log('No se envió el parámetro variable');
        }


    </script>
</html>

