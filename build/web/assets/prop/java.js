var dd = /[- A-Za-z0-9]/;
function val(e) {
    var tecla = (document.all) ? e.keyCode : e.which;
    tfin = String.fromCharCode(tecla);
    return dd.test(tfin);
}
/*PDF*/
/*----------------------------------------------------------------------*/
        var filediv = document.getElementById("pdf");
        var filelabel = document.getElementById("lab");
        var fileinput = document.getElementById("ifile");
function defecto(event){
    event.preventDefault();
    event.stopPropagation();
}

function sobre(){
    filediv.classList.add("fileHover");
}

function sobreEnd(){
    filediv.classList.remove("fileHover");
}

function agregar(event){
     fileinput.files = event.dataTransfer.files;      
     document.getElementById("lab").innerText = event.dataTransfer.files[0].name;
}
/*----------------------------------------------------------------------*/
