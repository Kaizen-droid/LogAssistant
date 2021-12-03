<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%
String nombre_usuario, apellido_p, apellido_m, numero_telefono, correo, password, tipo;
String id_usu;
String metodo, sql;
//Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
String bduser = "root";
String bdpass = "";
//Se obtiene el metodo de peticion
metodo = request.getMethod();
if(metodo.equalsIgnoreCase("POST")){
    try{
        id_usu = request.getParameter("id_usuario");
        int id_usuario = Integer.parseInt(id_usu);
        nombre_usuario = request.getParameter("nombre_usuario");
        apellido_p = request.getParameter("apellido_p");
        apellido_m = request.getParameter("apellido_m");
        numero_telefono	 = request.getParameter("numero_telefono");
        correo = request.getParameter("correo");
        password = request.getParameter("password");
        sql = "UPDATE usuarios SET nombre_usuario='" + nombre_usuario + "', apellido_p='" + apellido_p + "', apellido_m='" + apellido_m + "', numero_telefono='" + numero_telefono + "', correo='" + correo + "', password='" + password + "' WHERE id_usuario=" + id_usuario + "";
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