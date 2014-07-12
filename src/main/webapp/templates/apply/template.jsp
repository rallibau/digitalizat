<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Justifiable 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130801

-->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><tiles:getAsString name="title" /></title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800|Open+Sans+Condensed:300,700" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="<%= request.getContextPath()%>/fonts.css" rel="stylesheet" type="text/css" media="all" />
        <link href="<%= request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" media="screen" />
        <link href="<%= request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet" />    
        <link href="<%= request.getContextPath()%>/css/digitalizat.css" rel="stylesheet" />
        <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
        <script src="<%= request.getContextPath()%>/ferroMenu/jquery-1.9.1.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/ferroMenu/jquery.ferro.ferroMenu.css" type="text/css" />
        <script src="<%= request.getContextPath()%>/ferroMenu/jquery.ferro.ferroMenu-1.2.2.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                identFolder = '${requestScope.idFolder}';
                $("#nav").ferroMenu({
                    position: "center-top",
                    delay: 50,
                    rotation: 720,
                    margin: 45
                });
            });
        </script>
    </head>
    <body ng-app>
        <tiles:insertAttribute name="header" />
        <div class="container">
            <div class="row">
                <tiles:insertAttribute name="body" />
            </div>
        </div>
        <tiles:insertAttribute name="footer" />
    </body>
</html>
