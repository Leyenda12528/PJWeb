<%-- 
    Document   : Plogin
    Created on : 10-abr-2019, 0:35:00
    Author     : jorge
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<jsp:useBean id="pru" scope="session" class="Beans.pru"/>

<%String correo = request.getParameter("correo");%>
<c:set var="correo" value="${param.correo}"/>
<c:set var="contra" value="${param.contra}"/>        


<c:set var="e1" value="${param.hola}"/>
<%
    String f = request.getParameter("fecha");
    String f3="";
    if(f!=null){
    String[] f2 = f.split("-");
     f3 = f2[2]+"/"+f2[1]+"/"+f2[0];}
%>

<sql:query var="q1" dataSource="jdbc/mysql">
    SELECT id_empleado from empleados where correo = ? and password_emp = sha2(?,256)
    <sql:param value="${correo}"/>
    <sql:param value="${contra}"/>
</sql:query>

<c:if test="${q1.rowCount < 1}">            
    <c:redirect url="Login.jsp">                
        <c:param name="error" value="1"/>
    </c:redirect>
</c:if>
<c:forEach var="name" items="${q1.rows}">
    <c:set var="usuari" value="${name.id_empleado}"/>
</c:forEach>
<c:set scope="session"
       var="loginUser"
       value="${usuari}"/>
<c:set target="${pru}" property="nombre" value="<%=f3%>"/>
<c:set target="${pru}" property="apellido" value="${e1}"/>
<c:redirect url="Menu.jsp"/>             

