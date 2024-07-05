package com.lnacodoacodo.services;

import com.lnacodoacodo.db.Conexion;
import com.lnacodoacodo.model.Pelicula;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PeliculaService {
  private Conexion conexion;

  public PeliculaService(Conexion conexion) {
    this.conexion = conexion;
  }

  public List<Pelicula> obtenerTodas() throws SQLException, ClassNotFoundException {
    List<Pelicula> peliculas = new ArrayList<>();
    Connection connection = conexion.getConexion();
    String query = "SELECT * FROM peliculas";

    PreparedStatement ps = connection.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
      Pelicula pelicula = new Pelicula(rs.getInt("id"),
          rs.getString("titulo"),
          rs.getString("fecha_de_estreno"),
          rs.getString("categorias"),
          rs.getInt("duracion"),
          rs.getString("sinopsis"),
          rs.getString("director"),
          rs.getString("portada"),
          rs.getString("fondo"),
          rs.getString("estado"),
          rs.getString("lenguaje_original"),
          rs.getDouble("presupuesto"),
          rs.getDouble("ingresos"),
          rs.getString("trailer"),
          rs.getBoolean("aclamada"));

      peliculas.add(pelicula);
    }

    rs.close();
    ps.close();
    connection.close();

    return peliculas;
  }

  public Pelicula getPeliculaById(int id) throws SQLException, ClassNotFoundException {
    Connection connection = conexion.getConexion();
    String query = "SELECT * FROM peliculas WHERE id=?";
    Pelicula pelicula = null;
    
    PreparedStatement ps = connection.prepareStatement(query);
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      pelicula = new Pelicula(rs.getInt("id"),
          rs.getString("titulo"),
          rs.getString("fecha_de_estreno"),
          rs.getString("categorias"),
          rs.getInt("duracion"),
          rs.getString("sinopsis"),
          rs.getString("director"),
          rs.getString("portada"),
          rs.getString("fondo"),
          rs.getString("estado"),
          rs.getString("lenguaje_original"),
          rs.getDouble("presupuesto"),
          rs.getDouble("ingresos"),
          rs.getString("trailer"),
          rs.getBoolean("aclamada"));
    }
    rs.close();
    ps.close();
    connection.close();

    return pelicula;
  }

  public void addPelicula(Pelicula pelicula) throws SQLException, ClassNotFoundException {
    Connection connection = conexion.getConexion();
    String query = "INSERT INTO peliculas";

    PreparedStatement ps = connection.prepareStatement(query);
    ps.executeUpdate();

    ps.close();
    connection.close();
  }

  public void deletePeliculaById(int id) throws SQLException, ClassNotFoundException {
    Connection connection = conexion.getConexion();
    String query = "DELETE FROM peliculas WHERE id=?";

    PreparedStatement ps = connection.prepareStatement(query);
    ps.setInt(1, id);
    ps.executeUpdate();


    ps.close();
    connection.close();
  }

  public List<Pelicula> obtenerNoAclamadas() throws SQLException, ClassNotFoundException {
    List<Pelicula> peliculas = new ArrayList<>();
    Connection connection = conexion.getConexion();
    String query = "SELECT * FROM peliculas WHERE aclamada = 0";

    PreparedStatement ps = connection.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
      Pelicula pelicula = new Pelicula(rs.getInt("id"),
          rs.getString("titulo"),
          rs.getString("fecha_de_estreno"),
          rs.getString("categorias"),
          rs.getInt("duracion"),
          rs.getString("sinopsis"),
          rs.getString("director"),
          rs.getString("portada"),
          rs.getString("fondo"),
          rs.getString("estado"),
          rs.getString("lenguaje_original"),
          rs.getDouble("presupuesto"),
          rs.getDouble("ingresos"),
          rs.getString("trailer"),
          rs.getBoolean("aclamada"));

      peliculas.add(pelicula);
    }

    rs.close();
    ps.close();
    connection.close();

    return peliculas;
  }

  public List<Pelicula> obtenerAclamadas() throws SQLException, ClassNotFoundException {
    List<Pelicula> peliculas = new ArrayList<>();
    Connection connection = conexion.getConexion();
    String query = "SELECT * FROM peliculas WHERE aclamada = 1";

    PreparedStatement ps = connection.prepareStatement(query);
    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
      Pelicula pelicula = new Pelicula(rs.getInt("id"),
          rs.getString("titulo"),
          rs.getString("fecha_de_estreno"),
          rs.getString("categorias"),
          rs.getInt("duracion"),
          rs.getString("sinopsis"),
          rs.getString("director"),
          rs.getString("portada"),
          rs.getString("fondo"),
          rs.getString("estado"),
          rs.getString("lenguaje_original"),
          rs.getDouble("presupuesto"),
          rs.getDouble("ingresos"),
          rs.getString("trailer"),
          rs.getBoolean("aclamada"));

      peliculas.add(pelicula);
    }

    rs.close();
    ps.close();
    connection.close();

    return peliculas;
  }

  public static void main(String[] args) throws SQLException, ClassNotFoundException {
    Conexion conexion1 = new Conexion();
    PeliculaService ps = new PeliculaService(conexion1);
    Pelicula pelicula = ps.getPeliculaById(1);
    List<Pelicula> peliculas= ps.obtenerTodas();

    System.out.println(pelicula.getTitulo());
  }

}
