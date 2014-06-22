/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.digitalizat.control;

import com.digitalizat.business.ACLMananger;
import com.digitalizat.resource.dao.Resource;
import com.digitalizat.user.dao.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author rallibau
 */
@Controller
public class ACLController {
    
    @Autowired
    ACLMananger aclManager;
    
    @RequestMapping(value = "getUserMenu")
    public @ResponseBody List<Resource> getUserMenu(HttpServletRequest request){
        HttpSession sesion = request.getSession();
        User logado = (User)sesion.getAttribute("user");
        return aclManager.getAllResource(logado.getId());
        
    } 
    
}
