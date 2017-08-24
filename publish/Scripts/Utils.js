//funcion que permite convertir numeros con unidades de mil y 2 decimales
function decimal(input, caracter) {
    //numero con 2 decimales
    var dec = 2;
    if (dec != 0) {
        var decimales = true;
    }

    var pat = /[\*,\+,\(,\),\?,\\,\$,\[,\],\^]/;
    valor = input.value;
    var largo = valor.length;
    crtr = true;
    if (isNaN(caracter) || pat.test(caracter) == true) {
        if (pat.test(caracter) == true)
        { caracter = "\\" + caracter; }
        var carcter = new RegExp(caracter, "g");
        var valor = valor.replace(carcter, "");
        input.value = valor;
        var crtr = false;
        //alert('paso1');
    }
    else {
        //alert('paso2');
        var nums = new Array();
        var cont = 0;
        for (var m = 0; m < largo; m++) {
            if (valor.charAt(m) == "." || valor.charAt(m) == " " || valor.charAt(m) == ",")
            { continue; }
            else {
                nums[cont] = valor.charAt(m);
                cont++;
            }
        }
    }

    if (decimales == true) {
        //alert('paso3');
        var ctdd = eval(1 + dec);
        var nmrs = 1;
    }
    else {
        //alert('paso4');
        ctdd = 1; nmrs = 3;
    }
    var cad1 = "", cad2 = "", cad3 = "", tres = 0;
    if (largo > nmrs && crtr == true) {
        //alert('paso5');
        for (var k = nums.length - ctdd; k >= 0; k--) {
            cad1 = nums[k];
            cad2 = cad1 + cad2;
            tres++;
            if ((tres % 3) == 0) {
                if (k != 0) {
                    //cad2 = "." + cad2;
                }
            }
        }

        for (var dd = dec; dd > 0; dd--) {
            //cad3 += nums[nums.length-dd]; 
            //alert(nums[nums.length-dd]);
            if (typeof (nums[nums.length - dd]) != "undefined") {
                cad3 += nums[nums.length - dd];
            }
        }
        if (decimales == true)
        { cad2 += "," + cad3; }
        input.value = cad2;
    }
    input.focus();
}

function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode;
    return (key >= 48 && key <= 57);
}