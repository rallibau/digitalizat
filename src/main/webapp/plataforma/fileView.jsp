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
        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
            <li class="active">
                <a href="#document" data-toggle="tab">Document</a>
            </li>
            <li>
                <a href="#metadatos" data-toggle="tab">Metadatos</a>
            </li>
            <li>
                <a href="#permisos" data-toggle="tab">Permisos</a>
            </li>
        </ul>
        <div  id="my-tab-content" class="tab-content">
             <div class="tab-pane active" id="document" style="text-align: center; width: 100%">
                <div style="max-width: 1024px; margin: auto;">

                    <div class="row-fluid">
                        <div class="span12">
                            <iframe style="margin: 5px;" id="iframe" src="${pageContext.request.contextPath}/web/viewer.html?file=/tcloud/server/obtenerFichero/${documento.id}" scrolling="no"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>
