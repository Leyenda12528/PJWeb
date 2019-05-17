<%-- 
    Document   : prueba
    Created on : 04-16-2019, 11:14:59 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico"/>
        <title><fmt:message key="label.modificar-empleado"/></title>
    </head>
    <body>
        <sql:query var="modificar" dataSource="jdbc/mysql" scope="request">
            select * from empleados where id_empleado=?
            <sql:param value="${param.id}"/>
        </sql:query>
        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container-fluid">
                <h2><fmt:message key="label.modificar-empleado"/></h2>
                <form role="form" action="../Controlador/empleadosDAO.jsp?ti=1"  method="POST" >
                    <c:forEach var="emp" items="${modificar.rows}">
                        <div class="row">

                            <div class="col-lg-6">

                                <!-- Basic Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.datospersonales"/></h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group"><strong><span class="fas fa-asterisk" style="height: 15px"></span><fmt:message key="label.requeridos"/></strong></div>
                                        <div></div>
                                        <div  class="form-group">
                                            <label for="nombres" ><span class="fas fa-asterisk" ></span><fmt:message key="label.nombres"/></label>
                                            <div class="input-group">
                                                <input  type="text" class="form-control" name="codigo" id="codigo" value="${emp.id_empleado}" required readonly="">
                                                <input  type="text" class="form-control" name="nombres" id="nombres" value="${emp.nombre_emp}" required>

                                                <span  class="invalid-feedback" ></span>  
                                            </div> 
                                        </div>
                                        <div class="form-group">
                                            <label for="apellido"><span class="fas fa-asterisk"></span><fmt:message key="label.apellido"/></label>
                                            <div class="input-group">
                                                <input type="text" size="500" class="form-control" id="apellidos" name="apellidos" value="${emp.apellidos}" required>
                                                <span  class="invalid-feedback" ></span>  
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="edad"><span class="fas fa-asterisk"></span><fmt:message key="label.edad"/></label>
                                            <div class="input-group">
                                                <input type="text" size="500" class="form-control" id="edad" name="edad" value="${emp.edad}" required>
                                                <span  class="invalid-feedback" ></span>  
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="direccion"><span class="fas fa-asterisk"></span><fmt:message key="label.dir"/></label>
                                            <div class="input-group">
                                                <input type="text" size="500"  class="form-control" id="direccion" name="direccion" value="${emp.direccion}" required>
                                                <span  class="invalid-feedback" ></span>  
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label for="telefono"><span class="fas fa-asterisk"></span><fmt:message key="label.tel"/></label>
                                            <div class="input-group">
                                                <input type="text" size="500" class="form-control" id="telefono" name="telefono" value="${emp.telefono}" required>
                                                <span  class="invalid-feedback" ></span>  
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!-- Default Card Example -->


                            </div>

                            <div class="col-lg-6">
                                <!-- Basic Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.infoe"/></h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">                                
                                            <label for="cargo"><span class="fas fa-asterisk"></span><fmt:message key="label.selectcargo"/></label>
                                            <select  class="custom-select" id="cargo" name="cargo" required>
                                                <option value=""><fmt:message key="label.seleccione-opcion"/></option>
                                                <c:forEach var="name1" items="${q2.rows}">
                                                    <option value="${name1.id_cargo}">${name1.nombre_cargo}</option>
                                                </c:forEach>
                                            </select>
                                            <span class="invalid-feedback"></span>
                                        </div>
                                        <div class="form-group">                                
                                            <label for="cargo"><span class="fas fa-asterisk"></span><fmt:message key="label.selectdepto"/></label>
                                            <select  class="custom-select" id="depto" name="depto" required>
                                                <option value=""><fmt:message key="label.seleccione-opcion"/></option>
                                                <c:forEach var="name1" items="${q3.rows}">
                                                    <option value="${name1.id_depto}">${name1.nombre_depto}</option>
                                                </c:forEach>
                                            </select>
                                            <span class="invalid-feedback"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="correo"><span class="fas fa-asterisk"></span><fmt:message key="label.correo"/></label>
                                            <div class="input-group">
                                                <input type="text" size="500" class="form-control" id="correo" name="correo" value="${emp.correo}" required >
                                                <span class="invalid-feedback"></span>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="password"><span class="fas fa-asterisk"></span><fmt:message key="label.pass"/></label>
                                            <div class="input-group">
                                                <input type="password" size="500"  class="form-control" id="password" name="password" value="${emp.password_emp}" required >
                                                <span class="invalid-feedback" id="error"></span>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="password2"><span class="fas fa-asterisk"></span><fmt:message key="label.pass2"/></label>
                                            <div class="input-group">
                                                <input type="password" size="500"  class="form-control" id="password2" name="password2" value="${emp.contraPublic}" required >
                                                <span class="invalid-feedback" id="error"></span>
                                            </div>

                                        </div>  

                                    </div>

                                </div>
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <input type="submit" class="bbtn btn-lg btn-success " value="<fmt:message key="label.guardar"/>" id="btnModificar" name="btnModificar" >
                                    </div>

                                </div>
                            </div>

                        </div>

                    </c:forEach>

                </form>
            </div>
            <script src="js/bootstrap.min.js"></script>
            <script src="assets/jquery-3.3.1.min.js"></script>
            <script src="../assets/validaciones/validacion.js"></script>
    </body>
</html>
