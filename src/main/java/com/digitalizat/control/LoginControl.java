/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.digitalizat.control;

import com.digitalitzat.organization.dao.Organization;
import com.digitalitzat.organization.dao.OrganizationDAO;
import com.digitalitzat.organization.dao.OrganizationDaoIml;
import com.digitalitzat.user.dao.UserDAOImpl;
import com.digitalitzat.user.dao.User;
import com.digitalitzat.user.dao.UserDAO;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author rallibau
 */
@Controller
public class LoginControl {

    @RequestMapping(value = "doLogin")
    public @ResponseBody
    User doLogin(@RequestParam(value = "user", required = true) String user, @RequestParam(value = "pwd", required = true) String pwd, HttpServletRequest request) throws Exception {
        System.out.println("HomeController: Passing through...");
        UserDAO daouser = new UserDAOImpl();

        User usuarioALogar = daouser.getUser(user);

        MessageDigest mda = MessageDigest.getInstance("SHA-512");
        byte[] digesta = mda.digest(pwd.getBytes());
        if (!usuarioALogar.getPassword().equals(toHexadecimal(digesta))) {
            throw new Exception("La contrasenya no es correcta");
        }

        HttpSession sesion = request.getSession();

        sesion.setAttribute("logged", true);
        sesion.setAttribute("user", usuarioALogar);
        sesion.setAttribute("acronimo", usuarioALogar.getEmail());

        return usuarioALogar;
    }

    @RequestMapping(value = "saveUser")
    public @ResponseBody
    User saveUser(@RequestParam(value = "user", required = true) String user, @RequestParam(value = "pwd", required = true) String pwd, HttpServletRequest request) throws NoSuchAlgorithmException, NoSuchProviderException {
        System.out.println("HomeController: Passing through...");
        HttpSession sesion = request.getSession();

        Organization org = new Organization();
        org.setNombre("ficticia");
        OrganizationDAO daoOrg = new OrganizationDaoIml();
        daoOrg.addOrganization(org);

        sesion.setAttribute("logged", true);
        User usuario = new User();
        MessageDigest mda = MessageDigest.getInstance("SHA-512");
        byte[] digesta = mda.digest(pwd.getBytes());
        usuario.setPassword(toHexadecimal(digesta));
        usuario.setEmail(user);
        usuario.setOrganizacion(org);
        UserDAOImpl dao = new UserDAOImpl();
        dao.addUser(usuario);
        sesion.setAttribute("user", usuario);
        sesion.setAttribute("acronimo", user);

        return usuario;
    }

    private String toHexadecimal(byte[] digest) {
        String hash = "";
        for (byte aux : digest) {
            int b = aux & 0xff;
            if (Integer.toHexString(b).length() == 1) {
                hash += "0";
            }
            hash += Integer.toHexString(b);
        }
        return hash;
    }

    @RequestMapping(value = "doLoginClose")
    public @ResponseBody
    Integer doLoginClose(HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        return 1;
    }

    @RequestMapping(value = "viewSignin")
    public String viewSignin(HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "plataforma/viewDeskTop";
        } else {
            return "plataforma/signin";
        }
    }

    @RequestMapping(value = "viewNewUser")
    public String viewNewUser(HttpServletRequest request) {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("logged") != null && ((Boolean) sesion.getAttribute("logged"))) {
            return "plataforma/viewDeskTop";
        } else {
            return "plataforma/newUser";
        }
    }

}
