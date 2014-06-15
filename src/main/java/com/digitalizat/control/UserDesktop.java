/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

import com.digitalizat.business.TdocManager;
import com.digitalizat.user.dao.User;
import com.digitalizat.document.dao.Document;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author rallibau
 */
@Controller
public class UserDesktop {

    @Autowired
    TdocManager tdocManager;

    @RequestMapping(value = "viewDeskTop")
    public String viewDeskTop(HttpServletRequest request) throws Exception {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            User logado = (User)sesion.getAttribute("user");
            List<Document> docs = tdocManager.listDocuments(logado.getBranch().getId());
            request.setAttribute("docs", docs);
            return "/plataforma/viewDeskTop";
        } else {
            return "/plataforma/signin";
        }
    }

    @RequestMapping(value = "fileView/{codigo}")
    public String fileView(@PathVariable(value="codigo") String codigo,HttpServletRequest request) throws Exception {
        HttpSession sesion = request.getSession();
        Document doc = tdocManager.getDocument(Integer.valueOf(codigo));
        request.setAttribute("documento", doc);
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "/plataforma/fileView";
        } else {
            return "/plataforma/signin";
        }
    }

    @RequestMapping(value = "newFile")
    public String newFile(HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "/plataforma/newFile";
        } else {
            return "/plataforma/signin";
        }
    }
    
    @RequestMapping(value = "users")
    public String users(HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "/plataforma/users";
        } else {
            return "/plataforma/users";
        }
    }
    
   
    
   
    
    

}
