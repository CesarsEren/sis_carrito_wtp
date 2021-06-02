<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/bootstrap-table.min.js"></script>


<div class="card w-100">
	<div class="card-body">
		<div class="card-title">
			<h2>Atributos</h2>
			<div class="col-md-3">
				<select class="custom-select" id="cboalmacenes">

				</select>
			</div>
			<button type="button" class="float-right mb-2 btn btn-primary" data-toggle="modal" data-target="#nuevoatributo">Nuevo Atributo</button>
		</div>

		<table id="tableatributos" class="table table-hover" data-toggle="table" data-pagination="true" data-height="600" data-data-type="text"
			data-response-handler="responseHandler">
			<thead class="thead-dark">
				<tr>
					<th data-field="atributo_id">#</th>
					<th data-field="atributo_nombre">Nombre</th>
					<th data-field="atributo_estado" data-formatter="format_estado">¿Activo?</th>
					<th data-formatter="format_acciones">Acciones</th>
				</tr>
			</thead>

		</table>

	</div>
</div>

<div class="modal" id="nuevoatributo" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Nuevo Atributo</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<form>
				
				<div class="form-group">
						<label for="atributo_nombre">Nombre</label>
						<select id="atributo_almacen_id" class="form-control custom-select" ></select>						
						<small id="atributo_nombreerror" class="form-text text-muted text-danger"></small>
					</div>
					
				
					<div class="form-group">
						<label for="atributo_nombre">Nombre</label>
						<input type="email" class="form-control" id="atributo_nombre" aria-describedby="emailHelp" placeholder="Ingresar nombre">
						<small id="atributo_nombreerror" class="form-text text-muted text-danger"></small>
					</div> 
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn_registrar">Guardar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal" id="editatributo" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Nuevo Atributo</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<form>
				
				<div class="form-group">
						<label for="editatributo_almacen_id">Nombre</label>
						<select id="editatributo_almacen_id" class="form-control custom-select" ></select>						
						<small id="editatributo_almacen_iderror" class="form-text text-muted text-danger"></small>
					</div>
					 
					<div class="form-group">
						<label for="editatributo_nombre">Nombre</label>
						<input type="text" class="form-control" id="editatributo_nombre"  placeholder="Ingresar nombre">
						<small id="editatributo_nombreerror" class="form-text text-muted text-danger"></small>
					</div> 
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn_actualizar">Editar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<script>
 
$("#btn_actualizar").on("click",function(){
	var pojo={atributo_id:edit_atributo_id,atributo_almacen_id:$("#editatributo_almacen_id").val(),atributo_nombre:$("#editatributo_nombre").val()}	
	almacen_id=pojo.atributo_almacen_id;
    $.ajax({
        method: 'POST',
        url: "atributos/actualizar",
        contentType: "application/json",
		data: JSON.stringify(pojo),
        beforeSend: function () {
        	/*$("#item"+ plan_id_o_iterador+" small").css("display", "none");
            $("#altermensaje" + plan_id_o_iterador).css("display", "none");
            $(".errorhelp").css("display", "none");*/
        },
        success: function (res) {
        	console.log(res)
        	$("#editatributo").modal("hide");
        	$("#tableatributos").bootstrapTable('refresh', {
    			url : 'atributos/lista?almacen_id=' + almacen_id,
    			locale : 'es-PE'
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

$("#btn_registrar").on("click",function(){
	var pojo={
		atributo_almacen_id:$("#atributo_almacen_id").val(),
		atributo_nombre:$("#atributo_nombre").val()
	}
	almacen_id=pojo.atributo_almacen_id;
    $.ajax({
        method: 'POST',
        url: "atributos/registrar",
        contentType: "application/json",
		data: JSON.stringify(pojo),
        beforeSend: function () {
        	/*$("#item"+ plan_id_o_iterador+" small").css("display", "none");
            $("#altermensaje" + plan_id_o_iterador).css("display", "none");
            $(".errorhelp").css("display", "none");*/
        },
        success: function (res) {
        	console.log(res)
        	$("#nuevoatributo").modal("hide");
        	$("#tableatributos").bootstrapTable('refresh', {
    			url : 'atributos/lista?almacen_id=' + almacen_id,
    			locale : 'es-PE'
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

	var almacen_id;
	$.ajax({
		method : 'GET',
		url : "atributos/almacenes/combo",
	}).done(function(res) {
		var html = "";
		for (var x = 0; x < res.length; x++) {
			if (x == 0) {
				html += "<option selected value='"+res[x].id+"'>"
				html += res[x].text
				html += "</option>"
			} else {
				html += "<option value='"+res[x].id+"'>"
				html += res[x].text
				html += "</option>"
			}
		}
		$("#cboalmacenes").html(html);
		$("#atributo_almacen_id").html(html);
		$("#editatributo_almacen_id").html(html);
		almacen_id = $("#cboalmacenes").val();

		$("#tableatributos").bootstrapTable('refresh', {
			url : 'atributos/lista?almacen_id=' + almacen_id,
			locale : 'es-PE'
		});
	});
	$("#cboalmacenes").on("change", function() {
		almacen_id = $("#cboalmacenes").val();

		$("#tableatributos").bootstrapTable('refresh', {
			url : 'atributos/lista?almacen_id=' + almacen_id,
			locale : 'es-PE'
		});
	})
	//$("#cboalmacenes")
	var responseHandler = function(res) {
		return JSON.parse(res)
	}

	var format_estado = function(atributo_estado) {
		return atributo_estado == 1 ? "Activado" : "Desactivado";
	}

	function format_acciones(row, value, x) {
		var rpta = '<a data-toggle="tooltip" data-placement="top" onclick="cambiarestadoatributo('
				+ value.atributo_id
				+ ','
				+ value.atributo_estado
				+ ')" title="'
				+ (value.atributo_estado == 1 ? 'Desactivar' : 'Activar')
				+ ' Almacén" class="m-1 btn btn-'
				+ (value.atributo_estado == 1 ? 'danger' : 'success')
				+ '" ><i class="text-white fas fa-power-off"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" onclick="abrimodalEdit('
				+ value.atributo_id
				+ ')" title="Editar Almacén" class="btn btn-info m-1" ><i class="text-white fas fa-edit"></i></a>';
		/*var rpta = '<a data-toggle="tooltip" data-placement="top" title="Activar Plan" class="m-1 btn btn-'+(value.activo == 1 ? 'danger' : 'success')+'" onclick="activar('+value.plan_id+','+value.activo+')" ><i class="text-white fas fa-power-off"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" title="Activar Promoción" class="m-1 btn btn-'+(value.estado_descuento == 1 ? 'danger' : 'success')+'" onclick="activarpromo('+value.plan_id+','+value.estado_descuento+')" ><i class="text-white fas fa-comment-dollar"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" title="Editar" class="m-1 btn btn-info" onclick="editarmodal('+value.plan_id+')" ><i class="text-white fas fa-edit"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" title="Detalles" class="m-1 btn btn-info" onclick="opendetalle('+value.plan_id+',\''+value.nombre_plan+'\')" ><i class="text-white fas fa-list"></i></a>';*/
		return rpta;
	}
	
	var edit_atributo_id;
	var abrimodalEdit = function(atributo_id){
		console.log(atributo_id)
		$.ajax({method : 'GET', url : "atributos/lista/"+atributo_id,}).done(function(res) {
			console.log(res.atributo_nombre)
			edit_atributo_id=res.atributo_id;
			$("#editatributo_almacen_id").val(res.atributo_almacen_id),
			$("#editatributo_nombre").val(res.atributo_nombre)	
		}); 
		$("#editatributo").modal("show");	
	}
	
	var cambiarestadoatributo = function(atributo_id, atributo_estado) {

		$.ajax(
				{
					method : 'POST',
					url : "atributos/cambiarestado?atributo_estado="
							+ atributo_estado + "&atributo_id=" + atributo_id,
				}).done(function() {
			$("#tableatributos").bootstrapTable('refresh', {
				url : 'atributos/lista?almacen_id=' + almacen_id,
				locale : 'es-PE'
			});
		});

	}
</script>