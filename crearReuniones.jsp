<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%
String nombre_reunion, fecha, ponente, edificio, hora;
String id_usuario = session.getAttribute("id_usuario").toString();
int id_reunion = 0;
String metodo, sql;
//Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
String bduser = "root";
String bdpass = "";
//Se obtiene el metodo de peticion
metodo = request.getMethod();
if(metodo.equalsIgnoreCase("POST")){
    try{
        nombre_reunion = request.getParameter("nombre_reunion");
        fecha = request.getParameter("fecha");
        ponente = request.getParameter("ponente");
        edificio = request.getParameter("edificio");
        hora = request.getParameter("hora");
        sql = "INSERT INTO reuniones VALUES('"+ id_reunion  + "', '" + nombre_reunion + "', '" + fecha + "', '" + ponente + "', '" + edificio + "', '" + hora + "', '" + id_usuario + "')";
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(bdconexion,bduser,bdpass);
        Statement st = con.createStatement();
        int rs = st.executeUpdate(sql);
        st.close();
        con.close();
    }catch(SQLException e){
            out.print(e);
    }    
}
%>