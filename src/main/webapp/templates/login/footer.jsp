<%-- 
    Document   : footer
    Created on : 24-may-2014, 0:34:24
    Author     : rallibau
--%>

<div id="footer">
    <div style="text-align: center" class="container">
        <p>Powered by digitalizat.com</p>
    </div>
</div>

<div id="topdiv" class="loadingFrame">

</div>

<script src="http://code.jquery.com/jquery.js"></script>
<script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
<script>
    function doLogin() {
        $('#topdiv').show(); //muestro mediante id
        $.ajax({
            url: '<%= request.getContextPath()%>/server/doLogin',
            data: 'user=' + $("#user").val() + "&pwd=" + $("#pwd").val(),
            dataType: 'json',
            success: function(data)
            {
                window.location.replace("<%= request.getContextPath()%>/view/viewFolder/0");
            },
            error: function(xhr, ajaxOptions, thrownError) {
                $('#topdiv').hide();
                $('#loginError').show();
                //alert("El usuario o la contraseña no son correctos");
                
            }
        });
    }
</script>