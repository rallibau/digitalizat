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
                    <li class="nav-header">Mi archivo</li>
                    <li class="active"><a href="#">Carpeta</a></li>
                    <li><a href="#">Inbox</a></li>
                    <li><a href="#">Buscador</a></li>
                    <li><a href="#">Nuevo</a></li>
                </ul>
                <ul class="nav nav-list">
                    <li class="nav-header">Actividad</li>
                    <li><a href="#">Todos los eventos</a></li>
                    <li><a href="#">Entradas</a></li>
                    <li><a href="#">Modificaciones </a></li>
                    <li><a href="#">Visualizaciones</a></li>
                </ul>
            </div>
        </div>
        <div class="span8" style="height:80vh;margin-top: 3vh;">
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="100x30" data-src="holder.js/230x180" style="width: 220px; height: 150px;" src="obtenerMiniatura.server?codigo=ficticio">
                            <div class="caption">
                                <h3><a href="fileView.view">legislacion laboral</a></h3>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="100x30" data-src="holder.js/230x180" style="width: 220px; height: 150px;" src="obtenerMiniatura.server?codigo=ficticio">
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="100x30" data-src="holder.js/230x180" style="width: 220px; height: 150px;" src="obtenerMiniatura.server?codigo=ficticio">
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="100x30" data-src="holder.js/230x180" style="width: 220px; height: 150px;" src="obtenerMiniatura.server?codigo=ficticio">
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="100x30" data-src="holder.js/230x180" style="width: 220px; height: 150px;" src="obtenerMiniatura.server?codigo=ficticio">
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <img alt="100x30" data-src="holder.js/230x180" style="width: 220px; height: 150px;" src="obtenerMiniatura.server?codigo=ficticio">
                            <div class="caption">
                                <h3>Thumbnail label</h3>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>
