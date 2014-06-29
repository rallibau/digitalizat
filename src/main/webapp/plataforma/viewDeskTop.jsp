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
                <a href="#myModal" role="button" class="btn" data-toggle="modal"><i class="icon-plus"></i>Subir documento</a>
            </div>

            <div style="max-width: 1024px; margin: auto; text-align: left;">
                <div class="span12" ng-controller="seeFolderController">
                    <div style="width:120px; float: left; margin: 20px; margin-top: 0px;" ng-repeat="doc in docs">
                        <img class="miniatura" src="obtenerMiniatura.server?codigo={{doc.id}}" onclick='window.location.href = "fileView/" + doc.id'>
                        <div class="docTittle" style="width: 110px;">
                            <a href="fileView/{{doc.id}}">{{doc.fileName}}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Subir un documento</h3>
            </div>
            <form class="form-search" method="post" action="${pageContext.request.contextPath}/view/guardarFichero" enctype="multipart/form-data" commandName="fileFormBean">
                <input type="file" id="file" name="file" class="input-medium search-query">
                <div style="height: 40px;">&nbsp;</div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                    <button type="submit" class="btn">Subir</button>
                </div>
            </form>
        </div>


    </tiles:putAttribute>
</tiles:insertDefinition>
