/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lna.peliculas.cac.servlets;

import com.lna.peliculas.cac.db.Conexion;
import com.lna.peliculas.cac.services.PeliculaService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class SvDelete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    Conexion conexion = new Conexion();
    PeliculaService peliculasService = new PeliculaService(conexion);
        
        try { 
            peliculasService.deletePeliculaById(Integer.parseInt(request.getParameter("id")));
        } catch (SQLException ex) {
            Logger.getLogger(SvDelete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvDelete.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    response.sendRedirect("abm-peliculas.jsp");
    }
}
