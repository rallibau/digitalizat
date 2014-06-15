<%-- 
    Document   : users
    Created on : 12-jun-2014, 20:39:56
    Author     : rallibau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <div class="" style="height:80vh;margin-top: 3vh;">
                    <ul class="nav nav-list">
                        <li class="nav-header">${documento.fileName} -  ${documento.id}</li>
                        <li class="active"><a href="#">Documento</a></li>
                        <li><a href="#">Atributos</a></li>
                        <li><a href="#">Versiones</a></li>
                        <li><a href="#">Permisos</a></li>
                        <li><a href="#">Metadatos</a></li>
                    </ul>
                </div>
            </div>
            <div class="span8" style="height:80vh;margin-top: 3vh;">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>