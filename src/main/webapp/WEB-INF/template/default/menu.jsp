<%-- 
    Document   : menu
    Created on : 24-may-2014, 0:59:04
    Author     : rallibau
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="area" value="${requestScope.area}" />
<div id="menu" class="container">
    <ul>
        <c:if test="${area eq 'portada'}">
            <li class="current_page_item"><a href="portada.view" accesskey="1" title="">Inicio</a></li>
            <li><a href="servicios.view" accesskey="1" title="">Servicios</a></li>
        </c:if>
        <c:if test="${area eq 'servicios'}">
            <li><a href="portada.view" accesskey="1" title="">Inicio</a></li>
            <li class="current_page_item"><a href="servicios.view" accesskey="1" title="">Servicios</a></li>
        </c:if>    
       
    </ul>
</div>
