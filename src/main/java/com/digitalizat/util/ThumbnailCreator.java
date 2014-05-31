/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.util;

import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;
import java.awt.Image;
import java.awt.Rectangle;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.awt.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

/**
 *
 * @author rallibau
 */
public class ThumbnailCreator {

    public static String createThumbnail(String pathParent,String filename) throws IOException {
        RandomAccessFile raf = new RandomAccessFile(new File(pathParent+filename), "r");
        FileChannel channel = raf.getChannel();
        ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
        PDFFile pdffile = new PDFFile(buf);
        PDFPage page = pdffile.getPage(0);
        Rectangle rect = new Rectangle(0, 0,
                (int) page.getBBox().getWidth(),
                (int) page.getBBox().getHeight());
        Image img = page.getImage(
                rect.width, rect.height, //width & height
                rect, // clip rect
                null, // null for the ImageObserver
                true, // fill background with white
                true // block until drawing is done
        );
        String pathSalida = pathParent+filename+".png";
        ImageIO.write(ThumbnailCreator.toBufferedImage(img), "png", new FileOutputStream(pathSalida));
        return pathSalida;
    }

    private static BufferedImage toBufferedImage(Image src) {
        int w = src.getWidth(null);
        int h = src.getHeight(null);
        int type = BufferedImage.TYPE_INT_RGB;  // other options
        BufferedImage dest = new BufferedImage(w, h, type);
        Graphics2D g2 = dest.createGraphics();
        g2.drawImage(src, 0, 0, null);
        g2.dispose();
        return dest;
    }

}
