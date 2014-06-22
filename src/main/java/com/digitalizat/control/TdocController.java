/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

import com.digitalizat.business.TdocManager;
import com.digitalizat.document.dao.Document;
import com.digitalizat.resource.dao.Resource;
import com.digitalizat.user.dao.User;
import java.util.ArrayList;
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
public class TdocController {

    @Autowired
    TdocManager tdocManager;

    @RequestMapping(value = "getDocList")
    public @ResponseBody
    List<Document> getDocList(HttpServletRequest request) throws Exception {

        List<Document> docs = null;

        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            User logado = (User) sesion.getAttribute("user");
            docs = tdocManager.listDocuments(logado.getBranch().getId());
        }

        return docs;

    }

}
