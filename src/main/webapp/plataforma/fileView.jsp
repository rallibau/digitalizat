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
        <div style="text-align: center; width: 100%">
            <div style="width: 100%;padding-top: 10px;padding-bottom: 10px;">
                <a href="${pageContext.request.contextPath}/view/viewDeskTop" role="button" class="btn" data-toggle="modal"><i class="icon-th"></i>Mis documentos</a>
                <a href="${pageContext.request.contextPath}/view/viewDeskTop" role="button" class="btn" data-toggle="modal"><i class="icon-list-alt"></i>Metadatos</a>
                <a href="${pageContext.request.contextPath}/view/viewDeskTop" role="button" class="btn" data-toggle="modal"><i class="icon-user"></i>Permisos</a>
            </div>
            <div style="max-width: 1024px; margin: auto;">

                <div class="row-fluid">
                    <div class="span12">
                        <iframe style="margin: 5px;" id="iframe" src="${pageContext.request.contextPath}/web/viewer.html?file=/tcloud/server/obtenerFichero/${documento.id}" scrolling="no"></iframe>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>
