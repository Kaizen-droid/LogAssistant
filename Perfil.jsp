<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/indexnavbar.css">
    <link rel="stylesheet" href="css/indexfooter.css">
    <link rel="stylesheet" href="css/indexregistro.css">
    <title>Acerca de</title>

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
      <%
      String tipo = session.getAttribute("tipo").toString();
      String id_usuario = session.getAttribute("id_usuario").toString();
      if(tipo=="A"){ %>
      <li class="nav-item">
        <a class="nav-link" href="menu.jsp">
          <i class="fa fa-bars"></i>
          Menu
          <span class="sr-only">(current)</span>
        </a>
        </li>
      <% }else{ %>
            <li class="nav-item">
          <a class="nav-link" href="eventos.jsp">
            <i class="fa fa-bars"></i>
              Eventos
            <span class="sr-only">(current)</span>
          </a>
        </li>   
      <% } %>
    </div>
  </nav>

  <body>
    <%
    String metodo, sql;
    //Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
    String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
    id_usuario = session.getAttribute("id_usuario").toString();
    String bduser = "root";
    String bdpass = "";
    //HttpSession session = request.getSession(true);
    //Se obtiene el metodo de peticion
    metodo = request.getMethod();
    if(metodo.equalsIgnoreCase("GET")){
    try{      
        sql = "SELECT * FROM usuarios WHERE id_usuario='"+id_usuario+"'";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection(bdconexion, bduser, bdpass);
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
            out.print("<div class='login-wrap'>");
            out.print("<div class='login-html'>");
            out.print("<input id='tab-2' type='radio' name='tab' class='for-pwd' checked><label for='tab-2' class='tab'>Editar Perfil</label>");
            out.print("<div class='login-form'>");
            out.print("<div class='for-pwd-htm'>");
            out.print("<div class='group'>");
            out.print("<label for='user' class='label'>Nombre:</label>");
            out.print("<input id='nombre_usuario' type='text' class='input' placeholder=" +rs.getString("nombre_usuario") + ">");
            out.print("<input id='id_usuario' type='hidden' type='text' class='input' placeholder=" + id_usuario + ">");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Apellido Paterno:</label>");
            out.print("<input id='apellido_p' type='text' class='input' placeholder=" +rs.getString("apellido_p") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Apellido Materno:</label>");
            out.print("<input id='apellido_m' type='text' class='input' placeholder=" +rs.getString("apellido_m") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Telefono:</label>");
            out.print("<input id='numero_telefono' type='text' class='input' placeholder=" +rs.getString("numero_telefono") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Correo:</label>");
            out.print("<input id='correo' type='text' class='input' placeholder=" +rs.getString("correo") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Password:</label>");
            out.print("<input id='password' type='text' class='input' placeholder=" +rs.getString("password") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<br>");
            out.print("<input type='submit' class='button' value='Actualizar' onClick='actuUsuario("+ id_usuario +")'>");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<input type='submit' class='button' value='Eliminar' onClick='eliminarReunion("+ id_usuario +")'>");
            out.print("</div>");
            out.print("<div class='hr'></div>");
            out.print("</div>");
            out.print("</div>");
            out.print("</div>");
            out.print("</div>");
            out.print("</div>");
        }
        rs.close();
        st.close();
        conexion.close();
    }catch(SQLException e){

    }
    }
  %> 
  <br>
  <br>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
    <script> 
    function actuUsuario(id) {
      var id_usuario = id;
        var nombre_usuario = $("#nombre_usuario").val();
        var apellido_p = $("#apellido_p").val();
        var apellido_m = $("#apellido_m").val();
        var numero_telefono = $("#numero_telefono").val();
        var correo = $("#correo").val();
        var password = $("#password").val();
        if(nombre_usuario.length!=0 && apellido_p.length!=0 && apellido_m.length!=0 && numero_telefono.length!=0 
            && correo.length!=0 && password.length){
                $.post("actualizarUsuario.jsp", {id_usuario:id_usuario, nombre_usuario:nombre_usuario, apellido_p:apellido_p, apellido_m:apellido_m, numero_telefono:numero_telefono, correo:correo, password:password}, function(data){            
                console.log("Pues como que si jala la actualizacion")
                alert("Usuario Actualizada!!!");
                window.location.href = "index.html";
                });
        }else{
            alert("Datos Incorrectos, verifique sus datos por favor.")
        }
        //window.location.href = "actReunion.jsp?id_reunion="+id_reunion;
      }
    function eliminarReunion(id) {
      var id_usuario = id;
                $.post("eliminarUsuario.jsp", {id_usuario:id_usuario}, function(data){            
                console.log("Pues como que si jala la eliminacion")
                alert("Usuario Eliminado!!!");
                window.location.href = "index.html";
                });
      }
    </script>
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
            <p>Horario de Atención L - V de 9:00 - 17:00 | Linea de Atención 447-107-3392</p>
            <p>atencionalcliente@LOGAsistant.com.mx</p>
            <p class="h6">© LOGAsistant | Todos los Derechos Reservados<a class="text-green ml-2"
                href="https://www.cdhidalgo.tecnm.mx/" target="_blank"><u>ITSCH</u></a></p>
          </div>
        </div>
      </div>
    </section>
  </footer>
</html>