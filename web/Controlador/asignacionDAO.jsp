<%-- 
    Document   : asignacionDAO
    Created on : 04-17-2019, 06:04:37 PM
    Author     : less_
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:useBean id="empleado"   scope="page" class="Beans.Empleado"/>
<%@page language="java" import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="Beans.Correo"%>
<%@page import="Beans.Controlador"%>

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
         <c:set var="idp" value="${param.idp}"/>
        <c:set var="cargo" value="${param.cargo}"/>
        <c:set var="fechalimite" value="${param.fechalimite}"/>
        <c:set var="fecham" value="${param.fechal}"/>
        <c:set var="ide" value="${param.modi}"/>
        <c:set var="cargo" value="${param.cargo}"/>

  

        <sql:query var="query" dataSource="jdbc/mysql">
            select * from empleados_caso where id_caso=?
            <sql:param value="${idcaso}"/>
        </sql:query>

        <!-- Para verificar que no se ingrese más de un empleado-->
        <sql:query var="countTester" dataSource="jdbc/mysql">
            select ec.id_empleado FROM empleados_caso ec INNER JOIN empleados e ON e.id_cargo=4 and e.id_empleado=ec.id_empleado and ec.id_caso=?
         <sql:param value="${idcaso}"/>
        </sql:query>

        <sql:query var="countProgramador" dataSource="jdbc/mysql">
            select ec.id_empleado FROM empleados_caso ec INNER JOIN empleados e ON e.id_cargo=3 and e.id_empleado=ec.id_empleado and ec.id_caso=?
         <sql:param value="${idcaso}"/>
        </sql:query>
        <!--fin-->
        
        
        <% if (request.getParameter("id") != null) {%>              
        <c:choose>
            <c:when test="${query.rowCount >=2 || countProgramador.rowCount>0 }">
                <c:redirect url="../Casos/asignacionEmpleados.jsp?ide=${id}&c=${cargo}&idc=${idcaso}">                                                
                    <c:param name="errorm"  value="El programador ya fue asignado"/>
                </c:redirect>
            </c:when>

            <c:otherwise>
               
                <sql:query var="datosm" dataSource="jdbc/mysql">
                    select nombre_emp,correo from empleados where id_empleado=?
                    <sql:param value="${id}"/>
                </sql:query>

                <c:forEach var="Destinatariom" items="${datosm.rows}">
                    <c:set var="correoD" value="${Destinatariom.correo}"/>
                </c:forEach>

                <c:set var="correo" value="${loginB.correo}"/>
                <c:set var="contraP" value="${loginB.contraP}"/>
                
                <%
                    try {
                        String correo = "" + pageContext.getAttribute("correo");
                        String contraP = "" + pageContext.getAttribute("contraP");
                        String cDestino = "" + pageContext.getAttribute("correoD");
                        String asunto = "", mjs = "", descripcion = "", id = "";
                        asunto = "AVISO-ASIGNACIÓN DE NUEVO CASO";
                        mjs = "Saludos\n Usted ha sido asignado a un nuevo caso\n\n\t";
                        Controlador control = new Controlador();
                        Correo c = new Correo();
                        c.setCorreoUser(correo);
                        c.setContra(contraP);
                        c.setCorreoDestino(cDestino);
                        c.setAsunto(asunto);
                        c.setMensaje(mjs);

                        control.enviar(c);

                    } catch (Exception e) {
                        out.print("" + e.getMessage());
                    }

                %>
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

        
             <% if (request.getParameter("idp") != null) {%>
                   
        <c:choose>
            <c:when test="${query.rowCount >=2 || countTester.rowCount>0 }">
                <c:redirect url="../Casos/asignacionEmpleados.jsp?ide=${idp}&c=${cargo}&idc=${idcaso}">                                                
                    <c:param name="errorm"  value="El probador ya fue asignado"/>
                </c:redirect>
            </c:when>

            <c:otherwise>
               
                <sql:query var="datosm" dataSource="jdbc/mysql">
                    select nombre_emp,correo from empleados where id_empleado=?
                    <sql:param value="${idp}"/>
                </sql:query>

                <c:forEach var="Destinatariom" items="${datosm.rows}">
                    <c:set var="correoD" value="${Destinatariom.correo}"/>
                </c:forEach>

                <c:set var="correo" value="${loginB.correo}"/>
                <c:set var="contraP" value="${loginB.contraP}"/>
                
                <%
                    try {
                        String correo = "" + pageContext.getAttribute("correo");
                        String contraP = "" + pageContext.getAttribute("contraP");
                        String cDestino = "" + pageContext.getAttribute("correoD");
                        String asunto = "", mjs = "", descripcion = "", id = "";
                        asunto = "AVISO-ASIGNACIÓN DE NUEVO CASO";
                        mjs = "Saludos\n Usted ha sido asignado a un nuevo caso\n\n\t";
                        Controlador control = new Controlador();
                        Correo c = new Correo();
                        c.setCorreoUser(correo);
                        c.setContra(contraP);
                        c.setCorreoDestino(cDestino);
                        c.setAsunto(asunto);
                        c.setMensaje(mjs);

                        control.enviar(c);

                    } catch (Exception e) {
                        out.print("" + e.getMessage());
                    }

                %>
                <sql:update var="agregarp" dataSource="jdbc/mysql">
                    insert into empleados_caso  values (?,?)
                    <sql:param value="${idp}"/>
                    <sql:param value="${idcaso}"/>  
                </sql:update>
                <c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
                    <c:param name="exito" value="Probador asignado con exito"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>

        <%}%>
        
        <sql:query dataSource="jdbc/mysql" var="idbitacora">
            select * from bitacoras
        </sql:query>
        <sql:query dataSource="jdbc/mysql" var="existeb">
            select id_caso from bitacoras where id_caso=?
            <sql:param value="${idcaso}"/>
        </sql:query>
        <c:set var="idb" value="${idbitacora.rowCount+20}"/>
        
        
        <%if (request.getParameter("btnAsignarp") != null) {%>
        
        <c:choose>
            <c:when test="${query.rowCount<2}">
                <c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
                    <c:param name="error" value="Verifique empleados asignados ${query.rowCount} ${idcaso}"/>
                </c:redirect>
            </c:when>
            <c:otherwise>
                <c:choose>
                <c:when test="${fecham!=''}">
                     <sql:update var="fecham" dataSource="jdbc/mysql">
                    update caso set fecha_limite=?,id_estado=3 where id_caso=?
                    <sql:param value="${fecham}"/>
                    <sql:param value="${idcaso}"/>
                </sql:update>
                </c:when>
                <c:when test="${fecham==''}">
                    <%
            String d = "" + pageContext.getAttribute("fechalimite");
            String[] f2 = d.split("-");
            String f3="";
            f3 = f2[2]+"-"+f2[1]+"-"+f2[0];
            pageContext.setAttribute("fechalimite", f3);
    
        %>
                     <sql:update var="fecha" dataSource="jdbc/mysql">
                    update caso set fecha_limite=?,id_estado=3 where id_caso=?
                    <sql:param value="${fechalimite}"/>
                    <sql:param value="${idcaso}"/>
                </sql:update>
                </c:when>
               </c:choose>
                    <c:if test="${existeb.rowCount==0}">
                          <sql:update var="crearBitacira" dataSource="jdbc/mysql">
                   insert into bitacoras values (?,?,?,?)
                    <sql:param value="${idb}"/>
                    <sql:param value="${idcaso}"/>
                    <sql:param value=""/>
                    <sql:param value=""/>
                </sql:update> 
                    </c:if>
                  
                <c:redirect url="../Casos/asignacionEmpleados.jsp">                                                
                    <c:param name="exito" value="Asignación correcta"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>

        <%}%>


        <!--MODIFICAR EMPLEADOS ASIGNADOS-->
        <%if (request.getParameter("modi") != null) {%>
        <!--cuando se modifica-->
        <sql:query var="datosm" dataSource="jdbc/mysql">
             select nombre_emp,correo from empleados where id_empleado=?
            <sql:param value="${ide}"/>
        </sql:query>



        <c:forEach var="Destinatariom" items="${datosm.rows}">
            <c:set var="correoD" value="${Destinatariom.correo}"/>
            <c:set var="nombre" value="${Destinatariom.nombre_emp}"/>
        </c:forEach>

        <c:set var="correo" value="${loginB.correo}"/>
        <c:set var="contraP" value="${loginB.contraP}"/>
        <%
            try {
                String correo = "" + pageContext.getAttribute("correo");
                String contraP = "" + pageContext.getAttribute("contraP");
                String cDestino = "" + pageContext.getAttribute("correoD");
                String nombreD=""+pageContext.getAttribute("nombre");
                String asunto = "", mjs = "", descripcion = "", id = "";
                asunto = "Solicitud de Caso ";
                mjs = "Saludos "+nombreD+"\n Usted ha sido asignado a un nuevo caso\n\n\t";
                Controlador control = new Controlador();
                Correo c = new Correo();
                c.setCorreoUser(correo);
                c.setContra(contraP);
                c.setCorreoDestino(cDestino);
                c.setAsunto(asunto);
                c.setMensaje(mjs);

                control.enviar(c);

            } catch (Exception e) {
                out.print("" + e.getMessage());
            }

        %>
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
            <c:param name="exito" value="Se modifico asignación"/>
        </c:redirect>
        <%}%>
    </body>
</html>




