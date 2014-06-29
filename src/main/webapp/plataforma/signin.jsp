<%-- 
    Document   : signin
    Created on : 25-may-2014, 13:38:26
    Author     : rallibau
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="url" value="${pageContext.request.contextPath}"/>
<tiles:insertDefinition name="loginTemplate">
    <tiles:putAttribute name="title">
        Acceder
    </tiles:putAttribute>
    <tiles:putAttribute name="body">

        <!-- Begin page content -->
        <div class="container" style="text-align: center;">
            <form class="form-signin" style="text-align: left;max-width: 320px;">
                <h2 class="form-signin-heading">Acceder</h2>
                Usuario
                <input type="text" id="user" class="input-block-level" placeholder="Email address"/>
                Contraseña
                <input type="password" id="pwd" class="input-block-level" placeholder="Password"/>
                <a href="#forgot_password">¿Olvidaste tu contraseña?</a>
                <a class="create-account" href="${url}/view/viewNewUser.view">Crea una cuenta nueva</a>

            </form>
            <div id="loginError" class="alert alert-error" style="display: none;">
                <strong>No puedes pasar!!</strong>
                La contraseña o el usuario son incorrectos
            </div>
            <button class="btn btn-large btn-primary" onclick="doLogin()">Enviar</button>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>