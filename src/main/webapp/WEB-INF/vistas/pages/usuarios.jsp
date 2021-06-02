<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/bootstrap-table.min.js"></script>


<div class="card w-100">
    <div class="card-body">
        <div class="card-title">
            <h2>Usuarios</h2>

            <button type="button" class="float-right mb-2 btn btn-primary" data-toggle="modal"
                    data-target="#nuevousuario">Nuevo Usuario
            </button>
        </div>

        <table id="tableusuarios" class="table table-hover" data-toggle="table" data-pagination="true" data-height="600"
               data-data-type="text"
               data-response-handler="responseHandler" data-url="usuarios/lista">
            <thead class="thead-dark">
            <tr>
                <th data-field="usuario_id">#</th>
                <th data-field="usuario_datos">Nombres y Apellidos</th>
                <th data-field="usuario_usuario">Usuario</th>
                <th data-field="usuario_password">Contraseña</th>

                <th data-field="usuario_estado" data-formatter="format_estado">¿Activo?</th>
                <th data-field="usuario_nivel">Nivel</th>
                <th data-field="usuario_almacen">Almacén</th>
                <th data-formatter="format_acciones">Acciones</th>
            </tr>
            </thead>

        </table>

    </div>
</div>

<div class="modal" id="nuevousuario" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Nueva Forma de Entrega</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form>
                    <div class="form-group">
                        <label for="usuario_nombre">Nombre</label> <input type="text" class="form-control"
                                                                          id="usuario_nombre" placeholder="Nombre">
                    </div>

                    <div class="form-group">
                        <label for="usuario_paterno">Apellido Paterno</label> <input type="text" class="form-control"
                                                                                     id="usuario_paterno"
                                                                                     placeholder="Apellido Paterno">
                    </div>

                    <div class="form-group">
                        <label for="usuario_materno">Apellido Materno</label> <input type="text" class="form-control"
                                                                                     id="usuario_materno"
                                                                                     placeholder="Apellido Materno">
                    </div>

                    <br>
                    <hr>
                    <div class="form-group">
                        <label for="usuario_nivel">Nivel de Usuario</label> <select class="form-control custom-select"
                                                                                    id="usuario_nivel">
                        <option value="ADMIN">ADMIN</option>
                        <option value="CONTENIDO">CONTENIDO</option>

                    </select>
                    </div>

                    <div class="form-group">
                        <label for="usuario_almacen">Almacenes permitidos</label> <select
                            class="form-control custom-select" id="usuario_almacen" multiple>
                    </select>
                    </div>

                    <div class="form-group">
                        <label for="usuario_usuario">Usuario</label>
                        <input type="text" class="form-control" id="usuario_usuario" placeholder="Usuario">
                    </div>

                    <div class="form-group">
                        <label for="usuario_password">Password</label>
                        <input type="text" class="form-control" id="usuario_password" placeholder="Contraseña">
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btn_registrar">Guardar</button>

            </div>
        </div>
    </div>
</div>


<div class="modal" id="editusuario" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Nueva Forma de Entrega</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="editusuario_nombre">Nombre</label> <input type="text" class="form-control"
                                                                              id="editusuario_nombre"
                                                                              placeholder="Nombre">
                    </div>

                    <div class="form-group">
                        <label for="editusuario_paterno">Apellido Paterno</label> <input type="text"
                                                                                         class="form-control"
                                                                                         id="editusuario_paterno"
                                                                                         placeholder="Apellido Paterno">
                    </div>

                    <div class="form-group">
                        <label for="editusuario_materno">Apellido Materno</label> <input type="text"
                                                                                         class="form-control"
                                                                                         id="editusuario_materno"
                                                                                         placeholder="Apellido Materno">
                    </div>

                    <br>
                    <hr>
                    <div class="form-group">

                        <label for="editusuario_nivel">Nivel de Usuario</label>
                        <select class="form-control custom-select" id="editusuario_nivel">
                            <option value="ADMIN">ADMIN</option>
                            <option value="CONTENIDO">CONTENIDO</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="editusuario_almacen">Almacenes permitidos</label> <select class="form-control"
                                                                                              id="editusuario_almacen"
                                                                                              multiple>
                    </select>
                    </div>

                    <div class="form-group">
                        <label for="editusuario_usuario">Usuario</label>
                        <input type="text" class="form-control" id="editusuario_usuario" placeholder="Usuario">
                    </div>

                    <div class="form-group">
                        <label for="editusuario_password">Password</label>
                        <input type="text" class="form-control" id="editusuario_password" placeholder="Contraseña">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="btn_actualizar">Guardar</button>

            </div>
        </div>
    </div>
</div>

<script>

    $.ajax({method: 'GET', url: "usuarios/almacenes/combo"}).done(function (res) {

        var html = "";
        res.forEach(function (obj) {
            html += '<option value="' + obj.id + '">' + obj.text + '</option>';
        })
        $("#usuario_almacen").html(html);
        $("#editusuario_almacen").html(html);

        console.log()
    });

    var Gid_formaentrega = 0;
    $("#btn_actualizar").on("click", function () {


        var cbo = [];
        $("#editusuario_almacen :selected").each(function () {
            var pj = {id: this.id, text: this.value};
            cbo.push(pj);
        });


        var pojo = {
            usuario_id: Gid_formaentrega,
            usuario_nombre: $("#editusuario_nombre").val(),
            usuario_paterno: $("#editusuario_paterno").val(),
            usuario_materno: $("#editusuario_materno").val(),
            usuario_usuario: $("#editusuario_usuario").val(),
            usuario_password: $("#editusuario_password").val(),
            usuario_nivel: $("#editusuario_nivel").val(),
            usuario_almacen: cbo
        }


        $.ajax({
            method: 'POST',
            url: "usuarios/actualizar",
            contentType: "application/json",
            data: JSON.stringify(pojo),
            beforeSend: function () {

            },
            success: function (res) {
                //console.log(res)
                $('form').trigger("reset");
                $("#editusuario").modal("hide");

                $("#tableusuarios").bootstrapTable('refresh', {
                    url: 'usuarios/lista',
                    locale: 'es-PE'
                });
            },
            error: function (err) {
                console.log(err)
                console.log(err.responseJSON.errores)

                err.responseJSON.errores.forEach(err => {
                    $("#" + err.param + plan_id_o_iterador + "error").css("display", "block");
                    $("#" + err.param + plan_id_o_iterador + "error").text(err.msg);
                })
            }
        });


    });

    $("#btn_registrar").on("click", function () {
        var cbo = [];
        $("#usuario_almacen :selected").each(function () {
            var pj = {id: this.id, text: this.value};
            cbo.push(pj);
        });


        var pojo = {
            usuario_nombre: $("#usuario_nombre").val(),
            usuario_paterno: $("#usuario_paterno").val(),
            usuario_materno: $("#usuario_materno").val(),
            usuario_usuario: $("#usuario_usuario").val(),
            usuario_password: $("#usuario_password").val(),
            usuario_nivel: $("#usuario_nivel").val(),
            usuario_almacen: cbo
        }


        $.ajax({
            method: 'POST',
            url: "usuarios/registrar",
            contentType: "application/json",
            data: JSON.stringify(pojo),
            beforeSend: function () {

            },
            success: function (res) {
                //console.log(res)
                $('form').trigger("reset");
                $("#nuevousuario").modal("hide");

                $("#tableusuarios").bootstrapTable('refresh', {
                    url: 'usuarios/lista',
                    locale: 'es-PE'
                });
            },
            error: function (err) {
                console.log(err)
                console.log(err.responseJSON.errores)

                err.responseJSON.errores.forEach(err => {
                    $("#" + err.param + plan_id_o_iterador + "error").css("display", "block");
                    $("#" + err.param + plan_id_o_iterador + "error").text(err.msg);
                })
            }
        });
    })

    var responseHandler = function (res) {

        var response = JSON.parse(res);
        return response;
    }

    var format_estado = function (usuario_estado) {
        return usuario_estado ? "Activado" : "Desactivado";
    }

    function format_acciones(row, value, x) {
        var rpta = '<a data-toggle="tooltip" data-placement="top" onclick="cambiarestadoatributo('
            + value.usuario_id
            + ','
            + value.usuario_estado
            + ')" title="'
            + (value.usuario_esta == 1 ? 'Desactivar' : 'Activar')
            + ' Almacén" class="m-1 btn btn-'
            + (value.usuario_estado ? 'danger' : 'success')
            + '" ><i class="text-white fas fa-power-off"></i></a>';
        rpta += '<a data-toggle="tooltip" data-placement="top" onclick="abrimodalEdit('
            + value.usuario_id
            + ')" title="Editar Almacén" class="btn btn-info m-1" ><i class="text-white fas fa-edit"></i></a>';
        return rpta;
    }

    var abrimodalEdit = function (usuario_id) {

        Gid_formaentrega = usuario_id;

        $("#editusuario").modal("show");

        $.ajax({method: 'GET', url: "usuarios/lista/" + usuario_id,}).done(function (res) {
            var cboids = [];
            var cboids = res.usuario_almacen.map((e) => e.text);

            $("#editusuario_nombre").val(res.usuario_nombre),
                $("#editusuario_paterno").val(res.usuario_paterno),
                $("#editusuario_materno").val(res.usuario_materno),
                $("#editusuario_usuario").val(res.usuario_usuario),
                $("#editusuario_password").val(res.usuario_password),
                $("#editusuario_nivel").val(res.usuario_nivel),
                cboids.forEach((id) => {
                    $("#editusuario_almacen").val(cboids);
                    //$("#editusuario_almacen option[value='" + id + "']").prop("selected", true);
                })
        });

    }

    var cambiarestadoatributo = function (id_formaentrega, formaentrega_estado) {

        $.ajax(
            {
                method: 'POST',
                url: "usuarios/cambiarestado?usuario_estado=" + formaentrega_estado + "&usuario_id=" + id_formaentrega,
            }).done(function () {

            $("#tableusuarios").bootstrapTable('refresh', {
                url: 'usuarios/lista',
                locale: 'es-PE'
            });

        });

    }
</script>