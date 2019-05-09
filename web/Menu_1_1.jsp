
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <!-- Custom fonts for this template -->
    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/assets/css/alertify.core.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/alertify.default.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/prop/java.css" rel="stylesheet" type="text/css"/>
      
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
</head>

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/index.jsp">        
        <img src="${pageContext.request.contextPath}/Imas/java.ico" height="45" width="45">
        <div class="sidebar-brand-text mx-3"><fmt:message key="label.titulomenu"/><sup>2</sup></div>
    </a>
    <!-- Divider -->
    <hr class="sidebar-divider my-0">
    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">
            <i class="fas fa-sitemap"></i>            
            <span><fmt:message key="label.distribucion"/></span></a>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider">
    <!-- Heading -->
    <div class="sidebar-heading">
        <fmt:message key="label.admin"/>
    </div>
    
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" id="solicitar" name="solicitar" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
            <i class="far fa-file-alt" style="font-size:24px" ></i>
            <span><fmt:message key="label.titulocasos"/></span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header"><fmt:message key="label.op"/></h6>
                <c:if test="${loginB.id_cargo == 2}">
                    <button type="button" class="btn btn-default btn-xs" onclick="location.href='${pageContext.request.contextPath}/Solicitud.jsp'" style="margin-left: 15px"><fmt:message key="label.nuevasoli"/></button>
                    <br/>
                </c:if>                                
                <button type="button" class="btn btn-default btn-xs" onclick="mostrar()" style="margin-left: 15px"><fmt:message key="label.modsoli"/></button>
                <br/><button type="button" class="btn btn-default btn-xs" onclick="location.href='${pageContext.request.contextPath}/Casos/ListarCasos.jsp'" style="margin-left: 15px"><fmt:message key="label.listcasos"/></button>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
            <i class="far fa-edit" style="font-size:24px" ></i>
            <span><fmt:message key="label.bitacoras"/></span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header"><fmt:message key="label.op"/></h6>
                <button type="button" class="btn btn-default btn-xs" onclick="location.href='${pageContext.request.contextPath}/Bitacora.jsp'" style="margin-left: 15px"><fmt:message key="label.ver"/></button>
                <br/><button type="button" class="btn btn-default btn-xs" onclick="mostrar()" style="margin-left: 15px"><fmt:message key="label.mod"/></button>

            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">

    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
            <i class="far fa-address-card" style="font-size:24px" ></i>
            <span><fmt:message key="label.emp"/></span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header"><fmt:message key="label.op"/></h6>
                <button type="button" class="btn btn-default btn-xs" onclick="location.href='${pageContext.request.contextPath}/Empleados/ingresarEmpleado.jsp'" style="margin-left: 15px"><fmt:message key="label.mantenimiento"/></button>
                <button type="button" class="btn btn-default btn-xs" onclick="location.href='${pageContext.request.contextPath}/Empleados/ListarEmpleados.jsp'" style="margin-left: 15px"><fmt:message key="label.listemp"/></button>
                <button type="button" class="btn btn-default btn-xs" onclick="mostrar()" style="margin-left: 15px"><fmt:message key="label.programadores"/></button>
                <button type="button" class="btn btn-default btn-xs" onclick="mostrar()" style="margin-left: 15px"><fmt:message key="label.tester"/></button>

            </div>
        </div>
    </li>


    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->

<!-- Main Content -->

<!-- Topbar -->
<div id="content-wrapper" class="d-flex flex-column">
    
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                   data-target="#drop">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><c:out value="${loginB.nombre}"/></span>
                    <img class="img-profile rounded-circle" src="https://www.gestioncentercloud.com.ar/webexternas/e-commerce/Iconos/AppUser.png">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown" id="drop">
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        <fmt:message key="label.perfil"/>
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                        <fmt:message key="label.conf"/>
                    </a>

                    <div class="dropdown-divider"></div>
                    <%--
                    <a class="dropdown-item" href="Solicitud.jsp" data-toggle="modal" data-target="#logoutModal">
                    --%>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/Logout.jsp">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        <fmt:message key="label.cerrarsesion"/>
                    </a>
                </div>
            </li>
        </ul>
    </nav>

    <!-- End of Topbar -->
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.min.js"></script>
    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/assets/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/demo/datatables-demo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/alertify.js" type="text/javascript"></script>