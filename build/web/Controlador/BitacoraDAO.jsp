<%-- 
    Document   : Bitacora
    Created on : 15-may-2019, 17:13:53
    Author     : jorge
--%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 <%-- ACTUALIZAR bitcora--%>
    <% if (request.getParameter("btnActualizarBita") != null) {%>
        <sql:update var="casoBitaU" dataSource="jdbc/mysql">
        update caso set porcentaje_avance = ? where id_caso = ?
        <sql:param value="${param.porc}"/>
        <sql:param value="${param.id_caso}"/>
        </sql:update>
        
        <sql:update var="casoBitaU2" dataSource="jdbc/mysql">
        update bitacoras set descripcion_actividad = ? where id_caso = ?
        <sql:param value="${param.descripcion_act}"/>
        <sql:param value="${param.id_caso}"/>
        </sql:update>
        <c:redirect url="../Casos/CasosAsignados.jsp">
            <c:param name="exito" value="1"/>
        </c:redirect>
    <%}%>

 <%-- FINALIZAR bitacora--%>
    <c:if test="${param.f == 1 && param.id_caso != null}">                       
        <sql:update var="casoBitaU" dataSource="jdbc/mysql">
        update caso set porcentaje_avance = ?, id_estado = ? where id_caso = ?
        <sql:param value="${100}"/>
        <sql:param value="${4}"/>
        <sql:param value="${param.id_caso}"/>
        </sql:update> 
        <c:redirect url="../Casos/CasosAsignados.jsp">
            <c:param name="exito" value="2"/>
        </c:redirect>
    </c:if>
    

 <%-- ACEPTAR bitacora--%>
    <% if (request.getParameter("btnAceptarBita") != null) {%>    
        <c:set var="correlativo" value="${param.fechaprodc}"/>
        <%
            String d = "" + pageContext.getAttribute("correlativo");
            String[] f2 = d.split("-");
            String f3="";
            f3 = f2[2]+"-"+f2[1]+"-"+f2[0];
            pageContext.setAttribute("correlativo", f3);
        %>
        <sql:update var="casoBitaU" dataSource="jdbc/mysql">
            update caso set id_estado = ?, fecha_produccion = ? where id_caso = ?
            <sql:param value="${7}"/>
            <sql:param value="${correlativo}"/>
            <sql:param value="${param.id_caso}"/>
        </sql:update>
        <c:redirect url="../Casos/CasosAsignados.jsp">
            <c:param name="exito" value="3"/>
        </c:redirect>
    <%}%>

 <%-- RECHAZAR bitacora--%>
    <% if (request.getParameter("btnRechazarBita") != null) {%>
        <sql:update var="casoBitaU" dataSource="jdbc/mysql">
        update caso set id_estado = ? where id_caso = ?
        <sql:param value="${6}"/>
        <sql:param value="${param.id_caso}"/>
        </sql:update>
        
        <sql:update var="casoBitaU2" dataSource="jdbc/mysql">
        update bitacoras set observaciones = ? where id_caso = ?
        <sql:param value="${param.Observaciones}"/>
        <sql:param value="${param.id_caso}"/>
        </sql:update>
        <c:redirect url="../Casos/CasosAsignados.jsp">
            <c:param name="exito" value="1"/>
        </c:redirect>
    <%}%>