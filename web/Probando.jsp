<%-- 
    Document   : Probando
    Created on : 18-abr-2019, 22:50:25
    Author     : jorge
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="${pageContext.request.contextPath}/assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/alertify.core.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/alertify.default.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .dato input{
                padding-left: 40px;
            }
            .dato i{
                position: absolute;
                padding: 10px;
            }
            #datop{
                background-image: url("Imas/prueba.jpg");
                background-repeat: no-repeat;
                background-size: auto;
                background-position: center; 
            }
        </style>
        
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title>Probando Login</title>
    </head>
    <body id="page-top" >        
        <div class="container" id="datop">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4" style="width: 600px; margin: auto auto;">
                    <br/><br/><br/><br/>
                    <h2 style="text-align: center;"><fmt:message key="label.logintitle"/></h2>
                    <c:if test="${not empty param.error}">
                        <div class="alert alert-danger">
                            <strong>Error! </strong><c:out value="${param.error}"/>
                        </div>
                    </c:if>
                    <form role="form" action="Plogin.jsp" method="post" >
                        <div class="form-group" >
                            <%--<label for="correo"><fmt:message key="label.correo"/></label>--%>
                            <div class="dato">
                                <i class="fas fa-at"></i>
                                <input type="email"  class="form-control" id="correo" name="correo" placeholder="<fmt:message key="label.correo"/>" required=""
                                       pattern="[A-Za-z0-9._+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$">
                            </div>
                            
                            <%--
                                pattern="^[_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})$"
                            --%>
                        </div>
                        <div class="form-group">
                            <%--<label for="correo"><fmt:message key="label.password"/></label>--%>
                            <div class="dato">
                                <i class="fas fa-key"></i>
                                <input type="password" class="form-control" id="contra" name="contra" placeholder="<fmt:message key="label.password"/>" required=""
                                       pattern="[A-Za-z0-9]+" title="Solo letras y numeros">
                                <input id="date" type="date" name="fecha" title="malo" required="">
                                <input id="datde" type="number" name="fec">
                                <input id="mo" type="text" name="fec">
                                <textarea name="hola" id="hola"></textarea>  
                                <%--pattern="[A-Za-z0-9]{1,}"> lo mismo --%>
                            </div>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-lg btn-primary btn-block" type="submit"><fmt:message key="label.login"/></button>
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
    </body>
        <script>
        var n = new Date();
        document.getElementById("date").min=n.getFullYear()+"-0"+(n.getMonth()+1)+"-"+n.getDate();
        
        document.getElementById("mo").value = n.getFullYear()+"-0"+(n.getMonth()+1)+"-"+n.getDate();
    </script>
</html>
