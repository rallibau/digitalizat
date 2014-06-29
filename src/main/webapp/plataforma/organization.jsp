<%-- 
    Document   : organization
    Created on : 22-jun-2014, 20:25:48
    Author     : rallibau
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="aplyTemplate">
    <tiles:putAttribute name="title">
        Escritorio
    </tiles:putAttribute>
    <tiles:putAttribute name="body">
        <div style="text-align: center; width: 100%">
            <div style="max-width: 1024px; margin: auto; text-align: left;">
                <div class="span12">
                    <h3>${sessionScope.user.branch.organization.name}</h3>
                    <p class="lead">Define tu organización, personas,sedes, roles...</p>
                    <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
                        <li class="active">
                            <a href="#personas" data-toggle="tab">Personas</a>
                        </li>
                        <li>
                            <a href="#roles" data-toggle="tab">Roles</a>
                        </li>
                        <li>
                            <a href="#equipos" data-toggle="tab">Equipos</a>
                        </li>
                        <li>
                            <a href="#sedes" data-toggle="tab">Sedes</a>
                        </li>
                        <li>
                            <a href="#servicios" data-toggle="tab">Servicios</a>
                        </li>

                    </ul>
                    <div  id="my-tab-content" class="tab-content">
                        <div class="tab-pane active" id="personas" ng-controller="getAllOrgUsers">
                            <form class="form-search">
                                <div class="input-append" style="width: 100%;text-align: right;">
                                    <input type="text" class="span4 search-query">
                                    <button type="submit" class="btn">Buscar persona</button>
                                </div>
                            </form>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Acronimo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="user in users">
                                        <td>{{user.id}}</td>
                                        <td>{{user.name}}</td>
                                        <td>{{user.surname}}</td>
                                        <td>{{user.email}}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="width: 100%;text-align: right;">
                                <a href="#newUser" role="button" class="btn" data-toggle="modal"><i class="icon-plus"></i>Añadir persona</a>
                            </div>
                        </div><!--personas-->
                        <div class="tab-pane" id="roles">
                            <h1>Roles</h1>
                            <p>Roles de la organizacion</p>
                        </div><!--roles-->
                        <div class="tab-pane" id="equipos">
                            <h1>Equipos</h1>
                            <p>Equipos de la organizacion</p>
                        </div><!--equipos-->
                        <div class="tab-pane" id="sedes">
                            <h1>Sedes</h1>
                            <p>Sedes de la organizacion</p>
                        </div><!--roles-->
                        <div class="tab-pane" id="servicios">
                            <h1>Servicios</h1>
                            <p>Servicios de la organizacion</p>
                        </div><!--roles-->
                    </div><!--tabcontent-->
                </div>
            </div>
        </div>

        <div id="newUser" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Nuevo usuario</h3>
            </div>
            <form>
                <div class="controls controls-row">
                    <div class="control-group span6">
                        <label class="control-label" for="name">Nombre</label>
                        <input type="text" class="span12" type="text" id="name" placeholder="Nombre" value="${sessionScope.user.name}">
                    </div>
                    <div class="control-group span6">
                        <label class="control-label" for="surname">Apellidos</label>
                        <input type="text" class="span12" type="text" id="surname" placeholder="Apellidos" value="${sessionScope.user.surname}">
                    </div>
                </div>
                <div class="controls controls-row">
                    <div class="control-group span6">
                        <label class="control-label" for="email">Correo electrónico</label>
                        <input type="text" class="input-xlarge uneditable-input" type="text" id="email" placeholder="Correo electronico" value="${sessionScope.user.email}">
                    </div>
                    <div class="control-group span6">
                        <label class="control-label" for="sucursal">Sucursal</label>
                        <input type="text" class="input-xlarge uneditable-input" type="text" id="sucursal" placeholder="Sucursal" value="${sessionScope.user.branch.name}">
                    </div>
                </div>
                <div class="controls controls-row">
                    <div class="control-group span6">
                        <label class="control-label" for="org">Organización</label>
                        <input type="text" class="input-xlarge uneditable-input" type="text" id="org" placeholder="Organizacion" value="${sessionScope.user.branch.organization.name}">
                    </div>
                </div>    
                <div class="modal-footer">
                    <button type="submit" class="btn"><i class="icon-hdd"></i>Guardar</button>
                </div>
            </form>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>