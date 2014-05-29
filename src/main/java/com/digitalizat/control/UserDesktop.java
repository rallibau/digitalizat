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
public class UserDesktop {
    @RequestMapping(value = "viewDeskTop")
    public String viewDeskTop(HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("logged")!=null && ((Boolean)sesion.getAttribute("logged"))){
            return "plataforma/viewDeskTop";
        }else{
            return "plataforma/signin";
        }
    }
    
}
