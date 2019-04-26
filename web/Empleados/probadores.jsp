<%-- 
    Document   : probadores
    Created on : 04-17-2019, 05:42:15 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:query var="q5" dataSource="jdbc/mysql">
    SELECT id_empleado,CONCAT(nombre_emp,' ',apellidos) nombre,nombre_cargo,nombre_depto FROM empleados emp 
    INNER JOIN departamentos dep ON dep.id_depto= ? and emp.id_depto=?
    INNER JOIN  cargo c ON c.id_cargo=4 and emp.id_cargo=4 where id_estado_emp=0
    <sql:param value="${param.cdepto}"/>
    <sql:param value="${param.cdepto}"/>
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Probadores</title>

    </head>
    <body id="page-top"> 



        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">

            <jsp:include page="/Menu_1.jsp" />
            <div class="container-fluid">
                <div class="card shadow mb-2">
                    <div class="card-header py-2">
                        <h6 class="m-0 font-weight-bold text-primary">Probadores</h6>
                        <div class="col-sm-25">

                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th class="col-md-1">Nombres</th>

                                        <th>Cargo</th>
                                        <th>Deparrtamento</th>
                                        <th>Operaciones</th>
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
                                                
                                                <a href="../Controlador/asignacionDAO.jsp?id=<c:out value="${emp.id_empleado}"/>&idcaso=<c:out value="${param.idcaso}"/>" class="btn btn-success btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-check"></i>
                                                    </span>
                                                    <span class="text">Split Button Success</span>
                                                </a>

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
