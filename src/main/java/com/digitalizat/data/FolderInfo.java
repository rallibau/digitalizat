/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.digitalizat.data;

import com.digitalizat.document.dao.Document;
import com.digitalizat.folder.dao.Folder;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author rallibau
 */
public class FolderInfo implements Serializable{
    private List<Document> docs;
    private List<Folder> folders;
    
    public FolderInfo(){
        
    }

    public List<Document> getDocs() {
        return docs;
    }

    public void setDocs(List<Document> docs) {
        this.docs = docs;
    }

    public List<Folder> getFolders() {
        return folders;
    }

    public void setFolders(List<Folder> folders) {
        this.folders = folders;
    }
    
    
    
}
