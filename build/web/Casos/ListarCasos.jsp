<%-- 
    Document   : ListarCasos
    Created on : 04-17-2019, 09:51:14 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="shortcut icon" href="../Imas/java.ico" />
        <title>Listar casos</title>
    </head>
    <body id="page-top"> 
         <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container-fluid">
                <div class="card shadow mb-2">
                    <div class="card-header py-2">
                        <h6 class="m-0 font-weight-bold text-primary">Información de casos creados</h6>

                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th class="col-md-1">Nombre</th>
                                        <th>Requerimiento</th>
                                        <th>Descrpción</th>
                                        <th>Porcentaje Avance</th>
                                        <th>Fecha Limite</th>
                                        <th>Fecha produccion</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>                                   
                                    <c:forEach var="c" items="${q5.rows}">
                                        <tr>
                                            <td>${c.id_caso}</td>
                                            <td>${c.nombre_caso}</td>
                                            <td>${c.descrip_req}</td>
                                            <td>${c.descripcion_jefedes}</td>
                                            <td>${c.porcentaje_avance}</td>
                                            <td>${c.fecha_limite}</td>
                                            <td>${c.fecha_produccion}</td>
                                            <td>${c.nombre_estado}</td>              
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>                    
                </div> 
            </div>
    </body>
</html>
