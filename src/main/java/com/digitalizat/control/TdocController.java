/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

import com.digitalizat.business.TdocManager;
import com.digitalizat.data.FolderInfo;
import com.digitalizat.document.dao.Document;
import com.digitalizat.folder.dao.Folder;
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
    public void obtenerFichero(@PathVariable(value="codigo") String codigo, HttpServletResponse response) throws FileNotFoundException, IOException, Exception {
        
        Document doc = tdocManager.getDocument(Integer.valueOf(codigo));
        
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=" + doc.getFileName());

        InputStream is = new FileInputStream(doc.getBasePath() + doc.getFileName());

        IOUtils.copy(is, response.getOutputStream());

        response.flushBuffer();

    }

    @RequestMapping(value = "obtenerMiniatura")
    public void obtenerMiniatura(@RequestParam(value = "codigo", required = true) String codigo, HttpServletResponse response) throws FileNotFoundException, IOException, Exception {
        Document doc = tdocManager.getDocument(Integer.valueOf(codigo));
        String salida = ThumbnailCreator.createThumbnail(doc.getBasePath(), doc.getFileName());
        response.setContentType("image/png");
        response.setHeader("Content-Disposition", "attachment; filename=" + doc.getFileName() + ".png");
        InputStream is = new FileInputStream(salida);
        IOUtils.copy(is, response.getOutputStream());

        response.flushBuffer();

    }

    @RequestMapping(value = "guardarFichero", method = RequestMethod.POST)
    public String guardarFichero(@RequestParam(value = "file", required = true) CommonsMultipartFile file, HttpServletRequest request) throws FileNotFoundException, IOException {
        HttpSession sesion = request.getSession();
        User usuarioLogado;
        if (sesion.getAttribute("user") == null && (!(Boolean) sesion.getAttribute("logged"))) {
            return "plataforma/newFile";
        } else {
            usuarioLogado = (User) sesion.getAttribute("user");
        }
        File localFile = new File(serverProperties.getRutaGestorDocumental() + file.getOriginalFilename());
        FileOutputStream os;
        os = new FileOutputStream(localFile);
        os.write(file.getBytes());

        Document doc = new Document();
        doc.setBasePath(serverProperties.getRutaGestorDocumental());
        doc.setPathdoc("/"+usuarioLogado.getBranch().getId()+"/");
        doc.setBranch(usuarioLogado.getBranch());
        doc.setFileName(file.getOriginalFilename());
        tdocManager.addDocument(doc);

        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "/plataforma/viewDeskTop";
        } else {
            return "/plataforma/signin";
        }

    }

    @RequestMapping(value = "getDocList")
    public @ResponseBody FolderInfo getDocList(HttpServletRequest request) throws Exception {
        FolderInfo resultado = new FolderInfo();
        List<Document> docs = null;
        List<Folder> folders = null;

        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            User logado = (User) sesion.getAttribute("user");
            docs = tdocManager.listDocuments(logado.getBranch().getId());
            folders = tdocManager.getFolders(logado.getBranch().getId(), null);
        }
        resultado.setDocs(docs);
        resultado.setFolders(folders);
        return resultado;

    }

    @RequestMapping(value = "createFolder", method = RequestMethod.POST)
    public String createFolder(@ModelAttribute("folder") Folder folder,HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            User logado = (User) sesion.getAttribute("user");
            folder.setBranch(logado.getBranch());
            tdocManager.createFolder(folder);
            return "/plataforma/viewDeskTop";
        } else {
            return "/plataforma/signin";
        }

    }
    
     @RequestMapping(value = "viewDeskTop")
    public String viewDeskTop(Model m,HttpServletRequest request) throws Exception {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            //User logado = (User)sesion.getAttribute("user");
            //List<Document> docs = tdocManager.listDocuments(logado.getBranch().getId());
            //request.setAttribute("docs", docs);
            m.addAttribute("folder", new Folder());
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

}
