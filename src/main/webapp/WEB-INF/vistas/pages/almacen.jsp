<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/bootstrap-table.min.js"></script>


<div class="card w-100">
    <div class="card-body">
        <div class="card-title">
            <h2>Almacenes</h2>
            <button type="button" class="float-right mb-2 btn btn-primary" data-toggle="modal"
                    data-target="#nuevoalmacen">Nuevo Almacén
            </button>
        </div>

        <table id="tablealmacen" class="table table-hover" data-toggle="table" data-pagination="true" data-height="600"
               data-data-type="text"
               data-response-handler="responseHandler" data-url="almacen/lista">
            <thead class="thead-dark">
            <tr>
                <th data-field="almacen_id">#</th>
                <th data-field="almacen_logo" data-formatter="format_imagen">Logo</th>
                <th data-field="almacen_nombre">Nombre</th>
                <th data-field="almacen_rubro">Rubro</th>
                <th data-field="almacen_estado" data-formatter="format_estado">¿Activo?</th>
                <th data-field="almacen_direccion">Fecha Creación</th>
                <th data-field="almacen_url_pdf">Acciones</th>
                <th data-formatter="format_acciones">Acciones</th>
            </tr>
            </thead>

        </table>

    </div>
</div>

<div class="modal fade" id="formaentregaalmacen" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Almacén</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <section id="sectionformaentrega"></section>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editalmacen" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Almacén</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="editalmacen_nombre">Nombre</label> <input type="text" class="form-control"
                                                                              id="editalmacen_nombre"
                                                                              placeholder="Ingrese nombre">
                        <small id="editalmacen_nombreerror" class="text-danger " style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="editalmacen_rubro">Rubro</label> <input type="text" class="form-control"
                                                                            id="editalmacen_rubro"
                                                                            placeholder="Ingrese el rubro ">
                        <small id="editalmacen_rubroerror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for=almacen_direccion>Dirección</label> <input type="text" class="form-control"
                                                                              id="editalmacen_direccion"
                                                                              placeholder="Ingrese su dirección"> <small
                            id="editalmacen_direccionerror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for="editalmacen_url_pdf">Url Pdf</label> <input type="text" class="form-control"
                                                                                id="editalmacen_url_pdf"
                                                                                placeholder="Ingrese su url de pdf[Catálogo de productos]">
                        <small id="editalmacen_url_pdferror" class="text-danger "
                               style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for="editalmacen_whatsaap">Nro Whatsapp</label> <input type="text" class="form-control"
                                                                                      id="editalmacen_whatsaap"
                                                                                      placeholder="Ingrese su nro de whatsapp">
                        <small id="editalmacen_whatsaaperror" class="text-danger " style="display: none"></small>
                    </div>
                    <hr>
                    <br>
                    <hr>
                    <div class="form-group">
                        <label for="editalmacen_texto_horario">Texto Horario</label>
                        <textarea rows="2" type="text" class="form-control" id="editalmacen_texto_horario"
                                  placeholder="Texto Horario"></textarea>
                        <small id="editalmacen_texto_horarioerror" class="text-danger " style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="editalmacen_url_page_facebook">Facebook</label> <input type="text"
                                                                                           class="form-control"
                                                                                           id="editalmacen_url_page_facebook"
                                                                                           placeholder="Ingrese url de facebook">
                        <small id="editalmacen_url_page_facebookerror" class="text-danger "
                               style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="editalmacen_url_page_instagram">Instagram</label> <input type="text"
                                                                                             class="form-control"
                                                                                             id="editalmacen_url_page_instagram"
                                                                                             placeholder="Ingrese url de instagram">
                        <small id="editalmacen_url_page_instagramerror" class="text-danger "
                               style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="editalmacen_url_page_tiktok">Tik tok</label> <input type="text" class="form-control"
                                                                                        id="editalmacen_url_page_tiktok"
                                                                                        placeholder="Ingrese url de tik tok">
                        <small id="editalmacen_url_page_tiktokerror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for="editalmacen_logo">Imagen</label> <input type="file" class="form-control"
                                                                            accept="image/png, image/jpeg"
                                                                            id="editalmacen_logo">
                        <small id="editalmacen_logoerror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <img src="" id="editalmacen_logo_img" width="100%" height="300px"/>
                    </div>

                    <div class="form-group">
                        <label for="editalmacen_mensaje">Mensaje en whatsapp</label> <input type="text"
                                                                                            class="form-control"
                                                                                            id="editalmacen_mensaje"
                                                                                            placeholder="Ingrese mensaje adjunto a whatsapp">
                        <small id="editalmacen_mensajeerror" class="text-danger " style="display: none"></small>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Actualizar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="nuevoalmacen" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Nuevo Almacén</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="almacen_nombre">Nombre</label> <input type="text" class="form-control"
                                                                          id="almacen_nombre"
                                                                          placeholder="Ingrese nombre"> <small
                            id="almacen_nombreerror" class="text-danger " style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="almacen_rubro">Rubro</label> <input type="text" class="form-control"
                                                                        id="almacen_rubro"
                                                                        placeholder="Ingrese el rubro "> <small
                            id="almacen_rubroerror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for=almacen_direccion>Dirección</label> <input type="text" class="form-control"
                                                                              id="almacen_direccion"
                                                                              placeholder="Ingrese su dirección">
                        <small id="almacen_direccionerror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for="almacen_url_pdf">Url Pdf</label> <input type="text" class="form-control"
                                                                            id="almacen_url_pdf"
                                                                            placeholder="Ingrese su url de pdf[Catálogo de productos]">
                        <small id="almacen_url_pdferror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for="almacen_whatsaap">Nro Whatsapp</label> <input type="text" class="form-control"
                                                                                  id="almacen_whatsaap"
                                                                                  placeholder="Ingrese su nro de whatsapp">
                        <small id="almacen_whatsaaperror" class="text-danger " style="display: none"></small>
                    </div>
                    <hr>
                    <br>
                    <hr>
                    <div class="form-group">
                        <label for="almacen_texto_horario">Texto Horario</label>
                        <textarea rows="2" type="text" class="form-control" id="almacen_texto_horario"
                                  placeholder="Texto Horario"></textarea>
                        <small id="almacen_texto_horarioerror" class="text-danger " style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="almacen_url_page_facebook">Facebook</label> <input type="text" class="form-control"
                                                                                       id="almacen_url_page_facebook"
                                                                                       placeholder="Ingrese url de facebook">
                        <small id="almacen_url_page_facebookerror" class="text-danger " style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="almacen_url_page_instagram">Instagram</label> <input type="text"
                                                                                         class="form-control"
                                                                                         id="almacen_url_page_instagram"
                                                                                         placeholder="Ingrese url de instagram">
                        <small id="almacen_url_page_instagramerror" class="text-danger " style="display: none"></small>
                    </div>
                    <div class="form-group">
                        <label for="almacen_url_page_tiktok">Tik tok</label> <input type="text" class="form-control"
                                                                                    id="almacen_url_page_tiktok"
                                                                                    placeholder="Ingrese url de tik tok">
                        <small id="almacen_url_page_tiktokerror" class="text-danger " style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <label for="almacen_logo">Imagen</label> <input type="file" class="form-control"
                                                                        id="almacen_logo"> <small id="almacen_logoerror"
                                                                                                  class="text-danger "
                                                                                                  style="display: none"></small>
                    </div>

                    <div class="form-group">
                        <img src="" id="almacen_logo_img" width="100%" height="300px"/>
                    </div>

                    <div class="form-group">
                        <label for="almacen_mensaje">Mensaje en whatsapp</label> <input type="text" class="form-control"
                                                                                        id="almacen_mensaje"
                                                                                        placeholder="Ingrese mensaje adjunto a whatsapp">
                        <small id="almacen_mensajeerror" class="text-danger " style="display: none"></small>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btn_registrar">Registrar</button>
            </div>
        </div>
    </div>
</div>
<script>
    var imagen_foto = "";

    var fileInput = document.getElementById("almacen_logo");
    var imageElement = document.getElementById("almacen_logo_img");

    fileInput.addEventListener("change", (e) => {
        var file = e.target.files[0];
        var reader = new FileReader();
        reader.onloadend = () => {
            var base64String = reader.result
                .replace("data:", "")
                .replace(/^.+,/, "");
            console.log(base64String);
            imagen_foto = base64String;
            imageElement.src = URL.createObjectURL(file);
        };
        reader.readAsDataURL(file);
    });


    $("#btn_registrar").on("click", function () {
        var pojo = {
            almacen_nombre: $("#almacen_nombre").val(),
            almacen_direccion: $("#almacen_direccion").val(),
            almacen_url_pdf: $("#almacen_url_pdf").val(),
            almacen_whatsaap: $("#almacen_whatsaap").val(),
            almacen_logo: "data:image/;base64," + imagen_foto,
            almacen_texto_horario: $("#almacen_texto_horario").val(),
            almacen_url_page_facebook: $("#almacen_url_page_facebook").val(),
            almacen_url_page_instagram: $("#almacen_url_page_instagram").val(),
            almacen_url_page_tiktok: $("#almacen_url_page_tiktok").val(),
            almacen_mensaje: $("#almacen_mensaje").val(),

            almacen_rubro: $("#almacen_rubro").val()
        }

        $.ajax({
            method: 'POST',
            url: "almacen/registrar",
            contentType: "application/json",
            data: JSON.stringify(pojo),
            beforeSend: function () {
            },
            success: function (res) {
                //console.log(res)
                $("#nuevoalmacen").modal("hide");
                $("#tablealmacen").bootstrapTable('refresh', {
                    url: 'almacen/lista',
                    locale: 'es-PE'
                });
            },
            error: function (err) {
                console.log(err)
                console.log(err.responseJSON.errores)
                err.responseJSON.errores.forEach(err => {
                    $("#det" + err.param + plan_id_o_iterador + "help").css("display", "block");
                    $("#det" + err.param + plan_id_o_iterador + "help").text(err.msg);
                })
            }
        });

    });


    var responseHandler = function (res) {
        return JSON.parse(res)
    }

    var format_imagen = function (img) {
        return "<img src='" + img + "' height=100px width=100px/>";
    }

    var format_estado = function (almacen_estado) {
        return almacen_estado == 1 ? "SI" : "NO";
    }

    function format_acciones(row, value, x) {
        var rpta = '<a data-toggle="tooltip" data-placement="top" onclick="cambiarestadoalmacen('
            + value.almacen_id
            + ','
            + value.almacen_estado
            + ')" title="'
            + (value.almacen_estado === 1 ? 'Desactivar' : 'Activar')
            + ' Almacén" class="m-1 btn btn-'
            + (value.almacen_estado === 1 ? 'danger' : 'success')
            + '" ><i class="text-white fas fa-power-off"></i></a>';
        rpta += '<a data-toggle="tooltip" data-placement="top" onclick="abrimodalEdit(' + value.almacen_id + ')" title="Editar Almacén" class="btn btn-info m-1" ><i class="text-white fas fa-edit"></i></a>';
        rpta += '<a data-toggle="tooltip" data-placement="top" onclick="abrirModalFormaEntrega(' + value.almacen_id + ')" title="" class="btn btn-warning m-1" ><i class="text-white fas fa-list"></i></a>';
        return rpta;
    }

    var formaux = 10000;

    var itemFormaEntrega = function (obj) {
        var id = obj.detalle_formaentrega_id == null ? ++formaux : obj.detalle_formaentrega_id;
        return "<div id='box" + id + "'>" +
            (obj.detalle_formaentrega_id == null ? "<small id='mensaje" + id + "' class='text-info'>Sin Registrar</small>" : "<small id='mensaje" + id + "' class='text-success'>Registrado</small>") +
            "<input id='formaentrega_nombre" + id + "' class='form-control mt-1' type='text' value='" + obj.formaentrega_nombre + "' disabled/>" +
            "<input id='formaentrega_precio" + id + "' class='form-control mt-1' type='number' value='" + obj.formaentrega_precio + "' placeholder='ingrese precio'>" +
            "<div class='text-right mt-1'>" +
            (obj.detalle_formaentrega_id == null ?
                "<a href='javascript:void(0)' class='btn btn-sm btn-success' onclick='guardarFormaEntrega(" + id + "," + obj.formaentrega_id + ")'><i class='fas fa-save'></i></a>" :
                "<a href='javascript:void(0)' class='btn btn-sm btn-danger' onclick='deleteFormaEntrega(" + id + "," + obj.formaentrega_id + ")'><i class='fas fa-trash'></i></a>" +
                "<a href='javascript:void(0)' class='btn btn-sm btn-success' onclick='actualizarFormaEntrega(" + id + "," + obj.formaentrega_id + ")'><i class='fas fa-save'></i></a>") +
            "</div>" +
            "<hr>" +
            "</div>";
    }
    var deleteFormaEntrega = function(id,id_formaentrega){

        var pojo = {
            detalle_formaentrega_id: null,
            formaentrega_id: id_formaentrega,
            almacen_id:Galmacen_id,
            formaentrega_nombre: $("#formaentrega_nombre" + id).val(),
            formaentrega_precio: $("#formaentrega_precio" + id).val()
        }

        $.ajax({
            method: 'DELETE',
            url: "almacen/formaentrega/delete/"+id,
            contentType: "application/json",
            //data: JSON.stringify(pojo),
            beforeSend: function () {
            },
            success: function (res) {
                $("#box" + id).replaceWith(itemFormaEntrega(pojo));
            },
            error: function (err) {
            }
        });

    }

    var actualizarFormaEntrega = function (id, id_formaentrega) {

        var pojo = {
            detalle_formaentrega_id: id,
            formaentrega_id: id_formaentrega,
            almacen_id:Galmacen_id,
            formaentrega_nombre: $("#formaentrega_nombre" + id).val(),
            formaentrega_precio: $("#formaentrega_precio" + id).val()
        }

        $.ajax({
            method: 'POST',
            url: "almacen/formaentrega/registrar",
            contentType: "application/json",
            data: JSON.stringify(pojo),
            beforeSend: function () {
            },
            success: function (res) {
                $("#box" + id).replaceWith(itemFormaEntrega(res));
            },
            error: function (err) {
            }
        });

    }
    var guardarFormaEntrega = function (id, id_formaentrega) {

        var pojo = {
            detalle_formaentrega_id: id,
            formaentrega_id: id_formaentrega,
            almacen_id:Galmacen_id,
            formaentrega_nombre: $("#formaentrega_nombre" + id).val(),
            formaentrega_precio: $("#formaentrega_precio" + id).val()
        }

        $.ajax({
            method: 'POST',
            url: "almacen/formaentrega/registrar",
            contentType: "application/json",
            data: JSON.stringify(pojo),
            beforeSend: function () {
            },
            success: function (res) {
                $("#box" + id).replaceWith(itemFormaEntrega(res));
            },
            error: function (err) {
            }
        });

    }

    var Galmacen_id;
    var abrirModalFormaEntrega = function (almacen_id) {
        Galmacen_id=almacen_id;
        $("#formaentregaalmacen").modal("show");
        $.ajax({
            method: 'GET',
            url: "almacen/lista/formaentrega/" + almacen_id,
        }).done(function (res) {
            var html = "";
            res.forEach(function (e) {
                html += itemFormaEntrega(e)
            });
            $("#sectionformaentrega").html(html);
        });

    }
    var abrimodalEdit = function (almacen_id) {
        $.ajax({
            method: 'GET',
            url: "almacen/lista/" + almacen_id,
        }).done(function (res) {
            var html = "";
            /*console.log("res",res)*/
            $("#editalmacen_nombre").val(res.almacen_nombre)
            $("#editalmacen_direccion").val(res.almacen_direccion)
            $("#editalmacen_url_pdf").val(res.almacen_url_pdf)
            $("#editalmacen_whatsaap").val(res.almacen_whatsaap)

            $("#editalmacen_logo_img").attr("src", res.almacen_logo)
            $("#editalmacen_texto_horario").val(res.almacen_texto_horario)
            $("#editalmacen_url_page_facebook").val(res.almacen_url_page_facebook)
            $("#editalmacen_url_page_instagram").val(res.almacen_url_page_instagram)
            $("#editalmacen_url_page_tiktok").val(res.almacen_url_page_tiktok)
            $("#editalmacen_mensaje").val(res.almacen_mensaje)

            $("#editalmacen_rubro").val(res.almacen_rubro)
        });

        $("#editalmacen").modal("show");
    }
    var cambiarestadoalmacen = function (almacen_id, almacen_estado) {

        $.ajax(
            {
                method: 'POST',
                url: "almacen/cambiarestado?almacen_estado="
                    + almacen_estado + "&almacen_id=" + almacen_id,
            }).done(function () {
            $("#tablealmacen").bootstrapTable('refresh', {
                url: 'almacen/lista',
                locale: 'es-PE'
            });
        });

    }
</script>