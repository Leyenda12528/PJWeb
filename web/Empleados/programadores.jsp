<%-- 
    Document   : programadores
    Created on : 04-17-2019, 04:13:10 PM
    Author     : less_
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<sql:query var="q5" dataSource="jdbc/mysql">
    SELECT id_empleado,CONCAT(nombre_emp,' ',apellidos) nombre,c.id_cargo,nombre_cargo,nombre_depto FROM empleados emp 
    INNER JOIN departamentos dep ON dep.id_depto= ? and emp.id_depto=?
    INNER JOIN  cargo c ON c.id_cargo=3 and emp.id_cargo=3 where id_estado_emp=0
    <sql:param value="${loginB.id_departamento}"/>
    <sql:param value="${loginB.id_departamento}"/>

</sql:query>
   <c:set var="op" value="${param.op}"/>
    <c:if test="${op!=1}">
            <style>
           #asig
           {
               display: none;
           }
        </style>
    </c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico"/>
        <title><fmt:message key="label.protitle"/></title>
    </head>
    <body id="page-top"> 



        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">

            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container-fluid">
                <div class="card shadow mb-2">
                    <div class="card-header py-2">
                        <h3 class="m-0 font-weight-bold text-primary"><fmt:message key="label.protitle"/></h3>
                        <div class="col-sm-25">

                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                      <thead>
                                    <tr>
                                        <th><fmt:message key="label.testcodigo"/></th>
                                        <th class="col-md-auto"><fmt:message key="label.testnombre"/></th>

                                        <th><fmt:message key="label.testcargo"/></th>
                                        <th><fmt:message key="label.testdepto"/></th>
                                        <th><fmt:message key="label.testop"/></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="emp" items="${q5.rows}">
                                        <tr>
                                            <td>${emp.id_empleado}</td>
                                            <td>${emp.nombre}</td>
                                            <td>${emp.nombre_cargo}</td>
                                            <td>${emp.nombre_depto}</td>
                                            <td>
                                                <div id="asig">
                                                    <a href="../Controlador/asignacionDAO.jsp?id=<c:out value="${emp.id_empleado}"/>&idcaso=<c:out value="${param.idcaso}"/>&cargo=${emp.id_cargo}" class="btn btn-success btn-icon-split">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-check"></i>
                                                        </span>
                                                        <span class="text"><fmt:message key="label.testasignar"/></span>
                                                    </a>                                                    
                                                </div>
                                                <c:if test="${op != 1}">
                                                    <a href="${pageContext.request.contextPath}/Casos/CasosMod.jsp?dip=${emp.id_empleado}" class="btn btn-danger"><fmt:message key="label.casosAsignados"/></a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>                    
                </div> 
            </div>
            <script>
                function eliminar(id) {
                    alertify.confirm("¿Realmente deseas inhabilitar a este empleado?", function (e) {
                        if (e) {
                            location.href = "../Controlador/empleadosDAO.jsp?codigoe=" + id;
                        }
                    });
                }
            </script>
    </body>
</html>
