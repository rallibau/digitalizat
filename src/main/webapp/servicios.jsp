<%-- 
    Document   : servicios
    Created on : 24-may-2014, 10:27:10
    Author     : rallibau
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="title">
        Digitalitzat.com, Servicios
    </tiles:putAttribute>
    <tiles:putAttribute name="body">
        <div id="page">
            <div><span class="arrow-down"></span></div>
            <div id="box1">
                <div class="title">
                    <h2>tCloud</h2>
                    <span class="byline">es un modelo de almacenamiento de datos basado en redes</span> 
                </div>
                <p>Las compañías de alojamiento operan enormes centros de procesamiento de datos. Los usuarios que requieren estos servicios compran o alquilan la capacidad de almacenamiento necesaria. </p>
                
            </div>
            <div id="box2" style="text-align: center;">
                <a target="_blank" href="viewSignin.view" class="button" style="margin-top: 100px;">Acceder</a>
            </div>
        </div>
         <div id="page">
            <div id="box1">
                <div class="title">
                    <h2>tCocinamos</h2>
                    <span class="byline">es un modelo de almacenamiento de datos basado en redes</span> 
                </div>
                <p>Las compañías de alojamiento operan enormes centros de procesamiento de datos. Los usuarios que requieren estos servicios compran o alquilan la capacidad de almacenamiento necesaria. </p>
                
            </div>
            <div id="box2" style="text-align: center;">
                <a target="_blank" href="viewSignin.view" class="button" style="margin-top: 100px;">Acceder</a>
            </div>
        </div>
        <div id="page">
            <div id="box1">
                <div class="title">
                    <h2>tLimpiamos</h2>
                    <span class="byline">es un modelo de almacenamiento de datos basado en redes</span> 
                </div>
                <p>Las compañías de alojamiento operan enormes centros de procesamiento de datos. Los usuarios que requieren estos servicios compran o alquilan la capacidad de almacenamiento necesaria. </p>
                
            </div>
            <div id="box2" style="text-align: center;">
                <a target="_blank" href="viewSignin.view" class="button" style="margin-top: 100px;">Acceder</a>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>