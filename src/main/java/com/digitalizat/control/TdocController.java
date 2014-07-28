/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

import com.digitalizat.business.TdocManager;
import com.digitalizat.document.dao.Document;
import com.digitalizat.properties.ServerProperties;
import com.digitalizat.user.dao.User;
import com.digitalizat.util.ThumbnailCreator;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author rallibau
 */
@Controller
public class TdocController {

    @Autowired
    TdocManager tdocManager;

    @Autowired
    ServerProperties serverProperties;

    @RequestMapping(value = "obtenerFichero/{codigo}")
    public void obtenerFichero(@PathVariable(value = "codigo") String codigo, HttpServletResponse response) throws FileNotFoundException, IOException, Exception {

        Document doc = tdocManager.getDocument(Integer.valueOf(codigo));

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=" + doc.getFileName().replace(" ", ""));

        InputStream is = new FileInputStream(doc.getBasePath() + doc.getFileName());

        IOUtils.copy(is, response.getOutputStream());

        response.flushBuffer();

    }

    @RequestMapping(value = "obtenerMiniatura")
    public void obtenerMiniatura(@RequestParam(value = "codigo", required = true) String codigo, HttpServletResponse response) throws FileNotFoundException, IOException, Exception {
        Integer cod = null;
        try {
            cod = Integer.valueOf(codigo);
        } catch (Exception e) {

        }
        if (cod != null) {
            Document doc = tdocManager.getDocument(Integer.valueOf(codigo));
            String salida = ThumbnailCreator.createThumbnail(doc.getBasePath(), doc.getFileName());
            response.setContentType("image/png");
            response.setHeader("Content-Disposition", "attachment; filename=" + doc.getFileName() + ".png");
            InputStream is = new FileInputStream(salida);
            IOUtils.copy(is, response.getOutputStream());

            response.flushBuffer();
        }

    }

    @RequestMapping(value = "guardarFichero", method = RequestMethod.POST)
    public String guardarFichero(@RequestParam(value = "file", required = true) CommonsMultipartFile file, @RequestParam(value = "idFolder", required = true) Integer idFolder, HttpServletRequest request, Model m) throws FileNotFoundException, IOException, Exception {
        HttpSession sesion = request.getSession();
        User usuarioLogado;
        if (sesion.getAttribute("user") == null && (!(Boolean) sesion.getAttribute("logged"))) {
            throw new Exception("Login requerido");
        } else {
            usuarioLogado = (User) sesion.getAttribute("user");
        }
        File localFile = new File(serverProperties.getRutaGestorDocumental() + file.getOriginalFilename());
        FileOutputStream os;
        os = new FileOutputStream(localFile);
        os.write(file.getBytes());

        Document doc = new Document();
        doc.setBasePath(serverProperties.getRutaGestorDocumental());
        doc.setPathdoc("/" + usuarioLogado.getBranch().getId() + "/");
        doc.setBranch(usuarioLogado.getBranch());
        doc.setFileName(file.getOriginalFilename());
        if (idFolder != null && !idFolder.equals(new Integer(0))) {
            doc.setParent(tdocManager.getDocument(idFolder));
        }
        doc.setFolder(Boolean.FALSE);
        tdocManager.addDocument(doc);
        return "index.html#/tdoc";
    }

    @RequestMapping(value = "getDocList/{idfolder}")
    public @ResponseBody List<Document> getDocList(@PathVariable(value = "idfolder") Integer idfolder, HttpServletRequest request) throws Exception {
        List<Document> docs = null;
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            User logado = (User) sesion.getAttribute("user");
            if (idfolder == 0) {
                idfolder = null;
            }
            docs = tdocManager.listDocuments(logado.getBranch().getId(), idfolder);
        }

        return docs;

    }

//    @RequestMapping(value = "createFolder", method = RequestMethod.POST)
//    public String createFolder(@ModelAttribute("folder") Folder folder, Model m, HttpServletRequest request) {
//        return "";
//
//    }

    @RequestMapping(value = "viewFolder/{idfolder}")
    public String viewFolder(@PathVariable(value = "idfolder") Integer idfolder, Model m, HttpServletRequest request) throws Exception {
        return "";
    }

    @RequestMapping(value = "fileView/{codigo}")
    public String fileView(@PathVariable(value = "codigo") String codigo, HttpServletRequest request) throws Exception {
        HttpSession sesion = request.getSession();
        Document doc = tdocManager.getDocument(Integer.valueOf(codigo));
        request.setAttribute("documento", doc);
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "/tdoc/fileView";
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

}
