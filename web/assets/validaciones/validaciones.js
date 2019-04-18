$(document).ready(inicio);
function inicio(){
	
	$("span.help-block").hide();
	$("#frame").hide();
	$("#btnGuardar").click(function(){
	var nombre = $("#nombre").val();
var edad = $("#edad").val();
var direccion = $("#direccion").val();
var apellidos=$("#apellido").val();
var telefono=$("#telefono").val();
var correo=$("#email").val();
var pass=$("#password").val();
var email = document.getElementById('email');
var num=document.getElementById('edad');
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

	if (!regex_numeros.test(num.value)) {
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

	if(!correcto){
			alert('Algunos campos no están correctos, vuelva a revisarlos!!');
		}

return correcto;
	});


}


function validaCampos(){

var nombre = $("#nombre").val();
var edad = $("#edad").val();
var direccion = $("#direccion").val();

//validamos campos
if($.trim(nombre) == ""){
	   	$("#iconotexto").remove();
		$("#nombre").parent().parent().attr("class","form-group has-error has-feedback");
		$("#nombre").parent().children("span").text("Debe ingresar información").show();
		$("#nombre").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
		
		return false;
}	
	if($.trim(nombre).length>5){
		$("#iconotexto").remove();
		$("#nombre").parent().parent().attr("class","input-group has-success has-feedback");
		$("#nombre").parent().children("span").text("").hide();
		$("#nombre").parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback></span>");
		
		return true;
}


if( $.trim(edad).length==0) {
		$("#iconotexto").remove();
		$("#edad").parent().parent().attr("class","form-group has-error has-feedback");
		$("#edad").parent().children("span").text("Solo números").show();
		//$("#nombre").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");	
		return false;
	}
	if($.trim(edad).length>2){
		$("#iconotexto").remove();
		$("#edad").parent().parent().attr("class","input-group has-success has-feedback");
		$("#edad").parent().children("span").text("").hide();
		$("#edad").parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback></span>");
		
		return true;
}

            if(edad < 0){
toastr.error("Mínimo permitido 0","Aviso!");
    return false;
}
if($.trim(direccion) == ""){
	$("#iconotexto").remove();
		$("#direccion").parent().parent().attr("class","form-group has-error has-feedback");
		$("#direccion").parent().children("span").text("Debe ingresar información").show();
		$("#direccion").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
		
		return false;
}

}


function validar() {

var nombre = $("#nombre").val();
var edad = $("#edad").val();
var direccion = $("#direccion").val();

	var correcto=true;
	if ($.trim(nombre) == "") {
			   	$("#iconotexto").remove();
		$("#nombre").parent().parent().attr("class","form-group has-error has-feedback");
		$("#nombre").parent().children("span").text("Debe ingresar información").show();
		$("#nombre").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        correcto=false;
	}
	if($.trim(nombre).length>5){
		$("#iconotexto").remove();
		$("#nombre").parent().parent().attr("class","input-group has-success has-feedback");
		$("#nombre").parent().children("span").text("").hide();
		$("#nombre").parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback></span>");
		correcto=true;
	}
	if (document.getElementById('edad').value.length<2) {
	$("#iconotexto").remove();
		$("#edad").parent().parent().attr("class","form-group has-error has-feedback");
		$("#edad").parent().children("span").text("Solo números").show();
		correcto=true;
	}

	if (document.getElementById('apellidos').value.length<2) {
		 correcto=false;
	}
	if (document.getElementById('edad').value==0) {
		 correcto=false;
	}

     var email = document.getElementById('correo');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
    correcto=false;
     }
     if (document.getElementById('direccion').value.length<2) {
         correcto=false;
     }
     if (document.getElementById("depto").value.length<1) {
     	correcto=false
     }

	if(!correcto){
			alert('Algunos campos no están correctos, vuelva a revisarlos!!');
		}

return correcto;
}

