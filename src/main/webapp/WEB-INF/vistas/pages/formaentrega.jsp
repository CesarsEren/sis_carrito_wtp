<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/bootstrap-table.min.js"></script>


<div class="card w-100">
	<div class="card-body">
		<div class="card-title">
			<h2>Formas de Entrega</h2>

			<button type="button" class="float-right mb-2 btn btn-primary" data-toggle="modal" data-target="#nuevoformaentrega">Nueva Forma de Entrega</button>
		</div>

		<table id="tableformaentrega" class="table table-hover" data-toggle="table" data-pagination="true" data-height="600" data-data-type="text"
			data-response-handler="responseHandler" data-url="formadeentrega/lista">
			<thead class="thead-dark">
				<tr>
					<th data-field="id_formaentrega">#</th>
					<th data-field="nombre_formaentrega">Nombre</th>
					<th data-field="precio_formaentrega">Precio</th>
					<th data-field="formaentrega_estado" data-formatter="format_estado">¿Activo?</th>
					<th data-formatter="format_acciones">Acciones</th>
				</tr>
			</thead>

		</table>

	</div>
</div>

<div class="modal" id="nuevoformaentrega" tabindex="-1" role="dialog">
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
						<label for="nombre_formaentrega">Detalle</label>
						<input type="text" class="form-control" id="nombre_formaentrega" aria-describedby="emailHelp" placeholder="Detalle">	
					</div>
					
					<div class="form-group">
						<label for="precio_formaentrega">Precio Predeterminado</label>
						<input type="number" class="form-control" id="precio_formaentrega" placeholder="Precio predeterminado">
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



<div class="modal" id="editformaentrega" tabindex="-1" role="dialog">
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
						<label for="editnombre_formaentrega">Detalle</label>
						<input type="text" class="form-control" id="editnombre_formaentrega" aria-describedby="emailHelp" placeholder="Detalle">	
					</div>
					
					<div class="form-group">
						<label for="editprecio_formaentrega">Precio Predeterminado</label>
						<input type="number" class="form-control" id="editprecio_formaentrega" placeholder="Precio predeterminado">
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
var Gid_formaentrega=0;
$("#btn_actualizar").on("click",function(){
	
	var pojo = {
			id_formaentrega:Gid_formaentrega,
			nombre_formaentrega:$("#editnombre_formaentrega").val(),
			precio_formaentrega:$("#editprecio_formaentrega").val()
	}
	
	
    $.ajax({
        method: 'POST',
        url: "formadeentrega/actualizar",
        contentType: "application/json",
		data: JSON.stringify(pojo),
        beforeSend: function () { 
        },
        success: function (res) {
        	console.log(res)
        	
        	$("#editnombre_formaentrega").val("");        	
			$("#editprecio_formaentrega").val("");
			
        	$("#editformaentrega").modal("hide");
        	$("#tableformaentrega").bootstrapTable('refresh', {
    			url :  'formadeentrega/lista',
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
	
$("#btn_registrar").on("click",function(){
	
	var pojo = {
			nombre_formaentrega:$("#nombre_formaentrega").val(),
			precio_formaentrega:$("#precio_formaentrega").val()
	}
	
    $.ajax({
        method: 'POST',
        url:  "formadeentrega/registrar",
        contentType: "application/json",
		data: JSON.stringify(pojo),
        beforeSend: function () {
        	
        },
        success: function (res) {
        	console.log(res)
        	
        	$("#nombre_formaentrega").val("");        	
			$("#precio_formaentrega").val("");
			
        	$("#nuevoformaentrega").modal("hide");
        	$("#tableformaentrega").bootstrapTable('refresh', {
    			url :  'formadeentrega/lista',
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

	var responseHandler = function(res) {
		return JSON.parse(res)
	}

	var format_estado = function(formaentrega_estado) {
		return formaentrega_estado == 1 ? "Activado" : "Desactivado";
	}

	function format_acciones(row, value, x) {
		var rpta = '<a data-toggle="tooltip" data-placement="top" onclick="cambiarestadoatributo('
				+ value.id_formaentrega
				+ ','
				+ value.formaentrega_estado
				+ ')" title="'
				+ (value.formaentrega_estado == 1 ? 'Desactivar' : 'Activar')
				+ ' Almacén" class="m-1 btn btn-'
				+ (value.formaentrega_estado == 1 ? 'danger' : 'success')
				+ '" ><i class="text-white fas fa-power-off"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" onclick="abrimodalEdit('
				+ value.id_formaentrega
				+ ')" title="Editar Almacén" class="btn btn-info m-1" ><i class="text-white fas fa-edit"></i></a>';
		/*var rpta = '<a data-toggle="tooltip" data-placement="top" title="Activar Plan" class="m-1 btn btn-'+(value.activo == 1 ? 'danger' : 'success')+'" onclick="activar('+value.plan_id+','+value.activo+')" ><i class="text-white fas fa-power-off"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" title="Activar Promoción" class="m-1 btn btn-'+(value.estado_descuento == 1 ? 'danger' : 'success')+'" onclick="activarpromo('+value.plan_id+','+value.estado_descuento+')" ><i class="text-white fas fa-comment-dollar"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" title="Editar" class="m-1 btn btn-info" onclick="editarmodal('+value.plan_id+')" ><i class="text-white fas fa-edit"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" title="Detalles" class="m-1 btn btn-info" onclick="opendetalle('+value.plan_id+',\''+value.nombre_plan+'\')" ><i class="text-white fas fa-list"></i></a>';*/
		return rpta;
	}
	
	var abrimodalEdit = function(id_formaentrega){
		
		Gid_formaentrega=id_formaentrega;
		$("#editformaentrega").modal("show");
		
		$.ajax({method : 'GET', url : "formadeentrega/lista/"+id_formaentrega,}).done(function(res) {
		  
			$("#editnombre_formaentrega").val(res.nombre_formaentrega),
			$("#editprecio_formaentrega").val(res.precio_formaentrega)	
		});
		
	}
	
	var cambiarestadoatributo = function(id_formaentrega, formaentrega_estado) {
		
		
		/*public Integer id_formaentrega;
		public String nombre_formaentrega;
		public Double precio_formaentrega;
		public Boolean formaentrega_estado;*/
		$.ajax(
				{
					method : 'POST',
					url : "formadeentrega/cambiarestado?formaentrega_estado="
							+ formaentrega_estado + "&id_formaentrega="
							+ id_formaentrega,
				}).done(function() {
			$("#tableformaentrega").bootstrapTable('refresh', {
				url :  'formadeentrega/lista',
				locale : 'es-PE'
			});
		});

	}
</script>