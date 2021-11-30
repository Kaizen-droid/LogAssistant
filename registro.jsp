<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%
String nombre_usuario, apellido_p, apellido_m, numero_telefono, correo, password, tipo;
int id_usuario=0;
String metodo, sql;
//Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
String bduser = "root";
String bdpass = "";
//Se obtiene el metodo de peticion
metodo = request.getMethod();
if(metodo.equalsIgnoreCase("POST")){
    try{
        nombre_usuario = request.getParameter("nombre_usuario");
        apellido_p = request.getParameter("apellido_p");
        apellido_m = request.getParameter("apellido_m");
        numero_telefono	 = request.getParameter("numero_telefono");
        correo = request.getParameter("correo");
        password = request.getParameter("password"); 
        tipo = request.getParameter("tipo") ;
        sql = "INSERT INTO usuarios VALUES('"+ id_usuario  + "', '" + nombre_usuario + "', '" + apellido_p + "', '" + apellido_m + "', '" + numero_telefono + "', '" + correo + "', '" + password + "', '" + tipo + "')";
        
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