<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/indexnavbar.css">
    <link rel="stylesheet" href="css/indexfooter.css">
    <link rel="stylesheet" href="css/adminReuniones.css">
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
        <li class="nav-item">
        <a class="nav-link" href="index.html">
          <i class="fa fa-sign-out"></i>
          Cerrar Sesion
          <span class="sr-only">(current)</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="Perfil.jsp">
          <i class="fa fa-user"></i>
          Perfil
          <span class="sr-only">(current)</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="misReuniones.jsp">
          <i class="fa fa-users"></i>
          Mis Reuniones
          <span class="sr-only">(current)</span>
        </a>
      </li>
      </ul>
      
    </div>
  </nav>

<body>
<div class="container-fluid">
        <div class="row">
    <%
    String metodo, sql;
    String id_usuario = session.getAttribute("id_usuario").toString();
    //Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
    String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
    String bduser = "root";
    String bdpass = "";
    
    //HttpSession session = request.getSession(true);
    //Se obtiene el metodo de peticion
    metodo = request.getMethod();
    if(metodo.equalsIgnoreCase("GET")){
    try{
        sql = "SELECT * FROM reuniones";

        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection(bdconexion, bduser, bdpass);
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
          
            out.print("<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12'>");
              out.print("<div class='tile'>");
                    out.print("<div class='wrapper'>");
                            out.print("<div class='header'>ITSCH</div>");
                            out.print("<div class='banner-img'>");
                              out.print("<img src='https://images3.alphacoders.com/797/thumb-1920-797090.jpg' alt='Image 1'>");
                            out.print("</div>");
                            out.print("<div class='dates'>");
                                out.print("<div class='start'>");
                                  out.print("<strong>Fecha</strong>"+rs.getString("fecha")+ "<br>" + rs.getString("hora"));
                                out.print("</div>");
                            out.print("</div>");
                            out.print("<div class='stats'>");
                              out.print("<div>");
                                out.print("<strong>Titulo</strong>"+rs.getString("nombre_reunion"));
                              out.print("</div>");
                            out.print("<div>");
                                out.print("<strong>Ponente</strong>"+rs.getString("ponente"));
                            out.print("</div>");
                            out.print("<div>");
                                out.print("<strong>Edificio</strong>"+rs.getString("edificio"));
                            out.print("</div>");
                            out.print("</div>");
                                  out.print("<div class='footer'>");
                                    out.print("<a  onClick='inscribir("+rs.getString("id_reunion")+")' href='#' class='Cbtn Cbtn-primary'>Inscribirse</a>");
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
        </div>
    </div>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/index.js"></script>
    <script>
      function inscribir(id){
		  <% String id_us = session.getAttribute("id_usuario").toString(); %>
		var id_usuario = "<%=id_us %>";
        var id_reunion = id;
		console.log(id_usuario)
		console.log(id_reunion)
        $.post("inscribirReunion.jsp", {id_reunion:id_reunion, id_usuario}, function(data){            
                console.log("Pues como que si jala la inscripcion")
                alert("Inscrito!!!");
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
            <p>Horario de Atenci??n L - V de 9:00 - 17:00 | Linea de Atenci??n 447-107-3392</p>
            <p>atencionalcliente@LOGAsistant.com.mx</p>
            <p class="h6">?? LOGAsistant | Todos los Derechos Reservados<a class="text-green ml-2"
                href="https://www.cdhidalgo.tecnm.mx/" target="_blank"><u>ITSCH</u></a></p>
          </div>
        </div>
      </div>
    </section>
  </footer>
</html>