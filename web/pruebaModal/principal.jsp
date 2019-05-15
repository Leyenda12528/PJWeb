<%-- 
    Document   : principal
    Created on : 05-14-2019, 08:31:27 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <body id="page-top"> 
        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container mt-3">
                <strong><fmt:message key="label.deptoA"/> </strong><c:out value="${loginB.id_departamento}"/>  <c:out value="${loginB.departamento}"/>
                <h2>Activate Modal with JavaScript</h2>
                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-primary" id="myBtn">Open Modal</button>
                <c:set value="Log19001" var="idcaso"/>
                <!-- The Modal -->

                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-lg" style="height: 100%;">
                        <div class="modal-content modal-full-height" id="sudo" style="height: 80%;">

                        </div>
                    </div>
                </div>

            </div>
            <h1 style="width: 100%"></h1>
            <li><a href="otro.jsp?variable=${idcaso}&depto=${loginB.departamento}" class="btn btn-primary li-modal">Lab 6</a></li>
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

            <script>
                $(document).ready(function () {
                    $("#myBtn").click(function () {
                        $("#myModal").modal();
                        var datos = "<object type='text/html' data='otro.jsp' style='width: 100%; height: 100%;' ></object>";
                        document.getElementById("sudo").innerHTML = datos;
                        //document.getElementById("sudo").innerHTML='<object type="text/html" data="otro2.html" style="width: 100%; height: 100%;" ></object>';

                    });
                });

            </script>

    </body>
</html>
