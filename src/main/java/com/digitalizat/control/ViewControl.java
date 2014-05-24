/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author rallibau
 */
@Controller
public class ViewControl {

    @RequestMapping(value = "portada")
    public String viewPortada(HttpServletRequest request) {
        System.out.println("usuario a la portada!!!");
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("logged")==null){
            sesion.setAttribute("logged", false);
        }
        request.setAttribute("area", "portada");
        return "portada";
    }

    @RequestMapping(value = "servicios")
    public String viewServicios(HttpServletRequest request) {
        System.out.println("usuario a servicios!!!");
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("logged")==null){
            sesion.setAttribute("logged", false);
        }
        request.setAttribute("area", "servicios");
        return "servicios";
    }

}
