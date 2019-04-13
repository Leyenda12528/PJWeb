<%-- 
    Document   : Solicitud
    Created on : 04-11-2019, 11:30:02 AM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="stylesheet" href="css/bootstrap.min.css">
         
        <title>Solicitud</title>
    </head>
    <body>

        <div class="container">
            <h3>Solicitar caso</h3>
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
                        <label for="nombre" ><span class="glyphicon glyphicon-asterisk"></span>Código caso:</label>
                        <div class="input-group">
                            <input size="500" type="text" class="form-control" name="id_caso" id="id_caso" placeholder="" required>
                            <span  class="help-block" ></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="descripcion"><span class="glyphicon glyphicon-asterisk"></span>Descrpción:</label>
                        <div class="input-group">
                            <textarea class="form-control" rows="15" cols="50" name="descripcion" id="descripcion"></textarea>
                             <span  class="help-block" ></span>  
                        </div>
                        <span class="help-block" ></span>
                    </div>
                    
                    <input type="submit" class="btn btn-info" value="Guardar" id="btnGuardar" name="btnGuardar" >
                    
                    <input type="submit" class="btn btn-danger" value="Cargar PDF" id="btnGuardar" name="btnPDF" >
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
    <script src="js/bootstrap.min.js"></script>
    <script src="assets/jquery-3.3.1.min.js"></script>
    <script src="assets/validacion.js"></script>
    </body>
</html>
