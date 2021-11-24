<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%
String user, pass;
String metodo, sql;
//Datos de conexion a la BD jspProyecto (127.0.0.1 es similar a locahost)
String bdconexion = "jdbc:mysql://127.0.0.1/proyecto?user='root'&password=";
String bduser = "root";
String bdpass = "";
//Se obtiene el metodo de peticion
metodo = request.getMethod();
if(metodo.equalsIgnoreCase("GET")){
    try{
        user = request.getParameter("user");
        pass = request.getParameter("pass");
        sql = "SELECT * FROM usuarios WHERE nombre_usuario='"+user+"' AND password='"+pass+"'";

        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection(bdconexion, bduser, bdpass);
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if(rs.next()){
            out.println("{\"result\": \"ok\"}");
        }else{
            out.println("{\"result\": \"no\"}");
        }
        rs.close();
        st.close();
        conexion.close();
    }catch(SQLException e){

    }
}
%>