$(document).ready(inicio);
function inicio(){
	
	$("span.help-block").hide();
    $("#contenido").hide();
	 
	$("#btnGuardar").click(function(){
		if(validar()==false)
			alert("Error! Verifique información ingresada");
		
	});

	$("#nombre").keyup(validar);
	$("#edad").keyup(validar);
	$("#apellido").keyup(validar);
	$("#email").keyup(validar);
	$("#password").keyup(validar);
	$("#direccion").keyup(validar);
    $("#telefono").keyup(validar);
  
}
function mostrar(link) {
     var iframe=document.getElementById("frame");
     iframe.src=link;
    
     $("#contenido").show(); 
     $("#menu2").hide();
 }

 
function validar(){
var nombre = $("#nombre").val();
var edad = $("#edad").val();
var direccion = $("#direccion").val();
var apellidos=$("#apellido").val();
var telefono=$("#telefono").val();
var correo=$("#email").val();
var pass=$("#password").val();
var email = document.getElementById('email');
var num=document.getElementById('edad');
var tel=document.getElementById('telefono');
var regex_tel=/^([0-9]{4})+(-){0,1}([0-9]{4})$/;
var regex_numeros = /^[0-9]+$/;
var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	var correcto=true;
	if ($.trim(nombre) == "" || $.trim(nombre).length<5) {
			   	$("#iconotexto").remove();
		$("#nombre").parent().parent().attr("class","form-group has-error has-feedback");
		$("#nombre").parent().children("span").text("Ingrese su nombre").show();
		$("#nombre").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        correcto=false;
	}
	else{
		$("#nombre").parent().parent().attr("class","input-group has-success has-feedback");
		$("#nombre").parent().children("span").text("").hide();
		correcto=true;
	}

	if($.trim(apellidos)=="" || $.trim(apellidos).length<5){
		   	$("#iconotexto").remove();
		$("#apellido").parent().parent().attr("class","form-group has-error has-feedback");
		$("#apellido").parent().children("span").text("Ingrese sus apellidos").show();
		$("#apellido").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        correcto=false;
	}
	else{
		$("#apellido").parent().parent().attr("class","input-group has-success has-feedback");
		$("#apellido").parent().children("span").text("").hide();
		correcto=true;
	}
	if(!regex_tel.test(tel.value) || $.trim(telefono).length>9){
		$("#iconotexto").remove();
		$("#telefono").parent().parent().attr("class","form-group has-error has-feedback");
		$("#telefono").parent().children("span").text("Ingrese telefono Ej. 2589-8578").show();
	    $("#telefono").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
		correcto=false;
	}
	else{
		$("#telefono").parent().parent().attr("class","input-group has-success has-feedback");
		$("#telefono").parent().children("span").text("").hide();
		correcto=true;
	}

	if (!regex_numeros.test(num.value) || $.trim(edad).length<2 ) {
	    $("#iconotexto").remove();
		$("#edad").parent().parent().attr("class","form-group has-error has-feedback");
		$("#edad").parent().children("span").text("Ingrese solo número/ edad incorrecta").show();
	    $("#edad").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
		correcto=false;
	}
	else
	{
		$("#edad").parent().parent().attr("class","input-group has-success has-feedback");
		$("#edad").parent().children("span").text("").hide();
		correcto=true;
	}

	if(!filter.test(email.value)){
			$("#iconotexto").remove();
		$("#email").parent().parent().attr("class","form-group has-error has-feedback");
		$("#email").parent().children("span").text("Verifique su correo").show();
		$("#email").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
		  correcto=false;
	}
	else{
		$("#email").parent().parent().attr("class","input-group has-success has-feedback");
		$("#email").parent().children("span").text("").hide();
		correcto=true;
	}

	if($.trim(direccion)=="" || $.trim(direccion).length<10){
		$("#iconotexto").remove();
		$("#direccion").parent().parent().attr("class","form-group has-error has-feedback");
		$("#direccion").parent().children("span").text("Ingrese dirección valida").show();
		$("#direccion").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        correcto=false;
	}
	else
	{
		$("#iconotexto").remove();
		$("#direccion").parent().parent().attr("class","input-group has-success has-feedback");
		$("#direccion").parent().children("span").text("").hide();
		$("#direccion").parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback></span>");
		correcto=true;
	}

	

	if($.trim(pass).length<8 || $.trim(pass).length>15){
			$("#iconotexto").remove();
		$("#password").parent().parent().attr("class","form-group has-error has-feedback");
		$("#password").parent().children("span").text("Su contraseña debe contener de 8 a 15 caracteres").show();
		$("#password").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        correcto=false;
	}
	else{

		$("#password").parent().parent().attr("class","input-group has-success has-feedback");
		$("#password").parent().children("span").text("").hide();
	}


return correcto;
}
	
	





