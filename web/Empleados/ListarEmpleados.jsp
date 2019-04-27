<%-- 
    Document   : ListarEmpleados
    Created on : 04-15-2019, 08:43:29 PM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico" />
        <title>Listar Empleados</title>
    </head>
    <body id="page-top"> 
         <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">

            <jsp:include page="/Menu_1_1.jsp" />
            
            <div class="container-fluid">
                <div class="card shadow mb-2">
                    <div class="card-header py-2">
                        <h6 class="m-0 font-weight-bold text-primary">Lista de Empleados</h6>
                        <div class="col-sm-25">
                            <a href="nuevoEmpleado.jsp" class="btn btn-primary btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="fas fa-arrow-right"></i>
                                </span>
                                <span class="text">Nuevo Empleado</span>
                            </a>             
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th class="col-md-1">Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Edad</th>
                                        <th>Direccion</th>
                                        <th>Telefono</th>
                                        <th>Correo</th>
                                        <th>Cargo</th>
                                        <th>Deparrtamento</th>
                                        <th>Estado</th>
                                        <th>Operaciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                    <c:forEach var="emp" items="${q1.rows}">
                                        <tr>
                                            <td>${emp.id_empleado}</td>
                                            <td>${emp.nombre_emp}</td>
                                            <td>${emp.apellidos}</td>
                                            <td>${emp.edad}</td>
                                            <td>${emp.direccion}</td>
                                            <td>${emp.telefono}</td>
                                            <td>${emp.correo}</td>
                                            <td>${emp.nombre_cargo}</td>
                                            <td>${emp.nombre_depto}</td>
                                            <td>${emp.estado}</td>
                                            
                                            <td>
                                                <a title="modificar" class="btn btn-primary  btn-circle" href="modificarEmpleado.jsp?id=<c:out value="${emp.id_empleado}"/>"><i class="fa fa-edit"></i></a>
                                                <a title="eliminar" class="btn btn-danger btn-circle" href="javascript:eliminar(<c:out value="${emp.id_empleado}"/>)"><i class="fas fa-trash"></i></a>

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
                            location.href = "../Controlador/empleadosDAO.jsp?codigoe="+ id;
                        }
                    });
                }
            </script>
    </body>
</html>
