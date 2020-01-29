<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css" style="">
  <div class="py-5 text-center" style="background-image: linear-gradient(to bottom, rgba(0, 0, 0, .110), rgba(0, 0, 0, .75)), url(https://lujan365.com.ar/download/multimedia.normal.b7b277f0f74795bc.43454c554c415245535f6e6f726d616c2e6a7067.jpg?itok=e0aSBmFs);background-position: right bottom;  background-size: cover; background-repeat: repeat; background-attachment: fixed;">
    <div class="container">
      <div class="row">
        <div class="bg-white p-4 col-10 mx-auto mx-md-0 col-lg-8">
          <h1>Agregar Producto</h1>
          <br>
            <form:form method="post" commandName="datos">
            <div class="form-group row">
              <form:label path="nombres" cssClass="col-sm-4 control-label text-right">Nombres</form:label>
              <div class="col-sm-8">
                <form:input path="nombres" cssClass="form-control" />
                <form:errors path="nombres" />
              </div>
            </div>
            <div class="form-group row">
              <form:label path="direccion" cssClass="col-4 col-form-label text-right">Direccion</form:label>
              <div class="col-8">
                <form:input path="direccion" cssClass="form-control" />
                <form:errors path="direccion" />
                </div>
            </div>
            <div class="form-group row">
              <form:label path="telefono" cssClass="col-4 col-form-label text-right">Telefono</form:label>
              <div class="col-8">
                <form:input path="telefono" cssClass="form-control" />
                <form:errors path="telefono" />
              </div>
            </div>
            <div class="form-group row">
               <form:label path="correo" cssClass="col-4 col-form-label text-right">Correo</form:label>
              <div class="col-8">
                <form:input path="correo" cssClass="form-control" />
                <form:errors path="correo" />
              </div>
            </div>
            <div class="form-group row">
               <form:label path="ubicacion" cssClass="col-4 col-form-label text-right">Ubicacion</form:label>
              <div class="col-8">
                <form:input path="ubicacion" cssClass="form-control" />
                <form:errors path="ubicacion" />
              </div>
            </div>
            <input type="submit" value="Guardar" class="btn btn-danger" />
            
          </form:form>
            <a  href="<c:url value="listado.htm" />" class="btn btn-secondary">Regresar</a>
        </div>
      </div>
      <div class="py-5 text-center"></div>
      <div class="py-5 text-center"></div>
    </div>
  </div>
</body>

</html>