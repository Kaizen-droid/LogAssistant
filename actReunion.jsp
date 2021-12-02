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
        <li class="nav-item active">
          <a class="nav-link" href="#">
            <i class="fa fa-home"></i>
            Principal
            <span class="sr-only">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="eventos.html">
            <i class="fa fa-clock-o">
            </i>
            Eventos
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="acercade.html">
            <i class="fa fa-question">
            </i>
            Acerca de...
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ">
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fa fa-hand-o-right">
            </i>
          </a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="text" placeholder="¿Buscas algo?" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
      </form>
    </div>
  </nav>

  <body>
    <%
    String metodo, sql;
    //Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
    String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
    String id_reunion;
    String bduser = "root";
    String bdpass = "";
    //HttpSession session = request.getSession(true);
    //Se obtiene el metodo de peticion
    metodo = request.getMethod();
    if(metodo.equalsIgnoreCase("GET")){
    try{      
        id_reunion = request.getParameter("id_reunion");
        sql = "SELECT * FROM reuniones WHERE id_reunion='"+id_reunion+"'";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection(bdconexion, bduser, bdpass);
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
            out.print("<div class='login-wrap'>");
            out.print("<div class='login-html'>");
            out.print("<input id='tab-2' type='radio' name='tab' class='for-pwd' checked><label for='tab-2' class='tab'>Actualizar Reunion</label>");
            out.print("<div class='login-form'>");
            out.print("<div class='for-pwd-htm'>");
            out.print("<div class='group'>");
            out.print("<label for='user' class='label'>Titulo:</label>");
            out.print("<input id='nombre_reunion' type='text' class='input' placeholder=" +rs.getString("nombre_reunion") + ">");
            out.print("<input id='id_reunion' type='hidden' type='text' class='input' placeholder=" + id_reunion + ">");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Fecha:</label>");
            out.print("<input id='fecha' type='text' class='input' placeholder=" +rs.getString("fecha") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Ponente:</label>");
            out.print("<input id='ponente' type='text' class='input' placeholder=" +rs.getString("ponente") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Edificio:</label>");
            out.print("<input id='edificio' type='text' class='input' placeholder=" +rs.getString("edificio") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<label for='pass' class='label'>Hora:</label>");
            out.print("<input id='hora' type='text' class='input' placeholder=" +rs.getString("hora") + ">");
            out.print("</div>");
            out.print("<div class='group'>");
            out.print("<br>");
            out.print("<input type='submit' class='button' value='Actualizar' onClick='actuReunion("+ id_reunion +")'>");
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
  <br>
  <br>  
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
    <script> 
    function actuReunion(id) {
      var nombre_reunion = $("#nombre_reunion").val();
        var fecha = $("#fecha").val();
        var ponente = $("#ponente").val();
        var edificio = $("#edificio").val();
        var hora = $("#hora").val();
        var id_reunion = id;
        console.log(id_reunion)
        console.log(hora)
        if(nombre_reunion.length!=0 && fecha.length!=0 && ponente.length!=0 && edificio!=0 
            && hora!=0 ){
                $.post("actualizarReuniones.jsp", {id_reunion:id_reunion ,nombre_reunion:nombre_reunion, fecha:fecha, ponente:ponente, edificio:edificio, hora:hora}, function(data){            
                console.log("Pues como que si jala la actualizacion")
                alert("Reunion Actualizada!!!");
                window.location.href = "adminReuniones.jsp";
                });
        }else{
            alert("Datos Incorrectos, verifique sus datos por favor.")
        }
        //window.location.href = "actReunion.jsp?id_reunion="+id_reunion;
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