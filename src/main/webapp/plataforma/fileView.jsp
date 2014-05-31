<%-- 
    Document   : viewDeskTop
    Created on : 25-may-2014, 16:30:29
    Author     : rallibau
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="aplyTemplate">
    <tiles:putAttribute name="title">
        Escritorio
    </tiles:putAttribute>
    <tiles:putAttribute name="body">
        <style type="text/css">
            .sidebar-nav {
                padding: 9px 0;
            }

            @media (max-width: 980px) {
                /* Enable use of floated navbar text */
                .navbar-text.pull-right {
                    float: none;
                    padding-left: 5px;
                    padding-right: 5px;
                }
            }
        </style>
        <div class="span3">
            <div class="well" style="height:80vh;margin-top: 3vh;">
                <ul class="nav nav-list">
                    <li class="nav-header">Legislacion laboral.pdf</li>
                    <li class="active"><a href="#">Documento</a></li>
                    <li><a href="#">Atributos</a></li>
                    <li><a href="#">Versiones</a></li>
                    <li><a href="#">Permisos</a></li>
                    <li><a href="#">Metadatos</a></li>
                </ul>
            </div>
        </div>
        <div class="span8" style="height:80vh;margin-top: 3vh;">
            <iframe id="iframe" src="web/viewer.html?file=/digitalizatWebSite/obtenerFichero.server?codigo=ficticio" scrolling="no"></iframe>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>
