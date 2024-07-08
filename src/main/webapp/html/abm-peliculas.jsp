<%@ page import="com.lna.peliculas.cac.db.Conexion" %>
<%@ page import="com.lna.peliculas.cac.services.PeliculaService" %>
<%@ page import="com.lna.peliculas.cac.model.Pelicula" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CAC Movies | Home</title>
        <link rel="icon" href="pelicula.ico" type="image/x-icon">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/abm.css">
        <link rel="stylesheet" href="../css/styles.css">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="https://kit.fontawesome.com/917ede469a.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </head>

    <body>
        <header class="">
            <nav class="navbar fw-semibold">
                <div class="container-fluid justify-content-center justify-content-md-between flex-column flex-md-row">
                    <div class="pb-2 p-md-0 d-flex align-items-center">
                        <i class="fa-solid fa-film me-2" style="color: #ffffff;"></i>
                        <a class="navbar-brand text-white" href="../index.jsp">CAC-Movies</a>
                    </div>
                    <div>
                        <a class="nav-item nav-link d-inline px-md-4 py-md-2 mx-2" href="../index.html">Tendencias</a>
                        <a class="nav-item nav-link d-inline px-md-4 py-md-2 mx-2" href="registro.html">Registrarse</a>
                        <a class="nav-item nav-link d-inline px-md-4 py-md-2 mx-2" href="login.html" id="login-btn">Iniciar
                            Sesión</a>
                    </div>
                </div>
            </nav>
        </header>
        <section id="creacion-pelicula" class="m-2 d-flex justify-content-center">
            <div id="" class="form container text-center text-lg-start rounded-2 m-0 d-flex justify-content-center p-5">
                <div class="w-50">
                    <h1 class="text-center">Añadir Película</h1>
                    <form action="SvInsert" method="post" class="d-flex flex-column align-items-center" id="insert-form">
                        <input type="text" name="titulo" id="titulo" class="form-control rounded" placeholder="Titulo" required>
                        <input type="date" name="fechaDeEstreno" id="fechaDeEstreno" class="form-control rounded" required>
                        <input type="text" name="categorias" id="categorias" class="form-control rounded" placeholder="Categorias" required>
                        <input type="number" name="duracion" id="duracion" class="form-control rounded" placeholder="Duracion en minutos" required>
                        <input type="text" name="sinopsis" id="sinopsis" class="form-control rounded" placeholder="Sinopsis" required>
                        <input type="text" name="director" id="director" class="form-control rounded" placeholder="Director" required>
                        <input type="text" name="portada" id="portada" class="form-control rounded" placeholder="Link a la imagen de portada" required>
                        <input type="text" name="fondo" id="fondo" class="form-control rounded" placeholder="Link a la imagen de fondo" required>
                        <select name="estado" id="estado" class="form-select rounded" required>
                            <option value="" selected disabled hidden>Estado</option>
                            <option value="released" >Released</option>
                            <option value="cancelled" >Cancelled</option>
                            <option value="announced" >Announced</option>
                            <option value="upcoming" >Upcoming</option>
                        </select>
                        <input type="text" name="lenguajeOriginal" id="lenguajeOriginal" class="form-control rounded" placeholder="Lenguaje original" required>
                        <input type="number" name="presupuesto" id="presupuesto" class="form-control rounded" placeholder="Presupuesto">
                        <input type="number" name="ingresos" id="ingresos" class="form-control rounded" placeholder="Ingresos">
                        <input type="text" name="trailer" id="trailer" class="form-control rounded" placeholder="Link al trailer de la película" required>
                        <div class="container-fluid d-flex flex-column justify-content-center align align-items-center">
                            <button type="submit" class="boton-prim btn rounded-3 w-100" id="crear-pelicula" form="insert-form">Añadir</button>
                            <a href="../index.jsp" class="btn-secondary mt-4">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <div class="d-flex justify-content-center ">
            <hr class="w-75">
        </div>
        <section id="peliculas" class="">
            <div class="ms-5 me-5 mt-2 mb-4 table-responsive">
                <table class="table table-striped table-dark text-nowrap">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Fecha de estreno</th>
                            <th scope="col">Categorias</th>
                            <th scope="col">Duracion</th>
                            <th scope="col">Sinopsis</th>
                            <th scope="col">Director/es</th>
                            <th scope="col">Link Portada</th>
                            <th scope="col">Link Fondo</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Lenguaje original</th>
                            <th scope="col">Presupuesto</th>
                            <th scope="col">Ingresos</th>
                            <th scope="col">Link Trailer</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  Conexion conexion = new Conexion();
                            PeliculaService peliculaService = new PeliculaService(conexion);
                            List<Pelicula> peliculas = peliculaService.obtenerTodas();
                            for (Pelicula p : peliculas) {
                        %>
                        <tr>
                            <th scope="row"><%=p.getId()%></th>
                            <td><%=p.getTitulo()%></td>
                            <td><%=p.getFechaDeEstreno()%></td>
                            <td><%=p.getCategorias()%></td>
                            <td><%=p.getDuracion()%></td>
                            <td><%=p.getSinopsis()%></td>
                            <td><%=p.getDirector()%></td>
                            <td><%=p.getPortada()%></td>
                            <td><%=p.getFondo()%></td>
                            <td><%=p.getEstado()%></td>
                            <td><%=p.getLenguajeOriginal()%></td>
                            <td><%=p.getPresupuesto()%></td>
                            <td><%=p.getIngresos()%></td>
                            <td><%=p.getTrailer()%></td>
                            <td>
                                <div class="d-flex flex-row">
                                    <button type="button" class="btn btn-primary p-2 me-2" data-bs-toggle="modal" data-bs-target="#updateModal<%=p.getId()%>">
                                        <svg width="23px" height="23px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M21.2799 6.40005L11.7399 15.94C10.7899 16.89 7.96987 17.33 7.33987 16.7C6.70987 16.07 7.13987 13.25 8.08987 12.3L17.6399 2.75002C17.8754 2.49308 18.1605 2.28654 18.4781 2.14284C18.7956 1.99914 19.139 1.92124 19.4875 1.9139C19.8359 1.90657 20.1823 1.96991 20.5056 2.10012C20.8289 2.23033 21.1225 2.42473 21.3686 2.67153C21.6147 2.91833 21.8083 3.21243 21.9376 3.53609C22.0669 3.85976 22.1294 4.20626 22.1211 4.55471C22.1128 4.90316 22.0339 5.24635 21.8894 5.5635C21.7448 5.88065 21.5375 6.16524 21.2799 6.40005V6.40005Z" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M11 4H6C4.93913 4 3.92178 4.42142 3.17163 5.17157C2.42149 5.92172 2 6.93913 2 8V18C2 19.0609 2.42149 20.0783 3.17163 20.8284C3.92178 21.5786 4.93913 22 6 22H17C19.21 22 20 20.2 20 18V13" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                                    </button>
                                    <div class="modal fade" id="updateModal<%=p.getId()%>" tabindex="-1" aria-labelledby="updateModalLabel<%=p.getId()%>" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header border-0">
                                                    <h1 class="modal-title fs-5" id="updateModalLabel<%=p.getId()%>">Editar Pelicula</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body border-0">
                                                    <form action="SvUpdate" method="POST" id="update-form-<%=p.getId()%>" class="d-flex flex-column align-items-center">
                                                        <input name="id" type="hidden" value="<%=p.getId()%>">
                                                        <input type="text" name="titulo" id="titulo<%=p.getId()%>" class="form-control rounded" placeholder="Titulo" value="<%=p.getTitulo()%>" required>
                                                        <input type="date" name="fechaDeEstreno" id="fechaDeEstreno<%=p.getId()%>" class="form-control rounded" value="<%=p.getFechaDeEstreno()%>" required>
                                                        <input type="text" name="categorias" id="categorias<%=p.getId()%>" class="form-control rounded" placeholder="Categorias" value="<%=p.getCategorias()%>" required>
                                                        <input type="number" name="duracion" id="duracion<%=p.getId()%>" class="form-control rounded" placeholder="Duracion en minutos" value="<%=p.getDuracion()%>" required>
                                                        <input type="text" name="sinopsis" id="sinopsis<%=p.getId()%>" class="form-control rounded" placeholder="Sinopsis" value="<%=p.getSinopsis()%>" required>
                                                        <input type="text" name="director" id="director<%=p.getId()%>" class="form-control rounded" placeholder="Director" value="<%=p.getDirector()%>" required>
                                                        <input type="text" name="portada" id="portada<%=p.getId()%>" class="form-control rounded" placeholder="Link a la imagen de portada" value="<%=p.getPortada()%>" required>
                                                        <input type="text" name="fondo" id="fondo<%=p.getId()%>" class="form-control rounded" placeholder="Link a la imagen de fondo" value="<%=p.getFondo()%>" required>
                                                        <select name="estado" id="estado<%=p.getId()%>" class="form-select rounded" value="<%=p.getEstado()%>" required>
                                                            <option value="" disabled hidden>Estado</option>
                                                            <option value="released" selected>Released</option>
                                                            <option value="cancelled" >Cancelled</option>
                                                            <option value="announced" >Announced</option>
                                                            <option value="upcoming" >Upcoming</option>
                                                        </select>
                                                        <input type="text" name="lenguajeOriginal" id="lenguajeOriginal<%=p.getId()%>" class="form-control rounded" placeholder="Lenguaje original" value="<%=p.getLenguajeOriginal()%>" required>
                                                        <input type="number" name="presupuesto" id="presupuesto<%=p.getId()%>" class="form-control rounded" placeholder="Presupuesto" value="<%=p.getPresupuesto()%>">
                                                        <input type="number" name="ingresos" id="ingresos<%=p.getId()%>" class="form-control rounded" placeholder="Ingresos" value="<%=p.getIngresos()%>">
                                                        <input type="text" name="trailer" id="trailer<%=p.getId()%>" class="form-control rounded" placeholder="Link al trailer de la película" value="<%=p.getTrailer()%>" required>
                                                    </form>
                                                </div>
                                                <div class="modal-footer border-0">
                                                    <div class="container-fluid d-flex flex-column justify-content-center align align-items-center">
                                                        <button type="submit" class="text-white boton-prim btn rounded-3 w-100" id="confirmar" form="update-form-<%=p.getId()%>">Confirmar</button>
                                                        <button class="btn btn-link mt-2" data-bs-dismiss="modal" style="color: rgb(111, 116, 117) !important; text-decoration: none !important;">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="SvDelete" method="POST" id="delete-form-<%=p.getId()%>">
                                        <input name="id" type="hidden" value="<%=p.getId()%>">
                                    </form>
                                    <button type="submit" class="btn btn-danger p-2" form="delete-form-<%=p.getId()%>">
                                        <svg width="23px" height="23px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path fill="#ffffff" d="M160 256H96a32 32 0 0 1 0-64h256V95.936a32 32 0 0 1 32-32h256a32 32 0 0 1 32 32V192h256a32 32 0 1 1 0 64h-64v672a32 32 0 0 1-32 32H192a32 32 0 0 1-32-32V256zm448-64v-64H416v64h192zM224 896h576V256H224v640zm192-128a32 32 0 0 1-32-32V416a32 32 0 0 1 64 0v320a32 32 0 0 1-32 32zm192 0a32 32 0 0 1-32-32V416a32 32 0 0 1 64 0v320a32 32 0 0 1-32 32z"></path></g></svg>                    </button>
                                </div>
                            </td>
                        </tr>
                        <%  }%>
                    </tbody>
                </table>
            </div>
        </section>
        <footer>
            <div id="footer"
                 class="container-fluid d-flex justify-content-center align-items-center flex-column flex-md-row">
                <a href="html/clima.html" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Clima</a>
                <a href="#" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Términos y condiciones</a>
                <a href="#" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Preguntas frecuentas</a>
                <a href="#" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Ayuda</a>
                <a href="abm-peliculas.jsp" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1 rounded-2"
                   id="boton-abm-peli">Administrador Películas</a>
            </div>
        </footer>
        <a href="#" id="volver-arriba"><i class="fa-solid fa-arrow-up"></i></a>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
    </body>

</html>

