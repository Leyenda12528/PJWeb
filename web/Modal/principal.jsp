<%-- 
    Document   : principal
    Created on : 05-14-2019, 08:31:27 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<c:set var="usuario" value="${sessionScope['loginUser']}"/>
<c:if test="${empty usuario}">
    <c:redirect url="../Login.jsp">
        <c:param name="error" value="2"/>
    </c:redirect>
</c:if>
<c:set var="area" value="${fn:substring(loginB.departamento,0,3)}"/>
<sql:query var="solipq" dataSource="jdbc/mysql" scope="request">
    SELECT  caso.id_caso, caso.nombre_caso, pdf_caso.pdf, pdf_caso.pdf_jefe
    FROM    caso INNER JOIN pdf_caso ON caso.id_caso = pdf_caso.id_caso
    <c:if test="${loginB.id_cargo != 0}">
        WHERE   (caso.id_caso LIKE ?) 
    </c:if>
    ORDER BY id_caso
    <c:if test="${loginB.id_cargo != 0}">
        <sql:param value="${area}%"/>
    </c:if>        
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Imas/java.ico"/>
        <title><fmt:message key="label.detalles-caso"/></title>
    </head>
    <body id="page-top"> 
        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container mt-3">
                <c:if test="${casos.rowCount < 1}">
                    <div class="alert alert-success">
                        <strong><fmt:message key="label.sin-Casos-Devueltos"/>!</strong>
                        <br>
                    </div>
                </c:if>
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.detalles-caso"/></h2>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary"><fmt:message key="label.inicio"/></a>
                </div>
                
                <strong><fmt:message key="label.deptoA"/>:</strong><c:out value="${loginB.id_departamento}"/>  <c:out value="${loginB.departamento}"/>
                
                
                <%--
                <c:set value="Log19001" var="idcaso"/>
                ${pageContext.request.contextPath}
                <a href="otro.jsp?variable=${idcaso}&depto=${loginB.departamento}" class="btn btn-primary li-modal">Lab 6</a>
                <hr class="sidebar-divider">
                --%>
                <c:forEach var="solipFor" items="${solipq.rows}" varStatus="status">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><c:out value="${solipFor.id_caso}"/>
                                <c:out value="${solipFor.nombre_caso}"/></h6>
                        </div>
                        <div class="card-body">
                            <c:if test="${fn:length(solipFor.pdf) > 0}">
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/Modal/VERPDF.jsp?dip=${solipFor.id_caso}&pit=1" target="_blank"><fmt:message key="label.verpdfjf"/></a>
                            </c:if>
                            <c:if test="${fn:length(solipFor.pdf_jefe) > 0}">
                                <a class="btn btn-google" onclick="" href="${pageContext.request.contextPath}/Modal/VERPDF.jsp?dip=${solipFor.id_caso}&pit=2" target="_blank"><fmt:message key="label.verpdfjd"/></a>
                            </c:if>
                            <a class="btn btn-facebook li-modal" onclick="" href="${pageContext.request.contextPath}/Modal/otro.jsp?variable=${solipFor.id_caso}&depto=${loginB.departamento}"><fmt:message key="label.detalles"/></a>                            
                        </div>
                    </div>
                </c:forEach>
                
                <!-- The Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-lg" style="height: 100%;">
                        <div class="modal-content modal-full-height" id="sudo" style="height: 80%;">

                        </div>
                    </div>
                </div>
            </div>                        
            <script>
                $('.li-modal').on('click', function (e) {
                    e.preventDefault();
                    $('#myModal').modal('show');
                    //$('#theModal').modal('show').find('.modal-dialog').load($(this).attr('href'));;  
                    //$(this).attr('href')
                    // alert($(this).attr('href'));
                    var datos = "<object type='text/html' data='" + $(this).attr('href') + "' style='width: 100%; height: 100%;' ></object>";
                    document.getElementById("sudo").innerHTML = datos;
                    //document.getElementById("sudo").innerHTML='data="otro.html"';
                    //.find('.modal-content').load($(this).attr('href'));
                });
            </script>           

    </body>
</html>
