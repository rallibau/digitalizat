/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.digitalitzat.formBean;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author rallibau
 */
public class FileFormBean {
    CommonsMultipartFile fichero;

    public CommonsMultipartFile getFichero() {
        return fichero;
    }

    public void setFichero(CommonsMultipartFile fichero) {
        this.fichero = fichero;
    }
    
    
}
