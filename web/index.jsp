<%-- 
    Document   : index
    Created on : 09-abr-2019, 23:27:40
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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4">
                    <h2><fmt:message key="label.iniciarsesiontitle"/></h2>
                    <c:if test="${not empty param.error}">
                        <div class="alert alert-danger">
                            <strong>Error!</strong><c:out value="${param.error}"/>
                        </div>
                    </c:if>
                    <form role="form" action="Plogin.jsp" method="post">
                        <div class="form-group">
                            <label for="correo"><fmt:message key="label.usuario"/></label>
                            <input type="text" class="form-control" id="correo" name="correo" placeholder="<fmt:message key="label.usuario"/>" required="">
                        </div>
                        <div class="form-group">
                            <label for="contra"><fmt:message key="label.password"/></label>
                            <input type="password" class="form-control" id="contra" name="contra" placeholder="<fmt:message key="label.password"/>" required="">
                        </div>
                        <div class="form-group">
                            <button class="btn btn-lg btn-primary btn-block" type="submit"><fmt:message key="label.iniciarsesion"/></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
