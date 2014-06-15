<%-- 
    Document   : header
    Created on : 24-may-2014, 0:34:12
    Author     : rallibau
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="logged" value="${sessionScope.logged}" />
<c:set var="acronimo" value="${sessionScope.acronimo}" />



<div class="masthead">
    <h3 class="muted">${sessionScope.user.branch.organization.name}</h3>
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav">
                    <li class="active"><a href="<%= request.getContextPath()%>/view/viewDeskTop">Documentos</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/users">Usuarios</a></li>
                    <li><a href="#">Sucursales</a></li>
                    <li><a href="#">Configuraci&oacute;n</a></li>
                    <li><a href="#">Ayuda</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </div>
    </div><!-- /.navbar -->
</div>
