<%-- 
    Document   : asignacionEmpleados
    Created on : 04-17-2019, 01:16:14 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" /> 
<sql:query var="prog" dataSource="jdbc/mysql" scope="request">
    select id_empleado,CONCAT(nombre_emp,' ',apellidos) nombre from empleados where id_empleado=?
    <sql:param value="${param.id}"/>
</sql:query>
<sql:query var="prob" dataSource="jdbc/mysql" scope="request">
    select id_empleado,CONCAT(nombre_emp,' ',apellidos) nombre from empleados where id_empleado=?
    <sql:param value="${param.idt}"/>
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignaciones</title>
    </head>
    <body id="page-top">  

        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1.jsp" />
            <div class="container-fluid">
                <form role="form" action="../Controlador/asignacionDAO.jsp"  method="POST" >
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Información general</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCardExample">
                                    <div class="card-body">
                                        <strong>Caso: </strong> id <c:out value="Log19001"/> NOMBRE DEL CASO
                                        <br/>
                                        <strong>Departamento: </strong> Código-           Nombre- 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                            <div class="card bg-primary text-white shadow">
                                <div class="card-body">
                                    <a class="btn btn-primary btn-icon-split btn-lg" id="pro" href="../Empleados/programadores.jsp?cdepto=<c:out value="1"/>&idcaso=<c:out value="Log19001"/>"> 
                                        Asignar Programador
                                    </a>
                                    <div class="text-white-50 small"></div>
                                    <div class="col-auto">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                            <div class="card bg-warning text-white shadow">
                                <div class="card-body">
                                    <a class="btn btn-warning btn-icon-split btn-lg" href="../Empleados/probadores.jsp?cdepto=<c:out value="1"/>&idcaso=<c:out value="Log19001"/>" >
                                        Asignar Probador
                                    </a>
                                    <div class="text-white-50 small"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-12" >
                            <!-- Basic Card Example -->

                            <div class="card shadow mb-4">


                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.asignacionp"/></h6>
                                </div>
                                <div class="card-body col-lg-4">
                                    <div  class="form-group">

                                        <label for="" ><span class="fas fa-asterisk" ></span><fmt:message key="label.fechalimite"/></label>
                                        <div class="input-group">
                                            <input type="text" size="" class="form-control"  id="idcaso" name="idcaso" value="<c:out value="Log19001"/>">
                                            <input  type="date" class="form-control"  min="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}"/>" name="fechalimite" id="fechalimite"  required>
                                            <span  class="invalid-feedback" ></span>  
                                        </div> 
                                    </div>
                                </div>

                                <input type="submit" class="btn btn-success" value="<fmt:message key="label.asig"/>" id="btnAsignarp" name="btnAsignarp" >          


                            </div>
                        
                            <c:if test="${not empty param.exito}">
                                <div class="alert alert-danger">
                                    <strong>Error!</strong><c:out value="${param.exito}"/>
                                    <br>
                                </div>
                            </c:if>
                        </div>

                    </div>

                </form>
            </div>


            <script src="js/bootstrap.min.js"></script>
            <script src="assets/jquery-3.3.1.min.js"></script>
            <script src="../assets/validaciones/validacion.js"></script>
            <script src="../assets/validaciones/asignacion.js"></script>
    </body>
</html>
