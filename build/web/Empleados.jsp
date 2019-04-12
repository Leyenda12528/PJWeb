<%-- 
    Document   : Empleados
    Created on : 03-16-2019, 10:14:21 AM
    Author     : less_
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Empleados</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">


    </head>
    <body>

    <div class="container"  style="margin-left: 15px">
        <div class="row">
             <h3><fmt:message key="label.mantenimiento"/></h3>
            <p>
            <h5><fmt:message key="label.infoe"/></h5>
        </div>
       
           
            <div class="row col-md-5">
                <form role="form" action="mantenimiento.jsp"  method="POST" id="needs-validation" > <%--cambiar pagina JSP  --%>
                    <div class="col-md-10">
                        <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.requeridos"/></strong></div>
                        <div  class="form-group">
                            <strong> <span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.nombres"/></strong>
                            <div class="input-group">
                                <input size="500" type="text" class="form-control" name="nombres" id="nombres" placeholder="Ingresa el nombre" required>
                                <span  class="help-block" ></span>  

                            </div> 

                        </div>
                        <div class="form-group">
                            <strong> <span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.apellido"/></strong>
                            <div class="input-group">
                                <input type="text" size="500" class="form-control" id="apellidos" name="apellidos" placeholder="Ingresa el apellido" required>
                                <span  class="help-block" ></span>  
                            </div>
                            <span class="help-block" ></span>
                        </div>
                        <div class="form-group">
                            <strong> <span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.edad"/></strong>

                            <div class="input-group">
                                <input type="text" size="500" class="form-control" id="edad" name="edad" placeholder="Ingrese su edad" required>
                                <span  class="help-block" ></span>  
                            </div>

                        </div>
                        <div class="form-group">
                            <strong> <span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.dir"/></strong>

                            <div class="input-group">
                                <input type="text" size="500"  class="form-control" id="direccion" name="direccion" placeholder="Ingrese su dirección" required>
                                <span  class="help-block" ></span>  
                            </div>

                        </div>

                        <div class="form-group">
                            <strong> <span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.tel"/></strong>

                            <div class="input-group">
                                <input type="text" size="500" class="form-control" id="telefono" name="telefono" placeholder="Ingresa el telefono" required>
                                <span  class="help-block" ></span>  
                            </div>

                        </div>
                        <div class="form-group">
                            <strong> <span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.correo"/></strong>

                            <div class="input-group">
                                <input type="text" size="500" class="form-control" id="correo" name="correo" placeholder="Ingrese su e-mail" required >
                                <span class="help-block"></span>
                            </div>

                        </div>
                        <div class="form-group">
                            <strong> <span class="glyphicon glyphicon-asterisk"></span><fmt:message key="label.pass"/></strong>

                            <div class="input-group">
                                <input type="password" size="500"  class="form-control" id="password" name="password" placeholder="Ingrese su contraseña" required >
                                <span class="help-block" id="error"></span>
                            </div>

                        </div>
                        <input type="submit" class="btn btn-info" value='<fmt:message key="label.guardar"/>' id="btnGuardar" name="btnGuardar" >
                    </div>
                </form>
            </div>
            <%-- Verificando si la variable resultado esta vacia--%>
            <%if (request.getParameter("resultado") != null) {
            %>
            <div class="alert alert-success col-md-10">
                <b><%=request.getParameter("resultado")%></b>
            </div>
            <%
                }
            %> 


       
        <!--notese el uso de jsp:include -->
     
    </div>
    <script src="js/bootstrap.min.js"></script>
    <script src="assets/jquery-3.3.1.min.js"></script>
    <script src="assets/validacion.js"></script>

</body>
</html>
