<%-- 
    Document   : asignacionEmpleados
    Created on : 04-17-2019, 01:16:14 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" /> 

<sql:query var="prog" dataSource="jdbc/mysql" scope="request">
    select id_empleado,CONCAT(nombre_emp,' ',apellidos) nombre from empleados where id_empleado=?
    <sql:param value="${param.id}"/>
</sql:query>
<sql:query var="prob" dataSource="jdbc/mysql" scope="request">
    select id_empleado,CONCAT(nombre_emp,' ',apellidos) nombre from empleados where id_empleado=?
    <sql:param value="${param.idt}"/>
</sql:query>
     <c:set var="idcasop" value="Log19013"/>
     <sql:query var="fecha" dataSource="jdbc/mysql" scope="request">
    select fecha_limite from caso where id_caso=?
   <sql:param value="${idcasop}"/>
</sql:query>
    
      <c:forEach items="${fecha.rows}" var="ff">
         <c:if test="${empty ff.fecha_limite}">
             <style>
                 #sf{
                     display: none;
                 }
             </style>
         </c:if>
      </c:forEach>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <title><fmt:message key="label.titleA"/></title>
    </head>
    <body id="page-top">  

        <jsp:include page="../Controlador/Consultas.jsp"/>
        <div id="wrapper">
            <jsp:include page="/Menu_1_1.jsp" />
            <div class="container-fluid">
                <form role="form" action="../Controlador/asignacionDAO.jsp"  method="POST" >
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample" class="d-block card-header py-3"  aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.infoA"/></h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCardExample">
                                    <div class="card-body">
                                       
                                        <strong><fmt:message key="label.nomC"/></strong><c:out value="${idcasop}"/> 
                                        <br/>
                                        <strong><fmt:message key="label.deptoA"/> </strong><c:out value="${loginB.id_departamento}"/>  <c:out value="${loginB.departamento}"/>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-6 mb-4">
                            <div class="card bg-primary text-white shadow">
                                <div class="card-body">
                                    <a class="btn btn-primary btn-lg" id="pro" href="../Empleados/programadores.jsp?op=1&idcaso=<c:out value="${idcasop}"/>"> 
                                        <fmt:message key="label.asigProgramador"/>
                                    </a>
                                    <div class="text-white-50 small"></div>
                                    <div class="col-auto">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                            <div class="card bg-warning text-white shadow">
                                <div class="card-body">
                                    <a class="btn btn-warning btn-lg" href="../Empleados/probadores.jsp?op=1&idcaso=<c:out value="${idcasop}"/>" >
                                        <fmt:message key="label.asigProbador"/>
                                    </a>
                                    <div class="text-white-50 small"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 mb-4">
                            <c:set value="Log19001" var="idcaso"/> <!-- tomar de paramatros enviados de pagina principal -->
                            <a class="btn btn-secondary" href="javascript:mostrar()" >
                                <fmt:message key="label.asigver"/>
                            </a>
                        </div>


                        <div class="col-lg-12" >
                            <!-- Basic Card Example -->

                            <div class="card shadow mb-4">


                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.asignacionp"/></h6>
                                </div>
                                <div class="card-body col-lg-4">
                                    <div  class="form-group">

                                        <label for="" ><span class="fas fa-asterisk" ></span><fmt:message key="label.fechalimite"/></label>
                                        <div class="input-group">
                                             <div class="input-group">
                                             <input type="text" size="" class="form-control text-hide"  id="idcaso" name="idcaso" value="<c:out value="${idcasop}"/>">
                                        </div>
                                        <div class="input-group" id="sf">
                                            <div class="input-group">
                                                   <a href="#" data-toggle="popover" title="<fmt:message key="label.indicaciones"/>" data-content="<fmt:message key="label.fechainfo"/>"><fmt:message key="label.pop"/></a>
                                            </div>
                                        <label for="" ><span class="text-success " ></span><fmt:message key="label.fechae"/></label>
                                        
                                          
                                         <c:forEach items="${fecha.rows}" var="fecha">
                                                   <input type="text" size="" class="form-control"  id="fechal" name="fechal" value="${fecha.fecha_limite}">
                       
                                             </c:forEach>
       
                                        </div>
                                            
                                            <input  type="date" class="form-control"  min="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}"/>"
                                                    name="fechalimite" id="fechalimite" 
                                                    <c:forEach items="${fecha.rows}" var="f">
                                                    <c:if test="${empty f.fecha_limite}"> required</c:if></c:forEach>>
                                            <span  class="invalid-feedback" ></span>  
                                        </div> 
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-success"  value="<fmt:message key="label.asig"/>" id="btnAsignarp" name="btnAsignarp" >
                            </div>
                        </div>

                    </div>

                </form>
                <sql:query var="modal" dataSource="jdbc/mysql" scope="request">
                    select ec.id_empleado, CONCAT( nombre_emp,' ',apellidos) Nombre,nombre_cargo from empleados e INNER JOIN empleados_caso ec ON ec.id_empleado=e.id_empleado INNER JOIN cargo ca on ca.id_cargo=e.id_cargo where id_caso=?
                    <sql:param value="${idcasop}"/>
                </sql:query>

                <div class="modal" id="modal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-primary text-uppercase" ><fmt:message key="label.asigemp"/></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table>
                                    <c:forEach var="emp" items="${modal.rows}">
                                        <tr>
                                            <td class="text-xs font-weight-bold text-success text-uppercase mb-1">${emp.nombre_cargo}</td> 
                                        </tr>
                                        <tr>
                                            <td class="text-xs font-weight-light text-lg text-black-50 mb-1">${emp.id_empleado}</td>
                                            <td class="text-xs font-weight-light text-lg text-black-50 mb-1">${emp.Nombre}</td>

                                        </c:forEach>     
                                    </tr>

                                </table>

                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="label.asigcerrar"/></button>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>

            <!--SECCIÓN PARA MOSTRAR MENSAJES DE ERROR O CONFIRMACIÓN DE ALGÚN PROCESO-->
            <c:if test="${not empty param.exito}">
                <script>
                            alertify.success('${param.exito}');
                </script>
            </c:if>
            <c:if test="${not empty param.error}">
                <script>
                            alertify.error('${param.error}')
                </script>
            </c:if>
            <!--SE CAPTURA UN PARAMETRO ESPECIAL PARA VERIFICAR SI DESEA MODIFICAR EL EMPLEADO-->
            <c:if test="${not empty param.errorm}">
                <c:set value="${param.idc}" var="casoid"/>
                <script>
                    alertify.confirm("¿Desea sustituir por el nuevo empleado seleccionado?", function (e) {
                        if (e) {

                            location.href = "../Controlador/asignacionDAO.jsp?modi=" +${param.ide} + "&cargo=" +${param.c} + "&casoid=<c:out value="${param.idc}"/>";
                        }
                    });
                    alertify.error('${param.errorm}');

                </script>
            </c:if>
            <script>
                function verificar(id) {

                    alertify.confirm("¿Realmente deseas inhabilitar a este empleado?", function (e) {
                        if (e) {
                            location.href = "asignacionEmpleados.jsp?idcaso=" + id;

                        }
                    });
                }

                function mostrar() {
                    $('#modal').modal('show');
                }
                
                                                            
                $(document).ready(function(){
                  $('[data-toggle="popover"]').popover();   
                });
</script> 
            </script>
            <script src="js/bootstrap.min.js"></script>
            <script src="assets/jquery-3.3.1.min.js"></script>
            <script src="../assets/validaciones/validacion.js"></script>
            <script src="../assets/validaciones/asignacion.js"></script>
    </body>
</html>
