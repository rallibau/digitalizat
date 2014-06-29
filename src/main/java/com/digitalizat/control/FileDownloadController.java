/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

import com.digitalizat.business.TdocManager;
import com.digitalizat.user.dao.User;
import com.digitalizat.document.dao.Document;
import com.digitalizat.properties.ServerProperties;
import com.digitalizat.util.ThumbnailCreator;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author rallibau
 */
@Controller
public class FileDownloadController {
    
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

}
