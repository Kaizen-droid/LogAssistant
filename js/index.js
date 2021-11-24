$(document).ready(function(){
    $("#entrar").click(function(){
        var user = $("#user").val();
        var pass = $("#pass").val();
        $.getJSON("login.jsp", {user:user, pass:pass}, function(data){
            if(data.result == "ok"){
                window.location.href = "menu.jsp";
            }else{
                alert("Usuario o contraseña incorrectos");
            }
        });
    });
});