<%-- 
    Document   : Bitacora
    Created on : 04-11-2019, 11:45:31 AM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="stylesheet" href="css/bootstrap.min.css">
          <title>Bitacora</title>
    </head>
    <body>
                       
        <div class="container">
            <h3>Bitacora</h3>
            <p>
            <h5></h5>
       
        
    </div> 
    <div class="container">
        <div class="row">
            <h3></h3>
        </div>
        <div class="row col-md-5">
            <form role="form" action=""  method="POST" id="needs-validation" > <%--cambiar pagina JSP  --%>
                <div class="col-md-10">
                    <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong></div>
                    <div  class="form-group">
                        <span class=""></span><strong><fmt:message key="label.idcaso"/> </strong><%-- colocar id junto a el label--%>
                        <br/><span class=""></span><strong><fmt:message key="label.nombrecaso"/> </strong>  <%-- colocar id junto a el label--%>
                        <div class="input-group">
                            <input size="500" type="text" class="form-control" name="nombre_caso" id="nombre_caso" placeholder="" required>
                            <span  class="help-block" ></span>  

                        </div> 

                    </div>
                     <div class="form-group">
                         <span class="glyphicon glyphicon-asterisk"></span><strong><fmt:message key="label.actividad"/></strong>
                        <div class="input-group">
                            <textarea class="form-control" rows="15" cols="50" name="descripcion_act" id="descripcion_act"></textarea>
                             <span  class="help-block" ></span>  
                        </div>
                        <span class="help-block" ></span>
                    </div>
                     <div class="form-group">
                         <span class="glyphicon glyphicon-asterisk"></span><strong><fmt:message key="label.observaciones"/></strong>
                        <div class="input-group">
                            <textarea class="form-control" rows="15" cols="50" name="Observaciones" id="Observaciones"></textarea>
                             <span  class="help-block" ></span>  
                        </div>
                        <span class="help-block" ></span>
                    </div>
                    
                    <input type="submit" class="btn btn-info" value="<fmt:message key="label.guardar"/>" id="btnGuardar" name="btnGuardar" >
                </div>
            </form>

            <%-- Verificando si la variable resultado esta vacia--%>
            <%if (request.getParameter("resultado") != null) {
            %>
            <div class="alert alert-success col-md-10">
                <b><%=request.getParameter("resultado")%></b>
            </div>
            <%
                }
            %> 


        </div>
        <!--notese el uso de jsp:include -->
     
    </div>
    </body>
</html>
