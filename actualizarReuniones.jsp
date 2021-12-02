<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%
String nombre_reunion, fecha, ponente, edificio, hora;
String id_reu ;
String metodo, sql;
//Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
String bduser = "root";
String bdpass = "";
//Se obtiene el metodo de peticion
metodo = request.getMethod();
if(metodo.equalsIgnoreCase("POST")){
    try{
        id_reu = request.getParameter("id_reunion");
        int id_reunion = Integer.parseInt(id_reu);
        nombre_reunion = request.getParameter("nombre_reunion");
        fecha = request.getParameter("fecha");
        ponente = request.getParameter("ponente");
        edificio = request.getParameter("edificio");
        hora = request.getParameter("hora");
        sql = "UPDATE reuniones SET nombre_reunion='"+ nombre_reunion + "', fecha='" + fecha + "', ponente='" + ponente + "', edificio='" + edificio + "', hora='" + hora + "' WHERE id_reunion=" + id_reunion + "";
        
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