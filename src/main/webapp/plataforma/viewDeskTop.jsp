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
        <div class="row-fluid">
            <div class="span3">
                <div class="" style="">
                    <ul class="nav nav-list">
                        <li class="nav-header">Mi archivo</li>
                        <li class="active"><a href="#">Carpeta</a></li>
                        <li><a href="#">Inbox</a></li>
                        <li><a href="#">Buscador</a></li>
                        <li><a href="newFile">Nuevo</a></li>
                    </ul>

                </div>
            </div>
            <div class="span6">
                <c:forEach var="doc" items="${docs}" varStatus="status">
                    <div style="width:120px; float: left; margin: 20px;">
                        <img class="miniatura" style="width: 110px; height: 150px;" src="obtenerMiniatura.server?codigo=${doc.id}" onclick="window.location.href = 'fileView/${doc.id}'">
                        <div class="docTittle" style="width: 110px;">
                            <a href="fileView/${doc.id}">${doc.fileName}</a>
                        </div>
                    </div>

                </c:forEach>
            </div>
            <div class="span2">
                <ul class="nav nav-list">
                    <li class="nav-header">Actividad</li>
                    <li><a href="#">Todos los eventos</a></li>
                    <li><a href="#">Entradas</a></li>
                    <li><a href="#">Modificaciones </a></li>
                    <li><a href="#">Visualizaciones</a></li>
                </ul>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>
