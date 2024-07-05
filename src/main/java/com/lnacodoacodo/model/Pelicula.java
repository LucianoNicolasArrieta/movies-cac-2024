package com.lnacodoacodo.model;

public class Pelicula {
  private int id;
  private String titulo;
  private String fechaDeEstreno;
  private String categorias;
  private int duracion; // Duración en minutos
  private String sinopsis;
  private String director;
  private String portada; // Path a la imagen de la portada
  private String fondo; // Path a la imagen del fondo
  private String estado; // Estado de la película
  private String lenguajeOriginal;
  private double presupuesto; // Presupuesto en la moneda que uses
  private double ingresos; // Ingresos en la moneda que uses
  private String trailer;
  private Boolean aclamada;

  // Constructor
  public Pelicula(int id, String titulo, String fechaDeEstreno, String categorias, int duracion,
                  String sinopsis, String director, String portada, String fondo, String estado,
                  String lenguajeOriginal, double presupuesto, double ingresos, String trailer, Boolean aclamada) {
    this.id = id;
    this.titulo = titulo;
    this.fechaDeEstreno = fechaDeEstreno;
    this.categorias = categorias;
    this.duracion = duracion;
    this.sinopsis = sinopsis;
    this.director = director;
    this.portada = portada;
    this.fondo = fondo;
    this.estado = estado;
    this.lenguajeOriginal = lenguajeOriginal;
    this.presupuesto = presupuesto;
    this.ingresos = ingresos;
    this.trailer = trailer;
    this.aclamada = aclamada;
  }

  // Getters y Setters
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getTitulo() {
    return titulo;
  }

  public void setTitulo(String titulo) {
    this.titulo = titulo;
  }

  public String getFechaDeEstreno() {
    return fechaDeEstreno;
  }

  public void setFechaDeEstreno(String fechaDeEstreno) {
    this.fechaDeEstreno = fechaDeEstreno;
  }

  public String getCategorias() {
    return categorias;
  }

  public void setCategorias(String categorias) {
    this.categorias = categorias;
  }

  public int getDuracion() {
    return duracion;
  }

  public void setDuracion(int duracion) {
    this.duracion = duracion;
  }

  public String getSinopsis() {
    return sinopsis;
  }

  public void setSinopsis(String sinopsis) {
    this.sinopsis = sinopsis;
  }

  public String getDirector() {
    return director;
  }

  public void setDirector(String director) {
    this.director = director;
  }

  public String getPortada() {
    return portada;
  }

  public void setPortada(String portada) {
    this.portada = portada;
  }

  public String getFondo() {
    return fondo;
  }

  public void setFondo(String fondo) {
    this.fondo = fondo;
  }

  public String getEstado() {
    return estado;
  }

  public void setEstado(String estado) {
    this.estado = estado;
  }

  public String getLenguajeOriginal() {
    return lenguajeOriginal;
  }

  public void setLenguajeOriginal(String lenguajeOriginal) {
    this.lenguajeOriginal = lenguajeOriginal;
  }

  public double getPresupuesto() {
    return presupuesto;
  }

  public void setPresupuesto(double presupuesto) {
    this.presupuesto = presupuesto;
  }

  public double getIngresos() {
    return ingresos;
  }

  public String getTrailer() {
    return trailer;
  }

  public void setTrailer(String trailer) {
    this.trailer = trailer;
  }

  public Boolean getAclamada() {
    return aclamada;
  }

  public void setAclamada(Boolean aclamada) {
    this.aclamada = aclamada;
  }

  public void setIngresos(double ingresos) {
    this.ingresos = ingresos;
  }

}
