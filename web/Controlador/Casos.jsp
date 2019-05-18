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

 <%-- NUEVO ID DEL CASO solo para JF--%>

 <c:if test="${empty loginB.id_cargo}">
     <h2>VAcio</h2>
 </c:if>
     
    <c:if test="${loginB.id_cargo == 2}">
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
    </c:if>

    
<%-- VER casos solicitados por el JF solo para JD--%>    
    <c:if test="${loginB.id_cargo == 1}">
        <sql:query var="solipq" dataSource="jdbc/mysql" scope="request">
            SELECT  caso.id_caso, caso.nombre_caso, pdf_caso.pdf
            FROM    caso INNER JOIN pdf_caso ON caso.id_caso = pdf_caso.id_caso
            WHERE   (caso.id_estado = 1) AND (caso.id_caso LIKE ?)
            <sql:param value="${area}%"/>
        </sql:query>
    </c:if>
        
<%-- VER casos Asignados  solo para Prog Tester--%>
    <c:if test="${loginB.id_cargo == 3 || loginB.id_cargo == 4}">
        <%-------------------------------------------------------------------------------------------------------------%>
        <c:set var="bander" value="0" scope="request"/>
        <sql:query var="casValor" dataSource="jdbc/mysql" scope="request">
            SELECT  bitacoras.id_caso, caso.nombre_caso
            FROM            bitacoras INNER JOIN
            caso ON bitacoras.id_caso = caso.id_caso INNER JOIN
            empleados_caso ON caso.id_caso = empleados_caso.id_caso
            <c:if test="${loginB.id_cargo == 3}">
                WHERE        (empleados_caso.id_empleado = ?) AND ((caso.id_estado = 3) or (caso.id_estado = 6))
            </c:if>
            <c:if test="${loginB.id_cargo == 4}">
                WHERE        (empleados_caso.id_empleado = ?) AND ((caso.id_estado = 3) or (caso.id_estado = 6) or (caso.id_estado = 4))
            </c:if>
            <sql:param value="${loginB.id}"/>
        </sql:query>
        <c:set var="band" value="0"/> 
        <c:forEach var="casValorFor" items="${casValor.rows}">
            <c:set var="idcaso" value="${casValorFor.id_caso}"/>
            <sql:query var="q2" dataSource="jdbc/mysql" scope="request">
                select fecha_limite from caso where id_caso=?
                <sql:param value="${idcaso}"/>
            </sql:query>            
            <c:forEach var="f" items="${q2.rows}">
                <c:set value="${f.fecha_limite}" var="fecha" />
                <%
                    String fecha = "" + pageContext.getAttribute("fecha");
                    String band = "" + pageContext.getAttribute("band");

                    SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
                    Date now2 = new Date();
                    String snow = formato.format(now2);
                    Date Fnow = formato.parse(snow);
                    Date fProd = formato.parse(String.valueOf(fecha));
                    if (fProd.compareTo(Fnow) < 0) {
                        pageContext.setAttribute("band", 1);
                    } else {
                        pageContext.setAttribute("band", 0);
                    }
                %>
            </c:forEach>
            <c:if test="${band == 1}">
                <c:set var="bander" value="1" scope="request"/>
                <sql:update var="fecham" dataSource="jdbc/mysql">
                    update caso set id_estado=? where id_caso=?
                    <sql:param value="5"/>
                    <sql:param value="${idcaso}"/>
                </sql:update>
            </c:if>
        </c:forEach>        
        <%------------------------------------------------------------------------------------------------------------%>
        <sql:query var="casosAsigq" dataSource="jdbc/mysql" scope="request">
            SELECT  bitacoras.id_caso, caso.nombre_caso
            FROM            bitacoras INNER JOIN
            caso ON bitacoras.id_caso = caso.id_caso INNER JOIN
            empleados_caso ON caso.id_caso = empleados_caso.id_caso
            <c:if test="${loginB.id_cargo == 3}">
                WHERE        (empleados_caso.id_empleado = ?) AND ((caso.id_estado = 3) or (caso.id_estado = 6))
            </c:if>
            <c:if test="${loginB.id_cargo == 4}">
                WHERE        (empleados_caso.id_empleado = ?) AND ((caso.id_estado = 3) or (caso.id_estado = 6) or (caso.id_estado = 4))
            </c:if>
            <sql:param value="${loginB.id}"/>
        </sql:query>
        <%--CASOS esperando respuesta del area ..... solo parta TESTER--%>
        <c:if test="${loginB.id_cargo == 4}">
            <sql:query var="casosAsigq2" dataSource="jdbc/mysql" scope="request">
                SELECT  bitacoras.id_caso, caso.nombre_caso
                FROM            bitacoras INNER JOIN
                caso ON bitacoras.id_caso = caso.id_caso INNER JOIN
                empleados_caso ON caso.id_caso = empleados_caso.id_caso                
                WHERE        (empleados_caso.id_empleado = ?) AND (caso.id_estado = 4)
                <sql:param value="${loginB.id}"/>
            </sql:query>
        </c:if>
        <c:if test="${loginB.id_cargo == 3}">
            <sql:query var="casosAsigq2" dataSource="jdbc/mysql" scope="request">
                SELECT  bitacoras.id_caso, caso.nombre_caso
                FROM            bitacoras INNER JOIN
                caso ON bitacoras.id_caso = caso.id_caso INNER JOIN
                empleados_caso ON caso.id_caso = empleados_caso.id_caso                
                WHERE        (empleados_caso.id_empleado = ?) AND (caso.id_estado = 6)
                <sql:param value="${loginB.id}"/>
            </sql:query>
        </c:if>
    </c:if>
    <%--        
<%--Aceptando caso
        <c:if test="${not empty param.aceptarC}">
            <sql:update var="aceptarcq" dataSource="jdbc/mysql" scope="request">
                update caso set id_estado = 3 where id_caso = ?
                <sql:param value="${param.aceptarC}"/>
            </sql:update>
        </c:if>
                
<%--Rechazando caso
        <c:if test="${not empty param.aceptarC}">
            <sql:update var="aceptarcq" dataSource="jdbc/mysql" scope="request">
                update caso set id_estado = 3 where id_caso = ?
                <sql:param value="${param.aceptarC}"/>
            </sql:update>
        </c:if>
    --%>