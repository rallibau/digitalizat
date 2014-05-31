<%-- 
    Document   : signin
    Created on : 25-may-2014, 13:38:26
    Author     : rallibau
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <input type="password" class="input-block-level" placeholder="Password"/>
                <a href="#forgot_password">¿Olvidaste tu contraseña?</a>
                <a class="create-account" href="viewNewUser.view">Crea una cuenta nueva</a>

            </form>
            <button class="btn btn-large btn-primary" onclick="doLogin()">Enviar</button>
        </div>

        <div id="push"></div>
    </tiles:putAttribute>
</tiles:insertDefinition>