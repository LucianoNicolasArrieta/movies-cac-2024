<%@ page import="com.lna.peliculas.cac.db.Conexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.lna.peliculas.cac.services.PeliculaService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lna.peliculas.cac.model.Pelicula" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/styles.css">
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
                    <a class="navbar-brand text-white" href="index.jsp">CAC-Movies</a>
                </div>
                <div>
                    <a class="nav-item nav-link d-inline px-md-4 py-md-2 mx-2" href="#tendencias">Tendencias</a>
                    <a class="nav-item nav-link d-inline px-md-4 py-md-2 mx-2" href="html/registro.html">Registrarse</a>
                    <a class="nav-item nav-link d-inline px-md-4 py-md-2 mx-2" href="html/login.html" id="login-btn">Iniciar
                        Sesión</a>
                </div>
            </div>
        </nav>
    </header>
    <main class="main" class="aos-init" data-aos="zoom-in" data-aos-duration="1000">
        <section id="banner" class="d-flex align-items-center justify-content-center">
            <div class="text-center p-5">
                <h1 class="fw-bold">Películas y series ilimitadas <br> en un solo lugar</h1>
                <h2 class="m-3 fw-lighter">Disfruta donde quieras. <br> Cancela en cualquier momento.</h2>
                <a href="html/registro.html" class="boton-prim btn fw-semibold" id="registrate-btn">Registrate</a>
            </div>
        </section>
    </main>
    <section id="buscar" class="aos-init" data-aos="fade-up" data-aos-duration="500">
        <div class="container">
            <div class="row justify-content-center align-items-center flex-column">
                <h2 class="text-center">¿Qué estás buscando para ver?</h2>
                <form action="" method="get" class="d-flex mt-5 align-items-center justify-content-center"
                    id="buscar-form">
                    <input type="text" name="" id="" class="form-control me-2 rounded-5 shadow-none border-0"
                        placeholder="Buscar...">
                    <button type="submit" class="boton-prim btn rounded-5" id="boton-buscar">Buscar</button>
                </form>
            </div>
        </div>
    </section>
    <div class="d-flex justify-content-center ">
        <hr class="w-75">
    </div>
    <section id="tendencias" class="mt-4 mb-5" class="aos-init" data-aos="fade-up" data-aos-duration="500">
        <div class="container-fluid text-center">
            <h2>Las tendencias de hoy</h2>
            <div class="container-fluid mt-5 w-75">
                <div class="row-cols-md-auto">
                    <%  Conexion conexion = new Conexion();
                        PeliculaService peliculaService = new PeliculaService(conexion);
                        List<Pelicula> peliculasNoAclamadas = peliculaService.obtenerNoAclamadas();
                        for (Pelicula p : peliculasNoAclamadas) {
                    %>
                    <a href="html/pelicula.jsp?id=<%=p.getId()%>" class="card-peli rounded-4">
                        <img src="<%=p.getPortada()%>" alt="<%=p.getTitulo()%>" class="rounded-4 img-fluid">
                        <span class="titulo-peli fs-4"><%=p.getTitulo()%></span>
                    </a>
                    <%  }%>
                </div>
            </div>
            <div class="mb-5">
                <a href="#" class="boton-prim btn me-2 border-white border-1">Anterior</a>
                <a href="#" class="boton-prim btn ms-2 border-white border-1">Siguiente</a>
            </div>
        </div>
    </section>
    <div class="d-flex justify-content-center ">
        <hr class="w-75">
    </div>
    <section class="mt-4 mb-5" class="aos-init" data-aos="fade-up" data-aos-duration="500">
        <div class="container text-center w-75">
            <h2>Las más aclamadas</h2>
            <div id="aclamadas" class="d-flex overflow-x-auto mt-4">
                <%  Conexion conexion2 = new Conexion();
                    PeliculaService peliculaService2 = new PeliculaService(conexion2);
                    List<Pelicula> peliculasAclamadas = peliculaService2.obtenerAclamadas();
                    for (Pelicula p : peliculasAclamadas) {
                %>
                <a href="#" class=""><img src="<%=p.getPortada()%>" alt="<%=p.getTitulo()%>"
                                          class="img-peli-aclamada rounded-4"></a>
                <%  }%>
            </div>
        </div>
    </section>
    <footer>
        <div id="footer"
            class="container-fluid d-flex justify-content-center align-items-center flex-column flex-md-row">
            <a href="html/clima.html" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Clima</a>
            <a href="#" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Términos y condiciones</a>
            <a href="#" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Preguntas frecuentas</a>
            <a href="#" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1">Ayuda</a>
            <a href="html/abm-peliculas.jsp" class="fs-6 text-decoration-none text-white fw-semibold mx-3 my-1 rounded-2"
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
    <script>
        AOS.init();
    </script>
</body>

</html>
