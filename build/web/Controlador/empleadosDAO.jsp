<%-- 
    Document   : empleadosDAO
    Created on : 04-16-2019, 07:43:01 PM
    Author     : less_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:useBean id="empleado"   scope="page" class="Beans.Empleado"/>
<c:set var="nombres" value="${param.nombres}"/>
<c:set var="apellidos" value="${param.apellidos}"/>
<c:set var="edad" value="${param.edad}"/>
<c:set var="direccion" value="${param.direccion}"/>
<c:set var="telefono" value="${param.telefono}"/>
<c:set var="correo" value="${param.correo}" />
<c:set var="password" value="${param.password}"/>
<c:set var="password2" value="${param.password2}"/>
<c:set var="cargo" value="${param.cargo}"/>
<c:set var="depto" value="${param.depto}"/>
<c:set var="correo" value="${param.correo}"/>
<c:set var="codigo" value="${param.codigo}"/>
<c:set var="codigo2" value="${param.codigoe}"/>





<sql:query var="cargo1" dataSource="jdbc/mysql" scope="request">
    select * from empleados where id_cargo=1 and id_depto=?
    <sql:param value="${depto}"/>
</sql:query>
    <sql:query var="cargo2" dataSource="jdbc/mysql" scope="request">
    select * from empleados where id_cargo=2 and id_depto=?
       <sql:param value="${depto}"/>
</sql:query>
<c:choose>
    <c:when test="${cargo1.rowCount >=1 && cargo==1}">
         <c:redirect url="../Empleados/ingresarEmpleado.jsp">
                 <c:param name="error" value="no puede existir más de un jefe de desarrollo"/>
            </c:redirect>
    </c:when>
    <c:when test="${cargo2.rowCount >=1 && cargo==2}">
         <c:redirect url="../Empleados/ingresarEmpleado.jsp">
                 <c:param name="error" value="No puede existir más de un jefe funcional"/>
            </c:redirect>
    </c:when>
    <c:otherwise>
  
<%  if (request.getParameter("btnGuardar") != null) {%>
<sql:update var="insertar" dataSource="jdbc/mysql">
    insert into empleados  values (?,?,?,?,?,?,?,?,?,SHA2(?,256),0,SHA2(?,256))
    <sql:param value="${codigo}"/>
    <sql:param value="${nombres}"/>
    <sql:param value="${apellidos}"/>
    <sql:param value="${cargo}"/>
    <sql:param value="${depto}"/>
    <sql:param value="${edad}"/>
    <sql:param value="${direccion}"/>
    <sql:param value="${telefono}"/>
    <sql:param value="${correo}"/>
    <sql:param value="${password}"/>
    <sql:param value="${password2}"/>
</sql:update>

<%--Forward que se utiliza para redireccionar a la pagina de ingresaremp.jsp--%>
<c:redirect url="../Empleados/ingresarEmpleado.jsp">                                                
    <c:param name="exito" value="Empleado Ingresado con exito"/>
</c:redirect>

<% }%>
      
    </c:otherwise>
</c:choose>
    

<%  if (request.getParameter("btnModificar") != null) {%>
<sql:update var="modificar" dataSource="jdbc/mysql">
    UPDATE  empleados SET nombre_emp=?, apellidos=?, edad=?, direccion=?, telefono=?, correo=?, password_emp=?,
    id_cargo=?, id_depto=?, contraPublic=? WHERE id_empleado=?
    
    <sql:param value="${apellidos}"/>
    <sql:param value="${edad}"/>
    <sql:param value="${direccion}"/>
    <sql:param value="${telefono}"/>
    <sql:param value="${correo}"/>
    <sql:param value="${password}"/>
    <sql:param value="${cargo}"/>
    <sql:param value="${depto}"/>
    <sql:param value="${password2}"/>
    <sql:param value="${codigo}"/>
</sql:update>
<%--Forward que se utiliza para redireccionar a la pagina de ingresaremp.jsp--%>
<c:redirect url="../Empleados/ingresarEmpleado.jsp">                                                
    <c:param name="exito" value="Empleado Modificado con exito"/>
</c:redirect>
<% }%>

<%-- ELIMINAR--%>
<%  if (request.getParameter("codigoe") != null) {%>
<sql:update var="deshabilitar" dataSource="jdbc/mysql">
    update  empleados set id_estado_emp=1 where id_empleado=?
    <sql:param value="${codigo2}"/>
</sql:update>
<%--Forward que se utiliza para redireccionar a la pagina de ingresaremp.jsp--%>
<c:redirect url="../Empleados/ListarEmpleados.jsp">                                                
    <c:param name="exito" value="Empleado deshabilitado con exito"/>
</c:redirect>
    <% }%>

   <%--LOGIN--%>
    <%if (request.getParameter("btnlogin") != null) {%>
        <sql:query var="login" dataSource="jdbc/mysql">
            SELECT * from empleados where correo = ? and password_emp = sha2(?,256)
            <sql:param value="${param.correo}"/>
            <sql:param value="${param.contra}"/>
        </sql:query>
        <c:if test="${login.rowCount < 1}">            
            <c:redirect url="Login.jsp">                
                <c:param name="error" value="1"/>
            </c:redirect>
        </c:if>
        
        <c:forEach var="namea" items="${login.rows}">
            <c:set var="usuari" value="${namea.id_empleado}"/>
        </c:forEach>
        <sql:query var="logindato" dataSource="jdbc/mysql">
            SELECT  CONCAT(empleados.nombre_emp,' ',empleados.apellidos) as nombre
                     , empleados.id_cargo , cargo.nombre_cargo, empleados.id_depto, departamentos.nombre_depto
                     , empleados.correo, empleados.contraPublic
                     FROM            empleados INNER JOIN
                                    departamentos ON empleados.id_depto = departamentos.id_depto INNER JOIN
                                    cargo ON empleados.id_cargo = cargo.id_cargo
                     WHERE        empleados.id_empleado =  ?
                    <sql:param value="${usuari}"/>
        </sql:query>
        <jsp:useBean id="loginB" scope="session" class="Beans.User"/>
        <c:forEach var="name" items="${logindato.rows}">
            <c:set target="${loginB}" property="id" value="${usuari}"/>
            <c:set target="${loginB}" property="nombre" value="${name.nombre}"/>
            <c:set target="${loginB}" property="id_cargo" value="${name.id_cargo}"/>
            <c:set target="${loginB}" property="cargo" value="${name.nombre_cargo}"/> 
            <c:set target="${loginB}" property="id_departamento" value="${name.id_depto}"/>
            <c:set target="${loginB}" property="departamento" value="${name.nombre_depto}"/>
            <c:set target="${loginB}" property="correo" value="${name.correo}"/>
            <c:set target="${loginB}" property="contraP" value="${name.contraPublic}"/>
            
        </c:forEach>
        <c:set scope="session"
        var="loginUser"
        value="${usuari}"/>
        
        <c:redirect url="../index.jsp"/>
    <%}%>
