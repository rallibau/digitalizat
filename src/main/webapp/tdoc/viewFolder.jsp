<%-- 
    Document   : viewDeskTop
    Created on : 25-may-2014, 16:30:29
    Author     : rallibau
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="aplyTemplate">
    <tiles:putAttribute name="title">
        Escritorio
    </tiles:putAttribute>
    <tiles:putAttribute name="body">
        <ul id="nav">
            <li><a href="#subirDoc" role="button" data-toggle="modal"><i class="icon-plus icon-white big"></i></a></li>
            <li><a href="#crearCarpeta" role="button" data-toggle="modal"><i class="icon-folder-close icon-white big"></i></a></li>
            <li><a href="#myModal" role="button" data-toggle="modal"><i class="icon-search icon-white big"></i></a></li>
        </ul>
        <div style="width: 100%;padding-top: 40px;padding-bottom: 10px;text-align: center;">
            <ul class="breadcrumb">
                <li><a href="#">Home</a> <span class="divider">/</span></li>
                <li><a href="#">Library</a> <span class="divider">/</span></li>
                <li class="active">Data</li>
            </ul>
        </div>
        <div style="width: 100%;" ng-controller="seeFolderController">
            <div style="width:120px; float: left; margin: 20px; margin-top: 0px;"  ng-repeat="folder in folderInfo.folders">
                <div ng-if="true">
                    <img class="carpeta" src="${pageContext.request.contextPath}/img/folder2.png" onclick='window.location.href = "'>
                    <div class="docTittle" style="width: 110px;">
                        <a href="${pageContext.request.contextPath}/view/viewFolder/{{folder.id}}">{{folder.name}}</a>
                    </div>
                </div>
            </div>
            <div style="width:120px; float: left; margin: 20px; margin-top: 0px;" ng-repeat="doc in folderInfo.docs">
                <div ng-if="doc.mime === 'pdf.png'">
                    <img class="miniatura" src="${pageContext.request.contextPath}/view/obtenerMiniatura?codigo={{doc.id}}" onclick='window.location.href = "fileView/" + doc.id'>
                    <div class="docTittle" style="width: 110px;">
                        <a href="${pageContext.request.contextPath}/view/fileView/{{doc.id}}">{{doc.fileName}}</a>
                    </div>
                </div>
                <div  ng-if="doc.mime !== 'pdf.png'">
                    <img class="carpeta" src="${pageContext.request.contextPath}/img/{{doc.mime}}" onclick='window.location.href = "fileView/" + doc.id'>
                    <div class="docTittle" style="width: 110px;">
                        <a href="${pageContext.request.contextPath}/view/fileView/{{doc.id}}">{{doc.fileName}}</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="subirDoc" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Subir un documento</h3>
            </div>
            <form class="form-search" method="post" action="${pageContext.request.contextPath}/view/guardarFichero?idFolder=${requestScope.idFolder}" enctype="multipart/form-data" commandName="fileFormBean">
                <input type="file" id="file" name="file" class="input-medium search-query">
                <input type="hidden" id="idFolder" value="${requestScope.idFolder}" />
                <div style="height: 40px;">&nbsp;</div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                    <button type="submit" class="btn">Subir</button>
                </div>
            </form>
        </div>
        <div id="crearCarpeta" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Carpeta nueva</h3>
            </div>
            <form:form class="form-search" style="padding: 5px;" method="post" modelAttribute="folder" enctype="multipart/form-data" action="${pageContext.request.contextPath}/view/createFolder">

                <label class="control-label" for="name">Nombre</label>
                <form:input path="name"/>
                <form:hidden path="idParent" />
                <div class="modal-footer" style="margin-top: 5px;">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <button type="submit" class="btn">Crear</button>
                </div>
            </form:form >
        </div>


    </tiles:putAttribute>
</tiles:insertDefinition>
