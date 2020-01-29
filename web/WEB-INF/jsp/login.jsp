<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
</head>

<body>
  <div class="py-5 text-center" style="	background-image: url(&quot;http://onidj.com/wp-content/uploads/grey-smoke-wallpaper-desktop-2560x1440.jpg&quot;);	background-size: cover;	background-position: top left;	background-repeat: repeat;">
    <div class="container">
      <div class="row">
        <div class="mx-auto col-md-6 col-10 bg-white p-5">
          <h1 class="mb-4">LOG IN</h1>
          <form class="form-group" action="<c:url value='j_spring_security_check'/>" method="POST">
                <div class="form-group">
                    <label for="exampleDropdownFormEmail2">Usuario</label>
                    <input type="text" class="form-control" id="exampleDropdownFormEmail2" 
                           name="usuario" placeholder="usuario">
                </div>
                <div class="form-group">
                    <label for="exampleDropdownFormPassword2">Clave</label>
                    <input type="password" class="form-control" id="exampleDropdownFormPassword2" 
                           name="clave" placeholder="clave">
                </div>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                <button type="submit" class="btn btn-primary">Ingresar</button>
            </form>
        </div>
      </div>
    </div>
  </div>
  <div class="text-white bg-dark" id="where" style="	background-image: url(&quot;&quot;);	background-position: top left;	background-size: 100%;	background-repeat: repeat;" >
    <div class="container">
      <div class="row">
        <div class="p-5 col-md-6">
          <h3><b>Smoke</b></h3>
          <p class="">Arequipa - Perú<br></p>
          <p class="">smoke_team@tecsup.edu.pe</p>
          <p class="mb-3">
            <a href="#">+</a>51 963023181</p>
          <a href="#" target="_blank"><i class="fa d-inline fa-lg mr-3 text-white fa-linkedin"></i></a>
          <a href="#" target="_blank"><i class="fa fa-facebook d-inline fa-lg mr-3 text-white"></i></a>
        </div>
        <div class="p-2 col-md-4"><img class="img-fluid d-block" src="https://seeklogo.net/wp-content/uploads/2013/05/smoke-vector-logo.png"></div>
      </div>
      <div class="row">
        <div class="col-md-12 mt-3">
          <p class="text-center text-muted">© Copyright 2018 Pingendo - All rights reserved. </p>
        </div>
      </div>
    </div>
      
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <!-- Script: Smooth scrolling between anchors in the same page -->
  <script src="js/smooth-scroll.js" style=""></script>
  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>