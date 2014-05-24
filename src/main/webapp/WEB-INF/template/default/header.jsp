<%-- 
    Document   : header
    Created on : 24-may-2014, 0:34:12
    Author     : rallibau
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="logged" value="${sessionScope.logged}" />
<c:set var="acronimo" value="${sessionScope.acronimo}" />

<div class="row">
    <div class="span9">
        <div id="logo" class="container">
            <h1><a href="#">Digitaliza<span style="font-size: 140%;">T</span></a></h1>
            <p>Servicios de digtalizaci&oacute;n y gestión del archivo electrónico</p>
        </div>
    </div>
    <div class="span3" style="text-align: right;margin-top: 30px;">
        <c:if test="${logged eq true}">
            <div class="btn-group" style="text-align: left;">
                <a class="btn btn-primary" href="#"><i class="icon icon-user"></i> ${acronimo}</a>
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
    <!-- Modal -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">Acceso</h3>
        </div>
        <div class="modal-body">
            <form class="form-inline">
                <input type="text" class="input-small" id="user" placeholder="Email"/>
                <input type="password" class="input-small" placeholder="Password"/>
                <label class="checkbox"/>
                <input type="checkbox"/> Recuerdame
                </label>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
            <button class="btn btn-primary" onclick="doLogin()">Enviar</button>
        </div>
    </div>
</div>