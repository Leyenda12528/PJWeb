<%-- 
    Document   : Logout
    Created on : 26-abr-2019, 22:16:33
    Author     : jorge
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<c:set scope="session" var="loginUser" value=""/>
session.removeAttribute("loginUser");
--%>
<%  session.invalidate();    %>
<c:redirect url="Login.jsp"/>
