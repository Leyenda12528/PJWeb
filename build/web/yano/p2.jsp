<%-- 
    Document   : p2
    Created on : 18-may-2019, 4:46:41
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/assets/prop/java.css" rel="stylesheet" type="text/css"/>        
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title>Login</title>
    </head>
    <body id="page-top" >
        <div class="container">
            <div class=" shadow p-5 text-center">
                <h2><fmt:message key="label.logintitle"/></h2>
                <c:set var="d" value="label.e${param.error}"/>
                <c:if test="${not empty param.error}">
                    <div class="alert alert-danger">
                        <strong>Error! </strong> <fmt:message key="${d}"/>!!
                    </div>
                </c:if>
            </div>
            <div class=" p-5 text-center">
                
            </div>
            <div class="row">
                <div class="col-lg-5">
                    <div class=" mb-4">
                        <img class="img-fluid rounded mx-auto d-block" src="Imas/java.png" alt="logo">
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="  mb-4">                        
                        <div class="card-body">
                            <form role="form" action="Controlador/empleadosDAO.jsp" method="post" >
                                <div class="form-group" >                                    
                                    <div class="iconos">
                                        <i class="fas fa-at"></i>
                                        <input type="email"  class="form-control" id="correo" name="correo" placeholder="<fmt:message key="label.correo"/>" required=""
                                               pattern="[A-Za-z0-9._+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="iconos">
                                        <i class="fas fa-key"></i>
                                        <input type="password" class="form-control" id="contra" name="contra" placeholder="<fmt:message key="label.password"/>" required=""
                                               pattern="[A-Za-z0-9]+" title="Solo letras y numeros">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-lg btn-primary btn-block" type="submit" id="btnlogin" name="btnlogin"><fmt:message key="label.login"/></button>
                                </div>
                            </form>
                        </div>                        
                    </div>
                </div>                
            </div>
        </div>
    </body>
</html>

