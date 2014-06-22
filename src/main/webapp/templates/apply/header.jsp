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
    <div class="navbar" id="menuPrincipal" ng-controller="obtenerMenuController">
        <div class="navbar-inner">
            <div class="container">
                <ul class="nav">
                    <li class="active" ng-repeat="resource in resources"><a href="<%= request.getContextPath()%>{{resource.path}}">{{resource.name}}</a></li>
                </ul>
            </div>
        </div>
    </div><!-- /.navbar -->
</div>
