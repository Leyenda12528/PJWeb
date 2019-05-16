<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:query var="q1" dataSource="jdbc/mysql" scope="request">
    SELECT id_empleado,nombre_emp,apellidos,edad,direccion,telefono,correo,nombre_cargo,nombre_depto,estado
    FROM empleados emp
    INNER JOIN departamentos dep ON dep.id_depto=emp.id_depto and emp.id_depto=dep.id_depto 
    INNER JOIN  cargo c ON c.id_cargo=emp.id_cargo 
    INNER JOIN estado_empleados ee ON ee.id_estado=emp.id_estado_emp    
</sql:query>

<sql:query var="q2" dataSource="jdbc/mysql" scope="request">
    select * from cargo
</sql:query>

<sql:query var="q3" dataSource="jdbc/mysql" scope="request">
    select * from departamentos
</sql:query>

<sql:query var="q4" dataSource="jdbc/mysql" scope="request">
    select * from estado_empleados
</sql:query> 
    
<sql:query var="q5" dataSource="jdbc/mysql" scope="request">
   select id_caso,nombre_caso,descrip_req,descripcion_jefedes,porcentaje_avance,fecha_limite,fecha_produccion, nombre_estado from caso INNER JOIN estados ON estados.id_estado=caso.id_estado
</sql:query>

<sql:query var="q6" dataSource="jdbc/mysql" scope="request">
    select * from empleados
</sql:query>
    <%--obtener el Correo del JD--%>
<sql:query var="q7" dataSource="jdbc/mysql" scope="request">
    select correo from empleados where id_cargo = 1 and id_depto = ?
    <sql:param value="${loginB.id_departamento}"/>
</sql:query>
        <%--obtener el Correo del JF--%>
<sql:query var="q8" dataSource="jdbc/mysql" scope="request">
    select correo from empleados where id_cargo = 2 and id_depto = ?
    <sql:param value="${loginB.id_departamento}"/>
</sql:query>
    
