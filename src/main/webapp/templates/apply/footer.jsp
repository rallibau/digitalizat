<%-- 
    Document   : footer
    Created on : 24-may-2014, 0:34:24
    Author     : rallibau
--%>

<!--div id="footer">
    <div style="text-align: center" class="container">
        <p>Powered by digitalizat.com</p>
    </div>
</div -->

<div id="topdiv" class="loadingFrame">

</div>

<!-- script src="http://code.jquery.com/jquery.js"></script -->
<script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/js/angular.min.js"></script>
<script src="<%= request.getContextPath()%>/js/digitalizat.common.controllers.js"></script>
<script src="<%= request.getContextPath()%>/js/digitalizat.tdoc.controllers.js"></script>
<script>
    function doLogin() {
        $.ajax({
            url: 'doLogin.server',
            data: 'user=' + $("#user").val(),
            dataType: 'json',
            success: function(data)
            {
                window.location.replace("<%= request.getContextPath()%>/view/viewFolder/0");
            }
        });
    }
    function closeSession() {
        $('#topdiv').show();
        $.ajax({
            url: 'doLoginClose.server',
            data: '',
            dataType: 'json',
            success: function(data)
            {
                window.location.replace("<%= request.getContextPath()%>/view/viewSignin");
            }
        });
    }
</script>