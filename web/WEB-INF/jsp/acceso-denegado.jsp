<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>ERROR!!!!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    </head>
    <style>
            @font-face  {
     font-family: "mon";
     src: url("letras/mon.otf");
    }
        html, body {
        font-weight: 200;
        height: 100vh;
        margin: 0;
        background-image: url('https://image.freepik.com/vector-gratis/fondo-abstracto-gris-blanco-degradado_53876-60239.jpg');
        background-size: 100%;
    }
    div{
       font-family: "mon";
       font-size: 75px;
       text-align: center;
       background: -webkit-linear-gradient(red,yellow);
       -webkit-background-clip: text;
       -webkit-text-fill-color: transparent;
       color: tomato;
    }
    img{
        width: 75%;
        align: center;
        src:'http://hamlettenvironmental.com/sites/all/themes/hamlett/images/403.png';
    }
    b{
       font-family: fantasy;
       font-family: cursive;
       font-size: 25px;
       font-weight: bold;
       background: -webkit-linear-gradient(black,blue);
       -webkit-background-clip: text;
       -webkit-text-fill-color: transparent;
       padding-left:15px
    }
    
.myButton {
	box-shadow:inset 0px 1px 0px 0px #f5978e;
	background:linear-gradient(to bottom, #f24537 5%, #c62d1f 100%);
	background-color:#f24537;
	border-radius:8px;
	border:2px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Times New Roman;
	font-size:17px;
	font-weight:bold;
	font-style:italic;
	padding:10px 28px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
}
.myButton:hover {
	background:linear-gradient(to bottom, #c62d1f 5%, #f24537 100%);
	background-color:#c62d1f;
}
.myButton:active {
	position:relative;
	top:1px;
}

    </style>
    <body align="center">
    <center>
        <div>Acceso denegado</div>
        <br>
        <b>Estimado: ${usuario} <br>
                No tiene permisos para acceder a esta seccion. <br>
                Comuniquese con el administrador del sitio. <br></b>
        <br>
        <br>
        <img src='http://hamlettenvironmental.com/sites/all/themes/hamlett/images/403.png'>
         <br>
             <a href="javascript:history.back(-1);" 
                    accesskey=""title="Regresar a la pagina anterior" class="myButton">Volver</a>
    </center>
    </body>
</html>