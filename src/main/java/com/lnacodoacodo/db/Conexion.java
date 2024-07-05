package com.lnacodoacodo.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {
  public String driver = "com.mysql.cj.jdbc.Driver";

  public Connection getConexion() throws ClassNotFoundException{
    Connection conexion = null;

    try {
      Class.forName(driver);
      conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac_movies", "root", "1234");
    } catch (SQLException e) {
      System.out.println("Error "+ e.getErrorCode() + ": " + e.getMessage());
    }

    return conexion;
  }

/* Main para probar la db
  public static void main(String[] args) throws ClassNotFoundException, SQLException {
    Connection conexion = null;
    Conexion con = new Conexion();
    conexion = con.getConexion();

    PreparedStatement ps;
    ResultSet rs;

    ps = conexion.prepareStatement("select * from peliculas");
    rs = ps.executeQuery();

    while (rs.next()) {
      String titulo = rs.getString("titulo");
      System.out.println(titulo);
    }
  }
*/
}
