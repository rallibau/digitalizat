<%-- 
    Document   : viewDeskTop
    Created on : 25-may-2014, 16:30:29
    Author     : rallibau
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="aplyTemplate">
    <tiles:putAttribute name="title">
        Escritorio
    </tiles:putAttribute>
    <tiles:putAttribute name="body">
        <ul id="nav">
            <li alt="ddfdfdf"><a href="#newUser" role="button" data-toggle="modal"><i class="icon-plus icon-white"></i></a></li>
            <li alt="ddfdfdf"><a href="#newUser" role="button" data-toggle="modal"><i class="icon-folder-close icon-white"></i></a></li>
            <li alt="ddfdfdf"><a href="#newUser" role="button" data-toggle="modal"><i class="icon-search icon-white"></i></a></li>
        </ul>
        <h3>Clientes y Proveedores</h3>
        <p class="lead">Mantenga el catálogo de clientes y proveedores</p>
        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
            <li class="active">
                <a href="#clients" data-toggle="tab">Clientes</a>
            </li>
            <li>
                <a href="#proveedores" data-toggle="tab">Proveedores</a>
            </li>
        </ul>
    </tiles:putAttribute>
</tiles:insertDefinition>
