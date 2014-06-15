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
        <link href="<%= request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <link href="<%= request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet" />    
        <link href="<%= request.getContextPath()%>/css/digitalizat.css" rel="stylesheet" />
        <!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
        <style type="text/css">

            /* Sticky footer styles
            -------------------------------------------------- */

            html,
            body {
                height: 100%;
                /* The html and body elements cannot have any padding or margin. */
            }

            /* Wrapper for page content to push down footer */
            #wrap {
                min-height: 100%;
                height: auto !important;
                height: 100%;
                /* Negative indent footer by it's height */
                margin: 0 auto -60px;
            }

            /* Set the fixed height of the footer here */
            #push,
            #footer {
                height: 60px;
            }
            #footer {
                background-color: #f5f5f5;
            }

            /* Lastly, apply responsive CSS fixes as necessary */
            @media (max-width: 767px) {
                #footer {
                    margin-left: -20px;
                    margin-right: -20px;
                    padding-left: 20px;
                    padding-right: 20px;
                }
            }



            /* Custom page CSS
            -------------------------------------------------- */
            /* Not required for template or sticky footer method. */

            .container {
                width: auto;
                max-width: 680px;
            }
            .container .credit {
                margin: 20px 0;
            }
            .form-signin {
                max-width: 300px;
                padding: 19px 29px 29px;
                margin: 0 auto 20px;
                margin-top: 50px;
                background-color: #fff;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }
            .form-signin input[type="text"],
            .form-signin input[type="password"] {
                font-size: 16px;
                height: auto;
                margin-bottom: 15px;
                padding: 7px 9px;
            }

        </style>

    </head>
    <body>
        <div class="container-fluid">
            <tiles:insertAttribute name="header" />
            <tiles:insertAttribute name="body" />
            <tiles:insertAttribute name="footer" />
        </div>
        </div>
    </body>
</html>
