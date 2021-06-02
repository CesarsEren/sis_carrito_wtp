<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/bootstrap-table.min.js"></script>


<div class="card w-100">
	<div class="card-body">
		<div class="card-title">
			<h2>Complementos</h2>
			<div class="col-md-3">
				<select class="custom-select" id="cboalmacenes">

				</select>
			</div>
			<button type="button" class="float-right mb-2 btn btn-primary" data-toggle="modal" data-target="#nuevocomplemento">Nuevo Complemento</button>
		</div>

		<table id="tablecomplementos" class="table table-hover" data-toggle="table" data-pagination="true" data-height="600" data-data-type="text"
			data-response-handler="responseHandler">
			<thead class="thead-dark">
				<tr>
					<th data-field="complemento_id">#</th>
					<th data-field="complemento_nombre">Nombre</th>
					<th data-field="complemento_precio" data-formatter="format_precio">Precio</th>
					<th data-field="complemento_estado" data-formatter="format_estado">¿Activo?</th>
					<th data-formatter="format_acciones">Acciones</th>
				</tr>
			</thead>

		</table>

	</div>
</div>

<div class="modal" id="nuevocomplemento" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Nuevo Complemento</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<!-- complemento_almacen_id|complemento_nombre|complemento_precio-->
				<form>
					<div class="form-group">
						<label for="complemento_almacen_id">Almacen</label>
						<select id="complemento_almacen_id" class="form-control select-custom"></select>
					</div>
					<div class="form-group">
						<label for="complemento_nombre">Nombre</label> 
						<input type="text" class="form-control" id="complemento_nombre"
							placeholder="ingrese nombre">
					</div>
					 <div class="form-group">
						<label for="complemento_precio">Precio</label> 
						<input type="number" class="form-control" id="complemento_precio" placeholder="ingrese precio">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn_registrar">Registrar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal" id="actualizarcomplemento" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Nuevo Complemento</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<!-- complemento_almacen_id|complemento_nombre|complemento_precio-->
				<form>
					<div class="form-group">
						<label for="editcomplemento_almacen_id">Almacen</label>
						<select id="editcomplemento_almacen_id" class="form-control select-custom"></select>
					</div>
					<div class="form-group">
						<label for="editcomplemento_nombre">Nombre</label> 
						<input type="text" class="form-control" id="editcomplemento_nombre"
							placeholder="ingrese nombre">
					</div>
					 <div class="form-group">
						<label for="editcomplemento_precio">Precio</label> 
						<input type="number" class="form-control" id="editcomplemento_precio" placeholder="ingrese precio">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btn_actualizar">Actualizar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<script>

$("#btn_registrar").on("click",function(){
	var pojo = {
			complemento_almacen_id:$("#complemento_almacen_id").val(),
			complemento_nombre:$("#complemento_nombre").val(),
			complemento_precio:parseFloat($("#complemento_precio").val())
	}
	almacen_id=pojo.complemento_almacen_id;
    $.ajax({
        method: 'POST',
        url: "complementos/registrar",
        contentType: "application/json",
		data: JSON.stringify(pojo),
        beforeSend: function () { 
        },
        success: function (res) {
        	console.log(res)
        	$("#nuevocomplemento").modal("hide");
        	$("#cboalmacenes").val(pojo.complemento_almacen_id);
        	$("#tablecomplementos").bootstrapTable('refresh', {
    			url : 'complementos/lista?almacen_id=' + almacen_id,
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
	
});

	var almacen_id;
	$.ajax({
		method : 'GET',
		url : "complementos/almacenes/combo",
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
		$("#complemento_almacen_id").html(html);
		$("#editcomplemento_almacen_id").html(html);
		almacen_id = $("#cboalmacenes").val();

		$("#tablecomplementos").bootstrapTable('refresh', {
			url : 'complementos/lista?almacen_id=' + almacen_id,
			locale : 'es-PE'
		});
	});
	
	$("#cboalmacenes").on("change", function() {
		almacen_id = $("#cboalmacenes").val();

		$("#tablecomplementos").bootstrapTable('refresh', {
			url : 'complementos/lista?almacen_id=' + almacen_id,
			locale : 'es-PE'
		});
	})
	//$("#cboalmacenes")
	var responseHandler = function(res) {
		return JSON.parse(res)
	}

	var format_precio = function(precio) {
		return "S/ " + precio;
	}
	var format_estado = function(complemento_estado) {
		return complemento_estado == 1 ? "Activado" : "Desactivado";
	}

	function format_acciones(row, value, x) {
		var rpta = '<a data-toggle="tooltip" data-placement="top" onclick="cambiarestadocomplemento('
				+ value.complemento_id
				+ ','
				+ value.complemento_estado
				+ ')" title="'
				+ (value.complemento_estado == 1 ? 'Desactivar' : 'Activar')
				+ ' Complemento" class="m-1 btn btn-'
				+ (value.complemento_estado == 1 ? 'danger' : 'success')
				+ '" ><i class="text-white fas fa-power-off"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" onclick="abrimodalEdit('
				+ value.complemento_id
				+ ')" title="Editar Almacén" class="btn btn-info m-1" ><i class="text-white fas fa-edit"></i></a>';
		 return rpta;
	}
	var cambiarestadocomplemento = function(complemento_id, complemento_estado) {

		$.ajax(
				{
					method : 'POST',
					url : "complementos/cambiarestado?complemento_estado="
							+ complemento_estado + "&complemento_id="
							+ complemento_id,
				}).done(function() {
			$("#tablecomplementos").bootstrapTable('refresh', {
				url : 'complementos/lista?almacen_id=' + almacen_id,
				locale : 'es-PE'
			});
		});

	}
	var id_complemento;
	var abrimodalEdit = function(complemento_id){
		id_complemento=complemento_id;
		$("#actualizarcomplemento").modal("show")
		$.ajax({
			method : 'GET',
			url : "complementos/lista/"+complemento_id,
		}).done(function(res) {
			$("#editcomplemento_almacen_id").val(res.complemento_almacen_id);
			$("#editcomplemento_nombre").val(res.complemento_nombre);
			$("#editcomplemento_precio").val(res.complemento_precio);
		});
		
	}
	
	$("#btn_actualizar").on("click",function(){
		console.log(id_complemento)
		var pojo = {
				complemento_id:id_complemento,
				complemento_almacen_id:$("#editcomplemento_almacen_id").val(),
				complemento_nombre:$("#editcomplemento_nombre").val(),
				complemento_precio:parseFloat($("#editcomplemento_precio").val())
		}
		almacen_id=pojo.complemento_almacen_id;
	    $.ajax({
	        method: 'POST',
	        url: "complementos/actualizar",
	        contentType: "application/json",
			data: JSON.stringify(pojo),
	        beforeSend: function () { 
	        },
	        success: function (res) {
	        	//console.log(res)
	        	$("#actualizarcomplemento").modal("hide");
	        	
	        	$("#cboalmacenes").val(pojo.complemento_almacen_id);
	        	
	        	$("#tablecomplementos").bootstrapTable('refresh', {
	    			url : 'complementos/lista?almacen_id=' + almacen_id,
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
		
	});
	
</script>