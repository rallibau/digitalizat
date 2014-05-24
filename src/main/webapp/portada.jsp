<%-- 
    Document   : portada
    Created on : 24-may-2014, 0:39:30
    Author     : rallibau
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="title">
        Digitalitzat.com, Portada
    </tiles:putAttribute>
    <tiles:putAttribute name="body">
        <div class="row spacerTop">
            <div class="span4 articuloPortada">
                <div id="tbox1"> 
                    <span class="icon-wrench granIbonico" /></span>
                    <div class="title spacerLateral">
                        <h2>Reducir gastos de mantemineto</h2>
                    </div>
                    <p class="spacerLateral">¿Alguna vez ha sentido curiosidad por saber cuánto le cuesta a su empresa trabajar con papel?   Si su respuesta es afirmativa, lo felicitamos, porque usted pertenece a un selecto y reducido grupo de empresarios.

                        Este asunto del costo de trabajar con papel pasa desapercibido para la mayoría de las empresas; y en otros casos sencillamente no se le presta la debida atención porque se piensa que el tema se refiere concretamente al costo de las resmas de papel que se compran cada mes.</p>
                    <div class="centrado">
                        <a href="#" class="button ">Aprender más</a> 
                    </div>
                </div>
            </div>
            <div class="span4 articuloPortada">
                <div id="tbox2"> <span class="icon granIbonico icon-cogs"></span>
                    <div class="title spacerLateral">
                        <h2>Alta disponibilidad</h2>
                    </div>
                    <p class="spacerLateral">Alta disponibilidad (High availability) es un protocolo de diseño del sistema y su implementación asociada que asegura un cierto grado absoluto de continuidad operacional durante un período de medición dado. Disponibilidad se refiere a la habilidad de la comunidad de usuarios para acceder al sistema, someter nuevos trabajos, actualizar o alterar trabajos existentes o recoger los resultados de trabajos previos. Si un usuario no puede acceder al sistema se dice que está no disponible. El término tiempo de inactividad (downtime) es usado para definir cuándo el sistema no está disponible.</p>
                    <div class="centrado">
                        <a href="#" class="button ">Aprender más</a> 
                    </div> 
                </div>
            </div>
            <div class="span4 articuloPortada">
                <div id="tbox3"> <span class="icon granIbonico icon-legal"></span>
                    <div class="title spacerLateral">
                        <h2>Cumplimiento de la ISO y la LOPD</h2>
                    </div>
                    <p class="spacerLateral">La LOPD establece las obligaciones que los responsables de los ficheros o tratamientos y los encargados de los tratamientos, tanto de organismos públicos como privados, han de cumplir para garantizar el derecho a la protección de los datos de carácter personal.El responsable de un fichero o tratamiento es la entidad, persona u órgano administrativo que decide sobre la finalidad, el contenido y el uso del tratamiento de los datos personales. </p>
                    <div class="centrado">
                        <a href="#" class="button ">Aprender más</a> 
                    </div>
                </div>
            </div>
        </div>

        <div id="page">
            <div><span class="arrow-down"></span></div>
            <div id="box1">
                <div class="title">
                    <h2>Almacenamiento en nube</h2>
                    <span class="byline">es un modelo de almacenamiento de datos basado en redes</span> 
                </div>
                <p>Las compañías de alojamiento operan enormes centros de procesamiento de datos. Los usuarios que requieren estos servicios compran o alquilan la capacidad de almacenamiento necesaria. </p>
                <a href="#" class="button">Aprender más</a>
            </div>
            <div id="box2">
                <div class="title">
                    <h2>Almacenamiento en su cpd</h2>
                    <span class="byline">Centro de procesamiento de datos</span> </div>
                <p>Se denomina centro de procesamiento de datos (CPD) a aquella ubicación donde se concentran los recursos necesarios para el procesamiento de la información de una organización. También se conoce como centro de cómputo en Hispanoamérica, o centro de cálculo en España o centro de datos por su equivalente en inglés data center.</p>	
                <a href="#" class="button">Aprender más</a>
            </div>
        </div>
    </div>    
</tiles:putAttribute>
</tiles:insertDefinition>
