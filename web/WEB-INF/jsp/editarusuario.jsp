<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head></head>

<body>
  <meta charset="utf-8" style="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css" style="">
  <div class="py-5 text-center" style="background-image: linear-gradient(to bottom, rgba(0, 0, 0, .110), rgba(0, 0, 0, .75)), url(https://www.pqs.pe/sites/default/files/styles/852x479/public/archivos/2015/actualidad/01/dcruzado/oficina-verde.jpg?itok=e0aSBmFs);background-position: right bottom;  background-size: cover; background-repeat: repeat; background-attachment: fixed;">
    <div class="container">
      <div class="row">
        <div class="bg-white p-4 col-10 mx-auto mx-md-0 col-lg-8">
          <h1>Usuario a editar</h1>
          <br>
          <form:form method="post" commandName="datos">
            <div class="form-group row">
              <form:label path="username" cssClass="col-sm-4 control-label text-right">Usuario</form:label>
              <div class="col-sm-8">
                <form:input path="username" cssClass="form-control" />
              </div>
            </div>
            <div class="form-group row">
              <form:label path="password" cssClass="col-4 col-form-label text-right">Clave</form:label>
              <div class="col-8">
                <form:password path="password" showPassword="true" cssClass="form-control" />
              </div>
            </div>
            <div class="form-group row">
              <form:label path="rolename" cssClass="col-4 col-form-label text-right">Tipo Usuario</form:label>
              <div class="col-sm-8">
                <form:select path="rolename" cssClass="form-group is-invalid">
                    <form:option value="ROLE_Administrador">Jefazo</form:option>
                    <form:option value="ROLE_Usuario">Empleado</form:option>
                </form:select>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Editar</button>
            
          </form:form>
            <a  href="<c:url value="listadousuario.htm" />" class="btn btn-secondary">Regresar</a>
        </div>
      </div>
      <div class="py-5 text-center"></div>
      <div class="py-5 text-center"></div>
    </div>
  </div>
</body>

</html>