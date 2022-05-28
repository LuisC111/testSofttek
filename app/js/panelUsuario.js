$(document).ready(function() {

    $('#theTable').DataTable({
        ajax: '../app/inc_php/modulo/datosPanelUsuario.php',
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Entradas",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });



    $("#cerrarSesion").click(function() {
        cerrarSesion()
    })



    $("#btnEditar").click(function() {
        editarUsuario()
    })


    function cerrarSesion() {
        var parametros = {
            casoConsulta: "cerrarSesion"
        };
        $.ajax({
            url: "../app/inc_php/modulo/datosPanelUsuario.php",
            type: "POST",
            async: true,
            dataType: "json",
            data: parametros,

            success: function(response) {
                if (response.success) {
                    console.log(response.combos)

                    location.href = "../index.php";

                } else {
                    var msgError = "\nError en solicitud de validaci\u00F3n de acceso, por favor intentalo en otro momento. \n";
                    //msgError = response.error ? msgError + response.error : '';  //Desarrollo
                    $('#spmError').empty();
                    $('#divAlert').show();
                    $('#spmError').html(msgError);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                //alert("Error en solicitud Ajax de | "+jqXHR.responseText + " | " + textStatus + " | " + errorThrown);
                var msgError = "Error en solicitud Ajax de acceso | " + jqXHR.responseText + " | " + textStatus + " | " + errorThrown;
                $('#spmError').empty();
                $('#divAlert').show();
                $('#spmError').html(msgError);
                $("#btnEntrar").html("Entrar");
            }

        });
    }










});