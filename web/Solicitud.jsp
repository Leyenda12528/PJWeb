<%-- 
    Document   : Solicitud
    Created on : 04-11-2019, 11:30:02 AM
    Author     : less_
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="Imas/java.ico" />        
        <title>Solicitud</title>
    </head>
    <body id="page-top">         
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container-fluid">
                <h4><fmt:message key="label.titlesoli" /></h4>
                <div class="row col-md-5" style="width: 600px; margin: auto auto;">
                    <form role="form" action=""  method="POST">
                        <div class="input-group col-3">
                            <fmt:message key="label.idcaso"/>&nbsp;<input type="text" class="form-control" name="id_caso" id="id_caso" readonly="" value="">
                        </div>
                        <div  class="form-group">                            
                            <input type="text" class="form-control" name="nombre_caso" id="nombre_caso" placeholder="<fmt:message key="label.namesoli"/>" required 
                                   pattern="[A-Za-z0-9]+" title="Solo letras y numeros">
                        </div>
                        <div class="form-group">                            
                            <textarea class="form-control" rows="10" cols="60" name="descripcion" id="descripcion"
                                      onkeypress="return val(event)" required="" placeholder="<fmt:message key="label.descripsoli"/>"></textarea>
                        </div>                        
                        <input type="submit" class="btn btn-danger" value="Cargar PDF" id="btnGuardar" name="btnPDF" >
                        <input type="submit" class="btn btn-info" value="<fmt:message key="label.solisoli"/>" id="btnGuardar" name="btnGuardar" >
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
            </div>
            <script src="js/bootstrap.min.js"></script>
            <script src="assets/jquery-3.3.1.min.js"></script>
            <script src="assets/validacion.js"></script>
    </body>
    <script>
        var dd = /[A-Za-z0-9]/;
        function val(e){
            var tecla = (document.all) ? e.keyCode : e.which;
            tfin = String.fromCharCode(tecla);
            return dd.test(tfin);
        }        
    </script>
</html>
