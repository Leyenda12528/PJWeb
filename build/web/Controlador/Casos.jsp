<%-- 
    Document   : Casos
    Created on : 21-abr-2019, 22:45:40
    Author     : jorge
--%> 
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <%-- NUEVO ID DEL CASO --%>
 <c:set var="area" value="${fn:substring(loginB.departamento,0,3)}"/>
 <sql:query var="newIDcasoq" dataSource="jdbc/mysql" scope="request">
     select count(*) as dato from caso where id_caso like ?
     <sql:param value="${area}%"/>
 </sql:query>
 <c:forEach var="newIDcasofor" items="${newIDcasoq.rows}">
     <c:set var="correlativo" value="${newIDcasofor.dato}"/>
 </c:forEach>
<%
    String cor = "" + pageContext.getAttribute("correlativo");
    String fec = new SimpleDateFormat("yy").format(new Date());
    int cor2 = Integer.parseInt(cor) + 1;
    cor = "" + cor2;
    while (cor.length() < 3)
      cor = "0" + cor;
    cor = fec + cor;
    pageContext.setAttribute("correlativo", cor);
%>
<c:set var="NewIdCaso" value="${area}${correlativo}" scope="request"/>
