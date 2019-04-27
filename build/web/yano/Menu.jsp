<%-- 
    Document   : Menu
    Created on : 10-abr-2019, 10:02:34
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
        <title>Menu</title>
    </head>
    <body>
        <c:set var="usuario" value="${sessionScope['loginUser']}"/>
        <c:set var="texto" value="Musica probando XD"/>
        <c:set var="prueba" value="${param.id}"/>
        <c:if test="${empty usuario}">
            <c:redirect url="Login.jsp">
                <c:param name="error" value="Inicie Sesion PrimeroM"/>
            </c:redirect>
        </c:if>
        
        <div class="container">
            <div class="row">&nbsp;</div>
            <div class="panel panel-primary">
                <div class="panel-heading"><fmt:message key="label.bienvenido"/></div>
                <div class="panel-body">
                    <p><fmt:message key="label.usuario"/> <strong><c:out value="${usuario}"/></strong></p>
                    <a href="prueba.jsp">Probando Session</a>
                    <br/>
                    <h2>Texto a Enviar</h2>
                    <a href="Menu.jsp?id=${texto}" class="form-control"><c:out value="${texto}"/></a>
                    <h2>Texto Enviado</h2>
                    <input type="text" value="${prueba}">
                    
                    <form action="Menu.jsp" method="post">
                        <input type="hidden" name="id" value="${texto}"/>
                        <input type="submit" class="form-control" value="Enviar"/>
                    </form>
                    <%--<form action="prueba.jsp" method="post">
                        <label class="form-control" id="pru" name="pru">Probando</label>
                        <input type="submit" value="Enviar"/>
                    </form>--%>
                    <hr><hr>
                    
                    <label></label>
                    
                    
                </div>
            </div>
        </div>
    </body>
</html>
