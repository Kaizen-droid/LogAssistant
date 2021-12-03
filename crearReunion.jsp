
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/indexnavbar.css">
  <link rel="stylesheet" href="css/registrofooter.css">
  <link rel="stylesheet" href="css/indexregistro.css">
  <title>Menu</title>

  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>

<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><i class="fa fa-2x fa-address-card-o"></i></a>
  <h3 class="text-white">LogAssistant</h3>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="menu.jsp">
          <i class="fa fa-bars"></i>
          Menu
          <span class="sr-only">(current)</span>
        </a>
      </li>
      <%
      String tipo = session.getAttribute("tipo").toString();
      String id_usuario = session.getAttribute("id_usuario").toString();
      if(tipo=="A"){ %>
      <li class="nav-item">
        <a class="nav-link" href="eventos.html">
          <i class="fa fa-clock-o">
          </i>
          Eventos
        </a>
      </li>
      <% } %>
    </ul>
  </div>
</nav>


<body>
  <div class="login-wrap">
    <div class="login-html">
      <input id="tab-2" type="radio" name="tab" class="for-pwd" checked><label for="tab-2" class="tab">Crear Reunion</label>
      <div class="login-form">
        <div class="for-pwd-htm">
          <div class="group">
            <label for="user" class="label">Titulo:</label>
            <input id="nombre_reunion" type="text" class="input">
          </div>
          <div class="group">
            <label for="pass" class="label">Fecha:</label>
            <input id="fecha" type="text" class="input" >
          </div>
          <div class="group">
            <label for="pass" class="label">Ponente:</label>
            <input id="ponente" type="text" class="input" >
          </div>
          <div class="group">
            <label for="pass" class="label">Edificio:</label>
            <input id="edificio" type="text" class="input" >
          </div>
          <div class="group">
            <label for="pass" class="label">Hora:</label>
            <input id="hora" type="text" class="input" >
          </div>
          <div class="group">
            <input type="submit" class="button" value="Crear" id="crearReunion">
          </div>
          <div class="hr"></div>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery-3.6.0.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/index.js"></script>
</body>

<footer id="footer">
  <section class=" bg-dark">
    <div class="container">
      <div class="row">
        <div>
          <ul class="list-unstyled list-inline social text-center">
            <li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i
                  class="fa fa-facebook"></i></a></li>
            <li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-twitter"></i></a>
            </li>
            <li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i
                  class="fa fa-instagram"></i></a></li>
            <li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i
                  class="fa fa-google-plus"></i></a></li>
            <li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02" target="_blank"><i
                  class="fa fa-envelope"></i></a></li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
          <p>Horario de Atenci&oacute;n L - V de 9:00 - 17:00 | Linea 447-107-3392</p>
          <p>atencionalcliente@LOGAsistant.com.mx</p>
          <p class="h6">© LOGAsistant | Todos los Derechos Reservados<a class="text-green ml-2"
              href="https://www.cdhidalgo.tecnm.mx/" target="_blank"><u>ITSCH</u></a></p>
        </div>
      </div>
    </div>
  </section>
</footer>

</html>