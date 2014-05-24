<%-- 
    Document   : footer
    Created on : 24-may-2014, 0:34:24
    Author     : rallibau
--%>

<div id="copyright">
    <p>Todos los derechos reservado por digitalisat.com</p>
</div>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    function doLogin() {
        $.ajax({
            url: 'doLogin.server',
            data: 'user=' + $("#user").val(),
            dataType: 'json',
            success: function(data)
            {
                location.reload();
            }
        });

    }
    function closeSession() {
        $.ajax({
            url: 'doLoginClose.server',
            data: 'user=' + $("#user").val(),
            dataType: 'json',
            success: function(data)
            {
               location.reload();
            }
        });
    }
</script>