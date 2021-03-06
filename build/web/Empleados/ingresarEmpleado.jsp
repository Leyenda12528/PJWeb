<%-- 
    Document   : ingresarEmpleado
    Created on : 04-16-2019, 03:45:34 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico"/>
        <title><fmt:message key="label.TituloIe"/></title>
    </head>
    <body id="page-top">  
        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container-fluid">
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.TituloIe"/></h2>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary"><fmt:message key="label.inicio"/></a>
                </div>
                <c:if test="${param.error == 1}">
                    <div class="alert alert-danger">
                        <strong><fmt:message key="label.JD-ya-existe"/></strong><br>
                    </div>
                </c:if>
                <c:if test="${param.error == 2}">
                    <div class="alert alert-danger">
                        <strong><fmt:message key="label.JF-ya-existe"/></strong><br>
                    </div>
                </c:if>
                <c:if test="${param.exito == 1}">
                    <div class="alert alert-success">
                        <strong><fmt:message key="label.empleado-ingresado"/></strong><br>
                    </div>
                </c:if>
                <c:if test="${param.exito == 2}">
                    <div class="alert alert-success">
                        <strong><fmt:message key="label.empleado-modificado"/></strong><br>
                    </div>
                </c:if>
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
                                        <label for="codogo" ><fmt:message key="label.codigoe"/></label>
                                        <div class="input-group">
                                            <input  type="text" class="form-control" name="codigo" width="12 px" id="codigo" placeholder="" readonly="" value="${q6.rowCount}">
                                        </div>
                                        <label for="nombres" ><span class="fas fa-asterisk" ></span><fmt:message key="label.nombres"/></label>
                                        <div class="input-group">

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
                        </div>

                    </div>
                </form>

            </div>
            <script src="js/bootstrap.min.js"></script>
            <script src="assets/jquery-3.3.1.min.js"></script>
            <script src="../assets/validaciones/validacion.js"></script>
    </body>
</html>
