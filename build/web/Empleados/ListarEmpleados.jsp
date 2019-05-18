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
<c:if test="${loginB.id_cargo != 0}">
    <c:redirect url="../index.jsp">
        <c:param name="error" value="1"/>
    </c:redirect>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico" />
        <title><fmt:message key="label.lstemp"/></title>
    </head>
    <body id="page-top"> 
        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">

            <jsp:include page="/Menu_1_1.jsp" />

            <div class="container-fluid">
                <c:if test="${param.exito == 1}">
                    <div class="alert alert-danger">
                        <strong><fmt:message key="label.emp-desa"/></strong><br>
                    </div>
                </c:if>
                <c:if test="${param.exito == 2}">
                    <div class="alert alert-info">
                        <strong><fmt:message key="label.emp-abi"/></strong><br>
                    </div>
                </c:if>
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800"><fmt:message key="label.lstemp2"/></h1>
                    <a href="ingresarEmpleado.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-user fa-sm text-white-50">
                        </i> <fmt:message key="label.lstnuevo"/></a>
                </div>
                <div class="card shadow mb-2">
                    <div class="card-header py-2">
                        <h6 class="m-0 font-weight-bold text-primary"> <fmt:message key="label.lstinfo"/></h6>

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><fmt:message key="label.lstcodigo"/></th>
                                        <th class="col-md-1"><fmt:message key="label.lstnombre"/></th>
                                        <th><fmt:message key="label.lstapellido"/></th>
                                        <th><fmt:message key="label.lstedad"/></th>
                                        <th><fmt:message key="label.lstdir"/></th>
                                        <th><fmt:message key="label.lsttel"/></th>
                                        <th><fmt:message key="label.lstcorreo"/></th>
                                        <th><fmt:message key="label.lstcargo"/></th>
                                        <th><fmt:message key="label.lstdepto"/></th>
                                        <th><fmt:message key="label.lstestado"/></th>
                                        <th><fmt:message key="label.lstop"/></th>
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
                                            <c:set var="dato" value="${emp.estado}"/>
                                            <td>
                                                <a title="modificar" class="btn btn-primary  btn-circle" href="modificarEmpleado.jsp?id=<c:out value="${emp.id_empleado}"/>"><i class="fa fa-edit"></i></a>
                                                <% String dato = "" + pageContext.getAttribute("dato");
                                                    if(dato.equals("Activo")){
                                                %>                                                
                                                <a title="eliminar" class="btn btn-danger btn-circle" href="javascript:eliminar(<c:out value="${emp.id_empleado}"/>)"><i class="fas fa-trash"></i></a>
                                                <% }else {%>
                                                <a title="activar" class="btn btn-success btn-circle" href="javascript:activar(<c:out value="${emp.id_empleado}"/>)"><i class="far fa-check-circle"></i></a>
                                                <%}%>
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
                function activar(id) {
                    alertify.confirm("¿Realmente deseas habilitar a este empleado?", function (e) {
                        if (e) {
                            location.href = "../Controlador/empleadosDAO.jsp?activar=" + id;
                        }
                    });
                }
            </script>
    </body>
</html>
