$(document).ready(function() {


    $("#btnRegistro").click(function() {

        $("#login").hide();
        $("#registro").show();
        $("#emailRegistro").val('')
        $("#passRegistro").val('')
        $("btnRegistrar").focus();

    });

    $("#btnLogin").click(function() {

        $("#login").show();
        $("#registro").hide();
        $("#email").val('');
        $("#pass").val('')

    });

    $(".alertaDatos").click(function() {
        Swal.fire({
            title: 'Política de tratamiento de datos',
            html: 'La Constitución Política de Colombia estableció en el artículo 15 el derecho de protección de' +
                'datos personales como el derecho de toda persona para conocer, actualizar, rectificar y/o' +
                'cancelar la información y datos personales que de ella se hayan recolectado y/o se traten en' +
                'bases de datos públicas o privadas.' +
                'Mediante la Ley 1581 del 17 de octubre de 2012, el Congreso de la República reglamentó el ya' +
                'mencionado derecho al establecer las Disposiciones Generales para la Protección de Datos' +
                'Personales en Colombia, igualmente reglamentada por los Decretos 1377 de 2013 y 886 de 2014' +
                '(hoy incorporados en el Decreto único 1074 de 2015), entre otros.' +
                'En cumplimiento de las anteriores disposiciones LA SUPERINTENDENCIA DE INDUSTRIA Y' +
                'COMERCIO, consciente de la responsabilidad que les asiste en materia de Tratamiento de Datos' +
                'Personales de los titulares, garantiza el derecho constitucional que tienen todas las personas a' +
                'conocer, actualizar, rectificar, suprimir y revocar la autorización respecto a las informaciones que' +
                'hayan recogido sobre ellas en las bases de datos que la Entidad, ha recopilado para las finalidades' +
                'previstas en la Ley y las autorizaciones respectivas, las cuales han sido tratadas conforme a lo' +
                'establecido por el régimen nacional de protección de datos personales.' +
                'Para tales efectos LA SUPERINTENDENCIA DE INDUSTRIA Y COMERCIO ha elaborado la' +
                'presente POLÍTICA PARA EL TRATAMIENTO DE DATOS PERSONALES, cuya aplicación es' +
                'de carácter obligatorio para todas las personas naturales o jurídicas que hagan tratamiento de los' +
                'datos personales registrados en las bases de datos de la Entidad, con el fin de proporcionar los' +
                'lineamientos necesarios para el cumplimiento de las obligaciones legales en materia de protección' +
                'de datos personales.' +
                'LA SUPERINTENDENCIA DE INDUSTRIA Y COMERCIO, se permite informar a todos los' +
                'interesados, que los datos personales que obtenga en virtud de las operaciones que se soliciten o' +
                'celebren con la Entidad, serán tratados conforme a los principios y deberes definidos en la ley 1581' +
                'de 2012 y demás normas que traten y regulen esta materia. Para todos los fines pertinentes, el' +
                'domicilio de LA SUPERINTENDENCIA DE INDUSTRIA Y COMERCIO será la Carrera. 13 #27-00 en' +
                'la ciudad de Bogotá, teléfono: (57) (1) 5870000 Ext. 10105, correo electrónico:' +
                'contactenos@sic.gov.co y página https://www.sic.gov.co/',
            confirmButtonColor: '#1E6CA9',
            confirmButtonText: 'Aceptar'
        })
    });

    $("#email").keypress(function(e) {
        if (e.which == 13) {
            $("#pass").focus();
            $("#pass").select();
        }
    });

    $("#pass").keypress(function(e) {
        if (e.which == 13) {}
    });

    $("#btnEntrar").click(function(event) {
        event.preventDefault();
        validaAcceso();
    })

    $("#btnRegistrar").click(function(event) {
        event.preventDefault();
        registrarUsuario();
    })

    function validaAcceso() {
        var usuario = $("#email").val();
        var contrasena = $("#pass").val();
        if (usuario && contrasena) {
            var parametros = {
                usuario,
                contrasena,
                casoConsulta: "validaAcceso"
            };
            $.ajax({
                url: "../app/inc_php/acceso/datosAccesoLogin.php",
                type: "POST",
                async: true,
                dataType: "json",
                data: parametros,
                beforeSend: function() {
                    $('#btnEntrar').html('<i class="fa fa-spinner fa-spin"></i>');
                },
                success: function(response) {
                    if (response.success) {
                        if (response.combos) {
                            console.log(response.combos)
                            $("#frmAccesoLogin").submit();
                        } else {
                            Swal.fire({
                                title: '¡Ups!',
                                icon: 'error',
                                html: 'Correo o contraseña incorrectos.',
                                confirmButtonColor: '#1E6CA9',
                                confirmButtonText: 'Aceptar'
                            })
                        }
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
                },
                complete: function() {
                    $("#btnEntrar").html("Entrar");
                }
            });

        } else {
            Swal.fire({
                title: '¡Ups!',
                icon: 'error',
                html: 'Ingresa tus datos de usuario correctamente e intenta nuevamente.',
                confirmButtonColor: '#1E6CA9',
                confirmButtonText: 'Aceptar'
            })
        }
    }


    function registrarUsuario() {
        var usuario = $("#emailRegistro").val();
        var contrasena = $("#passRegistro").val();
        var nombre = $("#nombreRegistro").val();
        var apellido = $("#apellidoRegistro").val();
        var cedula = $("#cedulaRegistro").val();
        if (usuario && contrasena) {
            var parametros = {
                usuario,
                contrasena,
                nombre,
                apellido,
                cedula,
                casoConsulta: "registroUsuario"
            };
            $.ajax({
                url: "../app/inc_php/acceso/datosAccesoLogin.php",
                type: "POST",
                async: true,
                dataType: "json",
                data: parametros,
                beforeSend: function() {
                    $('#btnEntrar').html('<i class="fa fa-spinner fa-spin"></i>');
                },
                success: function(response) {
                    if (response.success) {

                        if (response.combos) {
                            Swal.fire({
                                title: '¡Registro exitoso!',
                                icon: 'success',
                                html: 'Por favor inicia sesión a continuación.',
                                confirmButtonColor: '#1E6CA9',
                                confirmButtonText: 'Aceptar'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $("#registro").hide();
                                    $("#login").show();
                                    $("#email").val(response.usuario);
                                    $("pass").val('')
                                }
                            })


                        } else {
                            Swal.fire({
                                title: '¡Ups!',
                                icon: 'error',
                                html: 'Ha ocurrido un error al registrarte.',
                                confirmButtonColor: '#1E6CA9',
                                confirmButtonText: 'Aceptar'
                            })
                        }
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
                },
                complete: function() {
                    $("#btnEntrar").html("Entrar");
                }
            });

        } else {
            Swal.fire({
                title: '¡Ups!',
                icon: 'error',
                html: 'Ingresa tus datos de usuario correctamente e intenta nuevamente.',
                confirmButtonColor: '#1E6CA9',
                confirmButtonText: 'Aceptar'
            })
        }
    }

});