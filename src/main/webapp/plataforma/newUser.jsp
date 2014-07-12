<%-- 
    Document   : newUser
    Created on : 29-may-2014, 19:48:59
    Author     : rallibau
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="url" value="${pageContext.request.contextPath}"/>

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
                Contraseña
                <input type="password" id="pwd1" class="input-block-level" placeholder="Contraseña"/>
                Repita la contraseña
                <input type="password" id="pwd2" class="input-block-level" placeholder="Contraseña"/>
                <div class="alert alert-error" id="alertMsnCon" style="display: none;"></div>
                Código de invitación
                <input type="text" id="inv" class="input-block-level" placeholder="Debe estar invitado para entrar"/>
            </form>
            <div id="loginError" class="alert alert-error" style="display: none;">
                <strong>Ups!!</strong>
                <p id="msnError"></p>
            </div>
            <button class="btn btn-large btn-primary" onclick="$('#topdiv').show();location.href='${url}';">Cancelar</button>
            <button class="btn btn-large btn-primary"  onclick="sendNewUser()">Crear usuario</button>
        </div>

        <div id="push"></div>
        <script>
            function sendNewUser() {
                $('#topdiv').show();
                $("#alertMsnUser").css("display", "none");
                $("#alertMsnCon").css("display", "none");

                if ($("#org").val().length < 1) {
                    $("#alertMsnOrg").css("display", "block");
                    $("#alertMsnOrg").html("Introduzca un nombre para organizaci&oacute;n");
                    $('#topdiv').hide();
                    return;
                } else {
                    $("#alertMsnOrg").hide();
                }

                if ($("#user").val().length < 1) {
                    $("#alertMsnUser").css("display", "block");
                    $("#alertMsnUser").html("Introduzca una direccion de correo");
                    $('#topdiv').hide();
                    return;
                } else {
                    $("#alertMsnUser").hide();
                }

                if ($("#pwd1").val().length < 1) {
                    $("#alertMsnCon").css("display", "block");
                    $("#alertMsnCon").html("La contraseña no es correcta");
                    $('#topdiv').hide();
                    return;
                } else {
                    $("#alertMsnOrg").hide();
                }

                if ($("#pwd2").val() != $("#pwd1").val()) {
                    $("#alertMsnCon").css("display", "block");
                    $("#alertMsnCon").html("La contraseñas no coinciden");
                    $('#topdiv').hide();
                    return;
                } else {
                    $("#alertMsnCon").hide();
                }

                $.ajax({
                    url: 'saveUser.server',
                    data: 'user=' + $("#user").val() + "&" + 'pwd=' + $("#pwd1").val() + "&" + 'org=' + $("#org").val()+"&"+"inv="+$("#inv").val(),
                    dataType: 'json',
                    success: function(data)
                    {
                        if (data) {
                            window.location.replace("${pageContext.request.contextPath}/view/viewFolder/0");
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        $('#topdiv').hide();
                        $('#loginError').show();
                        $("#msnError").html(thrownError);
                        //alert("El usuario o la contraseña no son correctos");

                    }
                });

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>