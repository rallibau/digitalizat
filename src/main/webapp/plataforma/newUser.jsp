<%-- 
    Document   : newUser
    Created on : 29-may-2014, 19:48:59
    Author     : rallibau
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="loginTemplate">
    <tiles:putAttribute name="title">
        Nuevo usuario
    </tiles:putAttribute>
    <tiles:putAttribute name="body">

        <div class="container" style="text-align: center;">
            <form class="form-signin" style="text-align: left;max-width: 500px;">
                <h2 class="form-signin-heading">Acceder</h2>
                Organizaci&oacute;n
                <input type="text" id="org" class="input-block-level" placeholder="Organizaci&oacute;n"/>
                <div class="alert alert-error" id="alertMsnOrg" style="display: none;"></div>
                Usuario
                <input type="text" id="user" class="input-block-level" placeholder="direccion de correo"/>
                <div class="alert alert-error" id="alertMsnUser" style="display: none;"></div>
                Contraseņa
                <input type="password" id="pwd1" class="input-block-level" placeholder="Contraseņa"/>
                Repita la contraseņa
                <input type="password" id="pwd2" class="input-block-level" placeholder="Contraseņa"/>
                <div class="alert alert-error" id="alertMsnCon" style="display: none;"></div>
            </form>

            <button class="btn btn-large btn-primary"  onclick="sendNewUser()">Crear usuario</button>
        </div>

        <div id="push"></div>
        <script>
            function sendNewUser() {
                $("#alertMsnUser").css("display", "none");
                $("#alertMsnCon").css("display", "none");
                
                if ($("#org").val().length < 1) {
                    $("#alertMsnOrg").css("display", "block");
                    $("#alertMsnOrg").html("Introduzca un nombre para organizaci&oacute;n");
                    return;
                }

                if ($("#user").val().length < 1) {
                    $("#alertMsnUser").css("display", "block");
                    $("#alertMsnUser").html("Introduzca una direccion de correo");
                    return;
                }
                if ($("#pwd1").val().length < 1) {
                    $("#alertMsnCon").css("display", "block");
                    $("#alertMsnCon").html("La contraseņa no es correcta");
                    return;
                }
                if ($("#pwd2").val() != $("#pwd1").val()) {
                    $("#alertMsnCon").css("display", "block");
                    $("#alertMsnCon").html("La contraseņas no coinciden");
                    return;
                }
                $.ajax({
                    url: 'saveUser.server',
                    data: 'user=' + $("#user").val()+"&"+'pwd=' + $("#pwd1").val()+"&"+'org=' + $("#org").val(),
                    dataType: 'json',
                    success: function(data)
                    {
                        location.reload();
                    }
                });

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>