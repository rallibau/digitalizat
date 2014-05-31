<%-- 
    Document   : header
    Created on : 24-may-2014, 0:34:12
    Author     : rallibau
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="logged" value="${sessionScope.logged}" />
<c:set var="acronimo" value="${sessionScope.acronimo}" />

<div class="navbar navbar-inverse navbar-fixed-top" style="height:10vh;">
    <div class="navbar-inner">
        <div class="container-fluid">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="/digitalizatWebSite">Digitalisat.com</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="viewDeskTop.view">Carpeta</a></li>
                    <li><a href="viewDeskTop.view">Actividad</a></li>
                    <li><a href="viewDeskTop.view">Configuraci&oacute;n</a></li>
                    <li><a href="viewDeskTop.view">Soporte</a></li>
                </ul>
            </div><!--/.nav-collapse -->
            <c:if test="${logged eq true}">
                <div class="btn-group pull-right">
                    <a class="btn btn-primary" href="#"><i class="icon icon-user icon-white"></i> ${acronimo}</a>
                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="icon icon-th-list"></i> Perfil</a></li>
                        <li><a href="#" onclick="closeSession()"><i class="icon icon-off"></i> Cerrar sesesión</a></li>
                    </ul>
                </div>
            </c:if>
            <c:if test="${logged eq false}">
                <a class="btn btn-small" href="#myModal" data-toggle="modal"><i class="icon icon-lock"></i> Acceso</a>
            </c:if>
        </div>
    </div>
</div>