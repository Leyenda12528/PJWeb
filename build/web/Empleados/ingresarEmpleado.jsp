<%-- 
    Document   : ingresarEmpleado
    Created on : 04-16-2019, 03:45:34 PM
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
        <link rel="shortcut icon" href="../Imas/java.ico" />
        <title>Ingresar Empleado</title>
    </head>
    <body id="page-top">  
        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1.jsp" />
            <div class="container-fluid">
                <form role="form" action="../Controlador/empleadosDAO.jsp"  method="POST" >
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
                                            <input  type="text" class="form-control" name="codigo" id="codigo" placeholder="" readonly="" value="${q6.rowCount}">
                                            <input  type="text" class="form-control" name="nombres" id="nombres" placeholder="<fmt:message key="label.camponombre"/>" required>

                                            <span  class="invalid-feedback" ></span>  
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <label for="apellido"><span class="fas fa-asterisk"></span><fmt:message key="label.apellido"/></label>
                                        <div class="input-group">
                                            <input type="text" size="500" class="form-control" id="apellidos" name="apellidos" placeholder="<fmt:message key="label.campoapellido"/>" required>
                                            <span  class="invalid-feedback" ></span>  
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="edad"><span class="fas fa-asterisk"></span><fmt:message key="label.edad"/></label>
                                        <div class="input-group">
                                            <input type="text" size="500" class="form-control" id="edad" name="edad" placeholder="<fmt:message key="label.campoedad"/>" required>
                                            <span  class="invalid-feedback" ></span>  
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="direccion"><span class="fas fa-asterisk"></span><fmt:message key="label.dir"/></label>
                                        <div class="input-group">
                                            <input type="text" size="500"  class="form-control" id="direccion" name="direccion" placeholder="<fmt:message key="label.campodir"/>" required>
                                            <span  class="invalid-feedback" ></span>  
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="telefono"><span class="fas fa-asterisk"></span><fmt:message key="label.tel"/></label>
                                        <div class="input-group">
                                            <input type="text" size="500" class="form-control" id="telefono" name="telefono" placeholder="<fmt:message key="label.campotel"/>" required>
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
                                    <h6 class="m-0 font-weight-bold text-primary">Información empleado</h6>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">                                
                                        <label for="cargo"><span class="fas fa-asterisk"></span><fmt:message key="label.selectcargo"/></label>
                                        <select  class="custom-select" id="cargo" name="cargo" required>
                                            <option value="" >Seleccione una opcion</option>
                                            <c:forEach var="name1" items="${q2.rows}">
                                                <option value="${name1.id_cargo}">${name1.nombre_cargo}</option>
                                            </c:forEach>
                                        </select>
                                        <span class="invalid-feedback"></span>
                                    </div>
                                    <div class="form-group">                                
                                        <label for="cargo"><span class="fas fa-asterisk"></span><fmt:message key="label.selectdepto"/></label>
                                        <select  class="custom-select" id="depto" name="depto" required>
                                            <option value="" >Seleccione una opcion</option>
                                            <c:forEach var="name1" items="${q3.rows}">
                                                <option value="${name1.id_depto}">${name1.nombre_depto}</option>
                                            </c:forEach>
                                        </select>
                                        <span class="invalid-feedback"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="correo"><span class="fas fa-asterisk"></span><fmt:message key="label.correo"/></label>
                                        <div class="input-group">
                                            <input type="text" size="500" class="form-control" id="correo" name="correo" placeholder="<fmt:message key="label.campocorreo"/>" required >
                                            <span class="invalid-feedback"></span>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="password"><span class="fas fa-asterisk"></span><fmt:message key="label.pass"/></label>
                                        <div class="input-group">
                                            <input type="password" size="500"  class="form-control" id="password" name="password" placeholder="<fmt:message key="label.campopass"/>" required >
                                            <span class="invalid-feedback" id="error"></span>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="password2"><span class="fas fa-asterisk"></span><fmt:message key="label.pass2"/></label>
                                        <div class="input-group">
                                            <input type="password" size="500"  class="form-control" id="password2" name="password2" placeholder="<fmt:message key="label.campopass"/>" required >
                                            <span class="invalid-feedback" id="error"></span>
                                        </div>

                                    </div>                                   
                                </div>

                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <input type="submit" class="bbtn btn-lg btn-info " value="<fmt:message key="label.guardar"/>" id="btnGuardar" name="btnGuardar" >
                                </div>

                            </div>
                            <c:if test="${not empty param.error}">
                                <div class="alert alert-danger">
                                    <strong>Error!</strong><c:out value="${param.error}"/>
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
    </body>
</html>
