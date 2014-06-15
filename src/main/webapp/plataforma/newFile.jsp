<%-- 
    Document   : newFile
    Created on : 01-jun-2014, 11:27:01
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
                    <li class="nav-header">Subir nuevo documento</li>
                    <li class="active"><a href="#">Seleccione el fichero</a></li>
                    <li><a href="#">Atributos</a></li>
                    <li><a href="#">Permisos</a></li>
                    <li><a href="#">Metadatos</a></li>
                </ul>
            </div>
        </div>
        <div class="span8" style="height:80vh;margin-top: 3vh;">
            <form class="form-search" method="post" action="${pageContext.request.contextPath}/view/guardarFichero" enctype="multipart/form-data" commandName="fileFormBean">
                <input type="file" id="file" name="file" class="input-medium search-query">
                <button type="submit" class="btn">Subir</button>
            </form>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>
