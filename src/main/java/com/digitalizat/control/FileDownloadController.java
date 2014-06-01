/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

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
import org.springframework.stereotype.Controller;
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

    @RequestMapping(value = "obtenerFichero")
    public void obtenerFichero(@RequestParam(value = "codigo", required = true) String codigo, HttpServletResponse response) throws FileNotFoundException, IOException {
        String nombreFichero = "legis.pdf";
        String unPath = "/Volumes/datos/docStore/";

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename="+ nombreFichero );

        InputStream is = new FileInputStream(unPath + nombreFichero);

        IOUtils.copy(is, response.getOutputStream());
       
        response.flushBuffer();

    }
    
    @RequestMapping(value = "obtenerMiniatura")
    public void obtenerMiniatura(@RequestParam(value = "codigo", required = true) String codigo, HttpServletResponse response) throws FileNotFoundException, IOException {
        String nombreFichero = "legis.pdf";
        String unPath = "/Volumes/datos/docStore/";
        String salida =ThumbnailCreator.createThumbnail(unPath,nombreFichero);

        response.setContentType("image/png");
        response.setHeader("Content-Disposition", "attachment; filename="+ nombreFichero+".png" );

        InputStream is = new FileInputStream(salida);

        IOUtils.copy(is, response.getOutputStream());
       

        response.flushBuffer();

    }
    
    @RequestMapping(value = "guardarFichero",method = RequestMethod.POST)
    public String guardarFichero(@RequestParam(value = "file", required = true)CommonsMultipartFile file,HttpServletRequest request) throws FileNotFoundException, IOException {
        File localFile = new File("/Volumes/datos/docStore/" + file.getOriginalFilename());
        FileOutputStream os;
        os = new FileOutputStream(localFile);
        os.write(file.getBytes());
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "plataforma/newFile";
        } else {
            return "plataforma/signin";
        }

    }

}
