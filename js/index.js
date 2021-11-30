$(document).ready(function(){
    $("#entrar").click(function(){
        var user = $("#user").val();
        var pass = $("#pass").val();
        $.getJSON("login.jsp", {user:user, pass:pass}, function(data){
            if(data.result == "ok"){
                window.location.href = "eventos.html";
            }else{
                alert("Usuario o contraseña incorrectos");
            }
        });
    });
    $("#pagregistro").click(function(){
        window.location.href = "registro.html";
    });
    $("#registrarse").click(function(){
        var id_usuario = "0";
        var nombre_usuario = $("#nombre_usuario").val();
        var apellido_p = $("#apellido_p").val();
        var apellido_m = $("#apellido_m").val();
        var numero_telefono = $("#numero_telefono").val();
        var correo = $("#correo").val();
        var password = $("#password").val();
        var tipo = "U";
        console.log("Aqui llego")
        if(nombre_usuario.length!=0 && apellido_p.length!=0 && apellido_m.length!=0 && numero_telefono!=0 
            && correo!=0 && password!=0){
                $.post("registro.jsp", {id_usuario:id_usuario, nombre_usuario:nombre_usuario, apellido_p:apellido_p, apellido_m:apellido_m, numero_telefono:numero_telefono, correo:correo, password:password, tipo:tipo}, function(data){            
                console.log("Pues como que si jala")
                alert("Usuario Registrado. Bienvenido!!!");
                window.location.href = "index.html";
                });
        }else{
            alert("Datos Incorrectos, verifique sus datos por favor.")
        }
    });
    $("#crearReunion").click(function(){ 
        var id_reunion = "0";
        var nombre_reunion = $("#nombre_reunion").val();
        var fecha = $("#fecha").val();
        var ponente = $("#ponente").val();
        var edificio = $("#edificio").val();
        var hora = $("#hora").val();
        console.log("Aqui llego")
        if(nombre_reunion.length!=0 && fecha.length!=0 && ponente.length!=0 
            && edificio.length!=0 && hora.length!=0){
                $.post("crearReuniones.jsp", {id_reunion:id_reunion, nombre_reunion:nombre_reunion, fecha:fecha, ponente:ponente, edificio:edificio, hora:hora}, function(data){            
                console.log("Pues como que si jala")
                alert("Reunion Creada!!!");
                
                });
        }else{
            alert("Datos Incorrectos, verifique sus datos por favor.")
        }
    });
});