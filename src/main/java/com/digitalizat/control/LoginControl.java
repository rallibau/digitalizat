/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.digitalizat.control;

import com.digitalizat.data.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author rallibau
 */
@Controller
public class LoginControl {
    @RequestMapping(value="doLogin")
    public @ResponseBody User doLogin(@RequestParam(value = "user", required = true) String user,HttpServletRequest request){
        System.out.println("HomeController: Passing through...");
        HttpSession sesion = request.getSession();
        
        sesion.setAttribute("logged", true);
        User usuario = new User();
        usuario.setAcronimo(user);
        sesion.setAttribute("user", usuario);
        sesion.setAttribute("acronimo", user);
        
        return usuario;
    }
    
    @RequestMapping(value="doLoginClose")
    public @ResponseBody Integer doLoginClose(HttpServletRequest request){
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        return 1;
    }
    
}
