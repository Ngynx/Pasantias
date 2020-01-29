<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
</head>

<body class="">
  <div class="py-5 text-center" style="background-image: linear-gradient(to bottom, rgba(0, 0, 0, .110), rgba(0, 0, 0, .75)), url(https://www.pqs.pe/sites/default/files/styles/852x479/public/archivos/2015/actualidad/01/dcruzado/oficina-verde.jpg?itok=e0aSBmFs);background-position: right bottom;  background-size: cover; background-repeat: repeat; background-attachment: fixed;">
    <div class="container">
      <div class="row">
        <div class="bg-white p-4 col-10 mx-auto mx-md-0 col-lg-12 text-center">
          <h1>Lista de usuarios</h1>
          <p class="mb-4">En esta vista podra realizar el control y mantenimiento de los usuarios existentes en la base de datos.</p><a class="btn btn-primary" href="<c:url value="agregarusuario.htm"/> ">Nuevo Registro</a>
          <p>
          </p>
          <div class="table-responsive ">
            <table class="table table-bordered text-center ">
              <thead class="thead-dark">
                <tr>
                  <th>Codigo</th>
                  <th>Usuario</th>
                  <th>Contraseña</th>
                  <th>Roles</th>
                  <th>Acciones</th>
                </tr>

              </thead>
              <tbody>
                <c:forEach items="${datos}" var="dato">
                <tr>
                    <td><c:out value="${dato.codigo}" /></td>
                    <td><c:out value="${dato.username}" /></td>
                    <td><c:out value="${dato.password}" /></td>
                    <td><c:out value="${dato.rolename}" /></td>
                  <td class="text-center">
                    <a class="btn btn-outline-secondary" href="<c:url value="editarusuario.htm?id=${dato.codigo}" />" >Editar</a><a class="btn btn-outline-info ml-4" href="<c:url value="eliminarusuario.htm?id=${dato.codigo}" />" >Eliminar</a>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="py-3 text-center"></div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="row pi-draggable">
          <div class="col-md-4"></div>
          <div class="col-md-4">
            <div class="row">
              <div class="col-md-12">
                <div class="card text-center">
                  <div class="card-header"> Regresar al listado de productos</div>
                  <div class="card-body">
                    <a href="<c:url value="listado.htm" />" class="btn btn-primary">Regresar</a>
                  </div>
                  <div class="card-footer text-muted"> </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="py-5 text-center"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous" style=""></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous" style=""></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous" style=""></script>
  </div>
</body>

</html>