$(document).ready(inicio);
function inicio() {
    $("span.valid-feedback").hide();
    $("#btnGuardar").click(function () {
        if (validar() == false)
            alert("Error! Verifique información ingresada");
    });
    $("#nombres").keyup(validar);
    $("#edad").keyup(validar);
    $("#apellidos").keyup(validar);
    $("#correo").keyup(validar);
    $("#password").keyup(validar);
    $("#direccion").keyup(validar);
    $("#telefono").keyup(validar);
    $("#cargo").change(validar);
    $("#depto").change(validar);
    $("#estado").change(validar);
    $("#password2").keyup(validar);
}
function validar() {
    var nombre = $("#nombres").val();
    var edad = $("#edad").val();
    var direccion = $("#direccion").val();
    var apellidos = $("#apellidos").val();
    var telefono = $("#telefono").val();
    var correo = $("#correo").val();
    var pass = $("#password").val();
    var pass2 = $("#password2").val();
    var email = document.getElementById('correo');
    var num = document.getElementById('edad');
    var tel = document.getElementById('telefono');
    var regex_tel = /^([0-9]{4})+(-){0,1}([0-9]{4})$/;
    var regex_numeros = /^[0-9]+$/;
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    var correcto = true;
    if ($.trim(nombre) == "" || $.trim(nombre).length < 5) {
        $("#iconotexto").remove();
        document.getElementById('nombres').className = "form-control is-invalid";
        $("#nombres").parent().parent().attr("input", "form-control is-invalid");
        $("#nombres").parent().children("span").text("Ingrese su nombre").show();
        $("#nombre").parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        correcto = false;
    } else {

        $("#nombres").parent().children("span").text("").hide();
        document.getElementById('nombres').className = "form-control is-valid";
        correcto = true;
    }
    if (document.getElementById('cargo').value === "")
    {
        $("#iconotexto").remove();
        document.getElementById('cargo').className = "custom-select is-invalid";
        $("#cargo").parent().children("span").text("Seleccione una opción").show();
        correcto = false;
    } else
    {
        $("#cargo").parent().children("span").text("").hide();
        document.getElementById('cargo').className = "custom-select is-valid";
        correcto = true;
    }
    if (document.getElementById('depto').value === "")
    {
        $("#iconotexto").remove();
        document.getElementById('depto').className = "custom-select is-invalid";
        $("#depto").parent().children("span").text("Seleccione una opción").show();
        correcto = false;
    } else
    {
        $("#depto").parent().children("span").text("").hide();
        document.getElementById('depto').className = "custom-select is-valid";
        correcto = true;
    }

    if ($.trim(apellidos) === "" || $.trim(apellidos).length < 5) {
        $("#iconotexto").remove();
        document.getElementById('apellidos').className = "form-control is-invalid";
        $("#apellidos").parent().children("span").text("Ingrese sus apellidos").show();

        correcto = false;
    } else {
        document.getElementById('apellidos').className = "form-control is-valid";
        $("#apellidos").parent().children("span").text("").hide();
        correcto = true;
    }
    if (!regex_tel.test(tel.value) || $.trim(telefono).length > 9) {
        $("#iconotexto").remove();
        document.getElementById('telefono').className = "form-control is-invalid";
        $("#telefono").parent().parent().attr("class", "form-group has-error has-feedback");
        $("#telefono").parent().children("span").text("Ingrese telefono Ej. 2589-8578").show();

        correcto = false;
    } else {
        document.getElementById('telefono').className = "form-control is-valid";
        $("#telefono").parent().children("span").text("").hide();
        correcto = true;
    }

    if (!regex_numeros.test(num.value) || $.trim(edad).length < 2) {
        $("#iconotexto").remove();
        document.getElementById('edad').className = "form-control is-invalid";
        $("#edad").parent().parent().attr("class", "form-group has-error has-feedback");
        $("#edad").parent().children("span").text("Ingrese solo número/ edad incorrecta").show();

        correcto = false;
    } else
    {
        document.getElementById('edad').className = "form-control is-valid";
        $("#edad").parent().children("span").text("").hide();
        correcto = true;
    }

    if (!filter.test(email.value)) {
        $("#iconotexto").remove();
        document.getElementById('correo').className = "form-control is-invalid";
        $("#correo").parent().parent().attr("class", "form-group has-error has-feedback");
        $("#correo").parent().children("span").text("Verifique su correo").show();

        correcto = false;
    } else {
        document.getElementById('correo').className = "form-control is-valid";

        $("#correo").parent().children("span").text("").hide();
        correcto = true;
    }

    if ($.trim(direccion) == "" || $.trim(direccion).length < 10) {
        $("#iconotexto").remove();
        document.getElementById('direccion').className = "form-control is-invalid";

        $("#direccion").parent().children("span").text("Ingrese dirección valida").show();

        correcto = false;
    } else
    {
        $("#iconotexto").remove();
        document.getElementById('direccion').className = "form-control is-valid";
        $("#direccion").parent().children("span").text("").hide();

        correcto = true;
    }



    if ($.trim(pass).length < 8 || $.trim(pass).length > 15) {
        $("#iconotexto").remove();
        document.getElementById('password').className = "form-control is-invalid";
        $("#password").parent().children("span").text("Su contraseña debe contener de 8 a 15 caracteres").show();

        correcto = false;
    } else {
        document.getElementById('password').className = "form-control is-valid";
        $("#password").parent().parent().attr("class", "input-group has-success has-feedback");
        $("#password").parent().children("span").text("").hide();
        correcto = true;
    }

    if ($.trim(pass2).length < 8 || $.trim(pass2).length > 15) {
        $("#iconotexto").remove();
        document.getElementById('password2').className = "form-control is-invalid";
        $("#password2").parent().children("span").text("Su contraseña debe contener de 8 a 15 caracteres").show();

        correcto = false;
    } else {
        document.getElementById('password2').className = "form-control is-valid";
        $("#password2").parent().parent().attr("class", "input-group has-success has-feedback");
        $("#password2").parent().children("span").text("").hide();
        correcto = true;
    }

    return correcto;
}







