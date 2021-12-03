<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%
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
        sql = "DELETE FROM reuniones_metido WHERE id_reunion=" + id_reunion + "";
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