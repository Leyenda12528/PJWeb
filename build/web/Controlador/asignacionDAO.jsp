<%-- 
    Document   : asignacionDAO
    Created on : 04-17-2019, 06:04:37 PM
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
        <c:set var="idcaso2" value="${param.casoid}"/>
        <c:set var="id" value="${param.id}"/>
        <c:set var="cargo" value="${param.cargo}"/>
        <c:set var="fechalimite" value="${param.fechalimite}"/>
        <c:set var="ide" value="${param.modi}"/>
        <c:set var="cargo" value="${param.cargo}"/>
        <sql:query var="query" dataSource="jdbc/mysql">
            select * from empleados_caso where id_caso=?
            <sql:param value="${idcaso}"/>
        </sql:query>
            
            <!-- Para verificar que no se ingrese más de un empleado-->
        <sql:query var="countTester" dataSource="jdbc/mysql">
            select COUNT(ec.id_empleado) FROM empleados_caso ec INNER JOIN empleados e ON e.id_cargo=4 and e.id_empleado=ec.id_empleado 
        </sql:query>

        <sql:query var="countProgramador" dataSource="jdbc/mysql">
            select COUNT(ec.id_empleado) FROM empleados_caso ec INNER JOIN empleados e ON e.id_cargo=4 and e.id_empleado=ec.id_empleado 
        </sql:query>
            <!--fin-->
        <% if (request.getParameter("id") != null) {%>
        <c:choose>
            <c:when test="${query.rowCount >=2 || countTester.rowCount>1 || countProgramador.rowCount>1}">
                <c:redirect url="../Casos/asignacionEmpleados.jsp?ide=${id}&c=${cargo}&idc=${idcaso}">                                                
                    <c:param name="errorm"  value="Los empleados ya fueron asignados"/>
                </c:redirect>
            </c:when>
            <c:otherwise>
                <sql:update var="agregarp" dataSource="jdbc/mysql">
                    insert into empleados_caso  values (?,?)
                    <sql:param value="${id}"/>
                    <sql:param value="${idcaso}"/>  
                </sql:update>
                <c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
                    <c:param name="exito" value="Empleado asignado con exito"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>

        <%}%>

        <%if (request.getParameter("btnAsignarp") != null) {%>
        <c:choose>
            <c:when test="${query.rowCount<2}">
                <c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
                    <c:param name="error" value="Verifique empleados asignados"/>
                </c:redirect>
            </c:when>
            <c:otherwise>
                <sql:update var="fecha" dataSource="jdbc/mysql">
                    update caso set fecha_limite=?,id_estado=3 where id_caso=?
                    <sql:param value="${fechalimite}"/>
                    <sql:param value="${idcaso}"/>
                </sql:update>
                <c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
                    <c:param name="exito" value="Asignación correcta"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>

        <%}%>


        <!--MODIFICAR EMPLEADOS ASIGNADOS-->
        <%if (request.getParameter("modi") != null) {%>
        <sql:update var="modificar" dataSource="jdbc/mysql">
            update empleados_caso ec 
            INNER JOIN empleados emp ON  ec.id_empleado=emp.id_empleado 
            set ec.id_empleado=? 
            WHERE  emp.id_cargo=? and ec.id_caso=?
            <sql:param value="${ide}"/>
            <sql:param value="${cargo}"/>
            <sql:param value="${idcaso2}"/>
        </sql:update>
        <c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
            <c:param name="exito" value="Asignación correcta"/>
        </c:redirect>
        <%}%>
    </body>
</html>




