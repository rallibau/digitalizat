<%-- 
    Document   : header
    Created on : 24-may-2014, 0:34:12
    Author     : rallibau
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="logged" value="${sessionScope.logged}" />
<c:set var="acronimo" value="${sessionScope.acronimo}" />


<div class="navbar navbar-fixed-top" ng-controller="obtenerMenuController">
    <div class="navbar-inner" id="menuPrincipal">
        <div class="container-fluid">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">${sessionScope.user.branch.organization.name}</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li ng-repeat="resource in resources"><a href="<%= request.getContextPath()%>{{resource.path}}">{{resource.name}}</a></li>
                    <li><a href="<%= request.getContextPath()%>/view/myself">${sessionScope.user.email}</a></li>
                    <!-- li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.user.email} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%= request.getContextPath()%>/view/doLoginClose">Cerrar sesión</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/myself">Mi perfil</a></li>
                            <li><a href="<%= request.getContextPath()%>/view/organization">Mi empresa</a></li>
                            
                        </ul>
                    </li -->
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

