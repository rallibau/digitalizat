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
        <div style="text-align: center; width: 100%">
            <div style="width: 100%;padding-top: 10px;padding-bottom: 10px;">
                <a href="${pageContext.request.contextPath}/view/doLoginClose" role="button" class="btn" data-toggle="modal"><i class="icon-off"></i>Cerrar sesión</a>
            </div>
            <div style="max-width: 1024px; margin: auto; text-align: left;">
                <h3>Mi cuenta</h3>
                <p class="lead">Modifica tus datos personales</p>
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
                    <div class="controls controls-row" style="text-align: center;">
                        <button type="submit" class="btn"><i class="icon-hdd"></i>Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


</tiles:putAttribute>
</tiles:insertDefinition>
