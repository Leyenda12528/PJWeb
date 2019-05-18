<%-- 
    Document   : fecha
    Created on : 05-16-2019, 07:55:24 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="usuario" value="${sessionScope['loginUser']}"/>
<c:if test="${empty usuario}">
    <c:redirect url="Login.jsp">
        <c:param name="error" value="2"/>
    </c:redirect>
</c:if>
<c:if test="${loginB.id_cargo != 1 && loginB.id_cargo != 2}">
    <c:redirect url="../index.jsp">
        <c:param name="error" value="1"/>
    </c:redirect>
</c:if>
<c:set var="area" value="${fn:substring(loginB.departamento,0,3)}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Imas/java.ico" />
        <title><fmt:message key="label.rtitle"/></title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="Menu_1_1.jsp" />
            <jsp:include page="/Controlador/Consultas.jsp" />
            <div class="container-fluid">
                <div class="row  d-flex justify-content-between align-items-center">
                    <h2 class="media-heading font-weight-bold text-black-50"><fmt:message key="label.rtitle"/></h2>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary"><fmt:message key="label.inicio"/></a>
                </div>                
                <div class="row">
                    <div class="col-lg-6">
                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.rtitle2"/></h6>
                            </div>
                            <div class="card-body">
                                <form role="form" action="Reportes/reporteInfoCaso.jsp"  method="POST" target="_blank">
                                    <div  class="form-group">
                                        <label><fmt:message key="label.rdepto"/></label>
                                        <div class="input-group">
                                            <input class="form-control" readonly="" value="${loginB.departamento}" name="n" id="n" >
                                        </div>
                                        <input class="form-control text-hide"  value="${area}" name="depto" id="depto" >
                                    </div>
                                    <div  class="form-group">
                                        <select  class="custom-select" id="estado" name="estadoc" required>
                                            <option value="" ><fmt:message key="label.rselect"/></option>
                                            <c:forEach var="name1" items="${r.rows}">
                                                <option value="${name1.id_estado}">${name1.nombre_estado}</option>
                                            </c:forEach>
                                        </select>
                                        <div  class="form-group">
                                            <label><span class="fas fa-asterisk" ></span><fmt:message key="label.rfecha1"/></label>
                                            <div class="input-group">
                                                <input  type="date" class="form-control"  max="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}"/>" name="fecha1" id="fecha1"  required>                                                
                                            </div> 
                                        </div>
                                        <div  class="form-group">
                                            <label><span class="fas fa-asterisk" ></span><fmt:message key="label.rfecha2"/></label>
                                            <div class="input-group">
                                                <input  type="date" class="form-control"  max="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}"/>" name="fecha2" id="fecha2"  required>
                                            </div> 
                                        </div>
                                    </div>
                                    <input type="submit"  class="btn btn-google btn-block" value="<fmt:message key="label.rgenerar"/>">
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><fmt:message key="label.rtitle2r"/></h6>
                            </div>
                            <div class="card-body">
                                <form role="form" action="Reportes/Reporte.jsp"  method="POST"  target="_blank">
                                    <div  class="form-group">
                                        <label><fmt:message key="label.rdepto"/></label>
                                        <div class="input-group">
                                            <input class="form-control " readonly="" value="${loginB.departamento}" name="n" id="n" >
                                        </div> 
                                        <input   class="form-control text-hide"  value="${area}" name="depto" id="depto" >
                                    </div>
                                    <div  class="form-group">
                                        <select  class="custom-select" id="estado" name="cargo" required>
                                            <option value="" ><fmt:message key="label.rselectc"/></option>
                                            <c:forEach var="name1" items="${c.rows}">
                                                <option value="${name1.id_cargo}">${name1.nombre_cargo}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div  class="form-group">
                                        <select  class="custom-select" id="estado" name="estadoc" required>
                                            <option value="" ><fmt:message key="label.rselect"/></option>
                                            <c:forEach var="name1" items="${r.rows}">
                                                <option value="${name1.id_estado}">${name1.nombre_estado}</option>
                                            </c:forEach>
                                        </select>
                                        <div  class="form-group">
                                            <label><span class="fas fa-asterisk" ></span><fmt:message key="label.rfecha1"/></label>
                                            <div class="input-group">
                                                <input  type="date" class="form-control"  max="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}"/>" name="fecha1" id="fecha1"  required>
                                            </div> 
                                        </div>
                                        <div  class="form-group">
                                            <label><span class="fas fa-asterisk" ></span><fmt:message key="label.rfecha2"/></label>
                                            <div class="input-group">
                                                <input  type="date" class="form-control"  max="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}"/>" name="fecha2" id="fecha2"  required>                                                
                                            </div> 
                                        </div>
                                    </div>

                                    <input type="submit"  class="btn btn-google btn-block" value="<fmt:message key="label.rgenerar"/>">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
