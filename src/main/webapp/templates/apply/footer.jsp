<%-- 
    Document   : footer
    Created on : 24-may-2014, 0:34:24
    Author     : rallibau
--%>

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
                window.location.replace("viewDeskTop.view");
            }
        });
    }
</script>