<%-- 
    Document   : myself
    Created on : 22-jun-2014, 20:46:45
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
            <li alt="ddfdfdf"><a href="${pageContext.request.contextPath}/view/doLoginClose" role="button" data-toggle="modal"><i class="icon-plus icon-white big"></i></a></li>
            <li alt="ddfdfdf"><a href="#myModal" role="button" data-toggle="modal"><i class="icon-folder-close icon-white big"></i></a></li>
        </ul>
        <div class="span12" style="text-align: center;">
            <a href="${pageContext.request.contextPath}/view/doLoginClose" role="button" class="btn" data-toggle="modal"><i class="icon-off"></i>Cerrar sesión</a>
        </div>
        <h3>Mi cuenta</h3>
        <p class="lead">Modifica tus datos personales</p>
        <form>
            <div class="controls">
                <label class="span3" for="xx">Nombre</label>
                <input class="span3" id="xx" type="text" placeholder=".span4">
                <label class="span3" for="yy">Nombre</label>
                <input class="span3" id="yy" type="text" placeholder=".span4">
            </div>
            <div class="controls controls-row">

                <label class="control-label  span6" for="name">Nombre</label>
                <input class="span6" type="text" placeholder=".span1">
            </div>
            <div class="span6">
                <label class="control-label" for="name">Nombre</label>
                <input type="text" type="text" id="name" placeholder="Nombre" value="${sessionScope.user.name}">
            </div>
            <div class="span6">
                <label class="control-label" for="surname">Apellidos</label>
                <input type="text" type="text" id="surname" placeholder="Apellidos" value="${sessionScope.user.surname}">
            </div>
            <div class="control-group span6">
                <label class="control-label" for="email">Correo electrónico</label>
                <input type="text" class="input-xlarge uneditable-input" type="text" id="email" placeholder="Correo electronico" value="${sessionScope.user.email}">
            </div>
            <div class="control-group span6">
                <label class="control-label" for="sucursal">Sucursal</label>
                <input type="text" class="input-xlarge uneditable-input" type="text" id="sucursal" placeholder="Sucursal" value="${sessionScope.user.branch.name}">
            </div>
            <div class="control-group span6">
                <label class="control-label" for="org">Organización</label>
                <input type="text" class="input-xlarge uneditable-input" type="text" id="org" placeholder="Organizacion" value="${sessionScope.user.branch.organization.name}">
            </div>
            <div class="span12" style="text-align: center;">
                <button type="submit" class="btn"><i class="icon-hdd"></i>Guardar</button>
            </div>
        </form>
    </tiles:putAttribute>
</tiles:insertDefinition>
