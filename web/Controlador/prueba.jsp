<%-- 
    Document   : prueba
    Created on : 04-17-2019, 09:15:01 PM
    Author     : less_
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:useBean id="empleado"   scope="page" class="Beans.Empleado"/>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="idcaso" value="${param.idcaso}"/>
        <c:set var="fechalimite" value="${param.fechalimite}"/>
        HOLA MUNDO <c:out value="${fechalimite}"/>
       <script>
         
    alert("hola"+"<c:out value="${idcaso}"/>");
</script>
<% 
 if (request.getParameter("btnAsignarp") != null) {
%>
<sql:update var="fecha" dataSource="jdbc/mysql">
  update caso set fecha_limite=?,id_estado=3 where id_caso=?
    <sql:param value="${fechalimite}"/>
     <sql:param value="${idcaso}"/>
</sql:update>
<c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
    <c:param name="exito" value="Empleado Ingresado con exito"/>
</c:redirect>

<%}%>

    </body>
</html>

