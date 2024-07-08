/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lna.peliculas.cac.servlets;

import com.lna.peliculas.cac.db.Conexion;
import com.lna.peliculas.cac.model.Pelicula;
import com.lna.peliculas.cac.services.PeliculaService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


public class SvUpdate extends HttpServlet {
    
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    Conexion conexion = new Conexion();
    PeliculaService peliculasService = new PeliculaService(conexion);
    
    Pelicula peliculaConNuevosValores = new Pelicula(Integer.parseInt(request.getParameter("id")),
    request.getParameter("titulo"),
    request.getParameter("fechaDeEstreno"),
    request.getParameter("categorias"),
    Integer.parseInt(request.getParameter("duracion")),
    request.getParameter("sinopsis"),
    request.getParameter("director"),
    request.getParameter("portada"),
    request.getParameter("fondo"),
    request.getParameter("estado"),
    request.getParameter("lenguajeOriginal"),
    request.getParameter("presupuesto"),
    request.getParameter("ingresos"),
    request.getParameter("trailer"),
    false);
    
        try {
            peliculasService.updatePelicula(peliculaConNuevosValores);
        } catch (SQLException ex) {
            Logger.getLogger(SvUpdate.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    
    response.sendRedirect("abm-peliculas.jsp");
  }
}
