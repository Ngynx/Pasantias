<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,600,700');
@import url('https://fonts.googleapis.com/css?family=Catamaran:400,800');
.error-container {
  text-align: center;
  font-size: 180px;
  font-family: 'Catamaran', sans-serif;
  font-weight: 800;
  margin: 20px 15px;
}
.error-container > span {
  display: inline-block;
  line-height: 0.7;
  position: relative;
  color: #FFB485;
}
.error-container > span > span {
  display: inline-block;
  position: relative;
}
.error-container > span:nth-of-type(1) {
  perspective: 1000px;
  perspective-origin: 500% 50%;
  color: #F0E395;
}
.error-container > span:nth-of-type(1) > span {
  transform-origin: 50% 100% 0px;
  transform: rotateX(0);
  animation: easyoutelastic 8s infinite;
}

.error-container > span:nth-of-type(3) {
  perspective: none;
  perspective-origin: 50% 50%;
  color: #D15C95;
}
.error-container > span:nth-of-type(3) > span {
  transform-origin: 100% 100% 0px;
  transform: rotate(0deg);
  animation: rotatedrop 8s infinite;
}
@keyframes easyoutelastic {
  0% {
    transform: rotateX(0);
  }
  9% {
    transform: rotateX(210deg);
  }
  13% {
    transform: rotateX(150deg);
  }
  16% {
    transform: rotateX(200deg);
  }
  18% {
    transform: rotateX(170deg);
  }
  20% {
    transform: rotateX(180deg);
  }
  60% {
    transform: rotateX(180deg);
  }
  80% {
    transform: rotateX(0);
  }
  100% {
    transform: rotateX(0);
  }
}

@keyframes rotatedrop {
  0% {
    transform: rotate(0);
  }
  10% {
    transform: rotate(30deg);
  }
  15% {
    transform: rotate(90deg);
  }
  70% {
    transform: rotate(90deg);
  }
  80% {
    transform: rotate(0);
  }
  100% {
    transform: rotateX(0);
  }
}

* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
body {
  background-color: #f4f4f4;
  margin-bottom: 50px;
}
html, button, input, select, textarea {
    font-family: 'Montserrat', Helvetica, sans-serif;
    color: #bbb;
}
h1 {
  text-align: center;
  margin: 30px 15px;
}
.zoom-area { 
  max-width: 490px;
  margin: 30px auto 30px;
  font-size: 19px;
  text-align: center;
}
.link-container {
  text-align: center;
}
a.more-link {
  text-transform: uppercase;
  font-size: 13px;
    background-color: #bbb;
    padding: 10px 15px;
    border-radius: 0;
    color: #fff;
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 5px;
    line-height: 1.5;
    text-decoration: none;
  margin-top: 50px;
  letter-spacing: 1px;
}
        </style>
    </head>
    <body>
        <ol class="breadcrumb">
                <li><a href="<c:url value="listado.htm" />">Volver a Listado de Produtos</a></li>
            </ol>
        <c:choose>
            <c:when test = "${empty datos}">
                <h1> Error De Busqueda </h1>
                <p class="zoom-area"><b>No</b> existen resultados para esta búsqueda</p>
                <section class="error-container">
                  <span><span>M</span></span>
                  <span>I</span>
                  <span>S</span>
                  <span><span>S</span></span>
                </section>
            </c:when>
            <c:otherwise>
                <div class="table-responsive ">
                    <table class="table table-bordered text-center ">
                      <thead class="thead-dark">
                        <tr>
                          <th>Nombres</th>
                          <th>Direccion</th>
                          <th>Telefono</th>
                          <th>Correo</th>
                          <th>Ubicacion</th>
                          <th>Acciones</th>
                        </tr>
                      </thead>
                      <tbody>

                              <c:forEach items="${datos}" var="dato">
                                    <tr>
                                        <td><c:out value="${dato.nombres}" /></td>
                                        <td><c:out value="${dato.direccion}" /></td>
                                        <td><c:out value="${dato.telefono}" /></td>
                                        <td><c:out value="${dato.correo}" /></td>
                                        <td><c:out value="${dato.ubicacion}" /></td>
                                        <td>
                                            <a href="<c:url value="editar.htm?id=${dato.codigo}" />"
                                               class="btn btn-primary">Editar</a>
                                            <a href="<c:url value="eliminar.htm?id=${dato.codigo}" />"
                                               class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                      </tbody>
                    </table>
                  </div>
            </c:otherwise>
        </c:choose> 
    </body>
</html>