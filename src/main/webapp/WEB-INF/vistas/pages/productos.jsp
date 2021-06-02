<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/bootstrap-table.min.js"></script>


<div class="card w-100">
	<div class="card-body">
		<div class="card-title">
			<h2>Productos</h2>
			<div class="col-md-3">
				<select class="custom-select" id="cboalmacenes">

				</select>
			</div>
			<button type="button" class="float-right mb-2 btn btn-primary" data-toggle="modal" data-target="#nuevoproducto">Nuevo Producto</button>
		</div>

		<table id="tableproductos" class="table table-hover" data-toggle="table" data-pagination="true" data-height="600" data-data-type="text"
			data-response-handler="responseHandler">
			<thead class="thead-dark">
				<tr>
					<th data-field="id_producto">#</th>
					<th data-field="imagen_producto" data-formatter="format_imagen">Imagen</th>
					<th data-field="nombre_producto">Nombre</th>
					<th data-field="precio_producto">Precio</th>
					<th data-field="producto_estado" data-formatter="format_estado">¿Activo?</th>
					<th data-formatter="format_acciones">Acciones</th>
				</tr>
			</thead>

		</table>

	</div>
</div>

<div class="modal" id="nuevoproducto" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Registro de Producto</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" action="productos/registrar" enctype="multipart/form-data">
					<div class="form-group ">
						<label for="almacen_id">Almacén</label> <select id="almacen_id" class="form-control">

						</select>
					</div>
					<div class="form-group">
						<label for="nombre_producto">Nombre</label> <input class="form-control" id="nombre_producto" name="nombre_producto">
					</div>

					<div class="form-group">
						<label for="precio_producto">Precio</label> <input type="number" class="form-control" id="precio_producto" name="precio_producto">
					</div>

					<div class="form-group">
						<label for="producto">Imagen de Producto</label> <input type="file" class="form-control-file" id="imagen_producto">
					</div>
					<div>
						<img src="" id="producto_imagen_prv" width="100%" height="350px">
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" id="btn_registrar">Guardar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal" id="actualizarproducto" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Registro de Producto</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" action="productos/registrar" enctype="multipart/form-data">
					<div class="form-group ">
						<label for="editalmacen_id">Almacén</label> <select id="editalmacen_id" class="form-control"></select>
					</div>
					<div class="form-group">
						<label for="nombre_producto">Nombre</label> <input class="form-control" id="editnombre_producto" name="nombre_producto">
					</div>

					<div class="form-group">
						<label for="precio_producto">Precio</label> <input type="number" class="form-control" id="editprecio_producto" name="editprecio_producto">
					</div>

					<div class="form-group">
						<label for="producto">Example file input</label> <input type="file" class="form-control-file" id="editimagen_producto">
					</div>

					<div>
						<img src="" id="editproducto_imagen_prv" width="100%" height="350px">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" id="btn_actualizar">Editar</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>


<script>
var format_imagen = function(img) {
	return "<img src='"+img+"' height=100px width=100px/>";
}

var imagen_foto="";

var ImagenProducto = document.getElementById("imagen_producto"); 
var imageElement = document.getElementById("producto_imagen_prv");

  ImagenProducto.addEventListener("change", (e) => { 
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
  
  
  var editImagenProducto = document.getElementById("editimagen_producto");
  var editimageElement = document.getElementById("editproducto_imagen_prv");
  var editimagen_foto="";
  editImagenProducto.addEventListener("change", (e) => { 
	    var file = e.target.files[0]; 
	    var reader = new FileReader();
	    reader.onloadend = () => { 
	      var base64String = reader.result
	        .replace("data:", "")
	        .replace(/^.+,/, ""); 
	      
	      console.log(base64String); 
	      
	      editimagen_foto = base64String; 
	      editimageElement.src = URL.createObjectURL(file);
	    };
	    reader.readAsDataURL(file);
	  });

  

  
$("#btn_registrar").on("click",function(){
	//almacen_id|nombre_producto|precio_producto|imagen_producto
	var pojo = {
			almacen_id:$("#almacen_id").val(),
			nombre_producto:$("#nombre_producto").val(),
			precio_producto:$("#precio_producto").val(),
			imagen_producto:"data:image/;base64,"+imagen_foto	
	};
	
	 $.ajax({
         method: 'POST',
         url: "productos/registrar",
         contentType: "application/json",
 		data: JSON.stringify(pojo),
         beforeSend: function () {
         },
         success: function (res) {
             
             $("#nuevoproducto").modal("hide");
             $("#cboalmacenes").val(almacen_id);
             $("#tableproductos").bootstrapTable('refresh', {
     			url : 'productos/lista?almacen_id=' + almacen_id,
     			locale : 'es-PE'
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
})



$("#btn_actualizar").on("click",function(){
	//almacen_id|nombre_producto|precio_producto|imagen_producto
	var pojo = {
			id_producto:act_id_producto,
			almacen_id:$("#editalmacen_id").val(),
			nombre_producto:$("#editnombre_producto").val(),
			precio_producto:$("#editprecio_producto").val(),
			imagen_producto:editimagen_foto==""?"":"data:image/;base64,"+editimagen_foto	
	};
	
	 $.ajax({
         method: 'POST',
         url: "productos/actualizar",
         contentType: "application/json",
 		data: JSON.stringify(pojo),
         beforeSend: function () {
         },
         success: function (res) {
             
             $("#actualizarproducto").modal("hide");
             $("#cboalmacenes").val(almacen_id);
             $("#tableproductos").bootstrapTable('refresh', {
     			url : 'productos/lista?almacen_id=' + almacen_id,
     			locale : 'es-PE'
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
})


	var almacen_id;
	$.ajax({
		method : 'GET',
		url : "productos/almacenes/combo",
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
		$("#almacen_id").html(html);
		$("#editalmacen_id").html(html);
		
		almacen_id = $("#cboalmacenes").val();

		$("#tableproductos").bootstrapTable('refresh', {
			url : 'productos/lista?almacen_id=' + almacen_id,
			locale : 'es-PE'
		});
	});
	$("#cboalmacenes").on("change", function() {
		almacen_id = $("#cboalmacenes").val();

		$("#tableproductos").bootstrapTable('refresh', {
			url : 'productos/lista?almacen_id=' + almacen_id,
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
		var rpta = '<a data-toggle="tooltip" data-placement="top" onclick="cambiarestadoproducto('
				+ value.id_producto
				+ ','
				+ value.producto_estado
				+ ')" title="'
				+ (value.producto_estado == 1 ? 'Desactivar' : 'Activar')
				+ ' Producto" class="m-1 btn btn-'
				+ (value.producto_estado == 1 ? 'danger' : 'success')
				+ '" ><i class="text-white fas fa-power-off"></i></a>';
		rpta += '<a data-toggle="tooltip" data-placement="top" onclick="abrimodalEdit('
				+ value.id_producto
				+ ')" title="Editar Almacén" class="btn btn-info m-1" ><i class="text-white fas fa-edit"></i></a>';
				
		rpta += '<a data-toggle="tooltip" data-placement="top" onclick="OpenModelComplementos('+ value.id_producto+ ')" title="Añadir Complementos" class="btn btn-warning m-1" ><i class="text-white fas fa-list-ol"></i></a>';
					
		rpta += '<a data-toggle="tooltip" data-placement="top" onclick="OpenModelAtributos('
						+ value.id_producto+ ')" title="Añadir Atributos" class="btn btn-info m-1" ><i class="text-white fas fa-list"></i></a>';
		return rpta;
	}
	

	var act_id_producto;
	
	var abrimodalEdit = function(id_producto){
		act_id_producto = id_producto;
		$("#actualizarproducto").modal("show");
		
		$.ajax({
			method : 'GET',
			url : "productos/lista/"+id_producto,
		}).done(function(res) { 
			
			$("#editalmacen_id").val(res.almacen_id),
			$("#editnombre_producto").val(res.nombre_producto),
			$("#editprecio_producto").val(res.precio_producto),
			$("#editproducto_imagen_prv").attr("src",res.imagen_producto);
			
		});
	}
	
	
	var cambiarestadoproducto = function(id_producto, producto_estado) {

		$.ajax(
				{
					method : 'POST',
					url : "productos/cambiarestado?producto_estado="
							+ producto_estado + "&producto_id=" + id_producto,
				}).done(function() {
			$("#tableproductos").bootstrapTable('refresh', {
				url : 'productos/lista?almacen_id=' + almacen_id,
				locale : 'es-PE'
			});
		});

	}
	
	
	var compaux = 10000-1;
	var attrpaux = 10000-1;
	
	var Gproducto_id;
	
	var itemAtributo= function(obj){
		var id = obj.detalle_atributo_id==null?++attrpaux:obj.detalle_atributo_id;
		return "<div id='atbox"+id+"'>"+
		(obj.detalle_atributo_id==null?"<small id='mensaje"+id+"' class='text-info'>Sin Registrar</small>":"<small id='mensaje"+id+"' class='text-success'>Registrado</small>")+
		"<input id='atnombre"+id+"' class='form-control mt-1' type='text' value='"+obj.atributo_nombre+"' disabled/>"+
		"<input id='atprecio"+id+"' class='form-control mt-1' type='number' value='"+obj.atributo_precio+"' placeholder='ingrese precio'>"+
		"<div class='text-right mt-1'>"+
		(obj.detalle_atributo_id==null?
		"<a href='javascript:void(0)' class='btn btn-sm btn-success' onclick='guardarDetalleAtributo("+id+","+obj.atributo_id+")'><i class='fas fa-save'></i></a>":
		"<a href='javascript:void(0)' class='btn btn-sm btn-danger' onclick='deleteDetalleAtributo("+id+","+obj.atributo_id+")'><i class='fas fa-trash'></i></a>"+
		"<a href='javascript:void(0)' class='btn btn-sm btn-success' onclick='actualizarDetalleAtributo("+id+","+obj.atributo_id+")'><i class='fas fa-save'></i></a>")+
		"</div>"+
		""+
		"<hr>"+
		"</div>";
	}
	
	var guardarDetalleAtributo = function(id,atributo_id){ 
		  var pojo = {
			producto_id:Gproducto_id,
			detalle_atributo_id: id,
			atributo_id:atributo_id,
			atributo_precio:$("#atprecio"+id).val()
		} 
	  
		 $.ajax({
	         method: 'POST',
	         url: "productos/atributos/registrar",
	         contentType: "application/json",
	 		data: JSON.stringify(pojo),
	         beforeSend: function () {
	         },
	         success: function (res) {
	        	 res.atributo_nombre=$("#atnombre"+id).val();
	        	 res.atributo_precio = res.atributo_precio;
	        	 $("#atbox"+id).replaceWith(itemAtributo(res));
	         },
	         error: function (err) { 
	        	 
	         }
	     });
		
	}
	
	var actualizarDetalleAtributo = function(id){
	}
	
	var deleteDetalleAtributo = function(id,atributo_id){ 
		
		var pojo = {
				detalle_atributo_id: null, 
				atributo_id: atributo_id,
				atributo_precio: $("#atprecio"+id).val(),
				atributo_nombre: $("#atnombre"+id).val(),
				detalle_atributo_precio: $("#atprecio"+id).val(),
				estado: "default"
				}
		
		 $.ajax({
	         method: 'DELETE',
	         url: "productos/atributos/delete/"+id,
	         //contentType: "application/json",
	 		//data: JSON.stringify(pojo),
	         beforeSend: function () {
	         },
	         success: function (res) {
	        	  $("#atbox"+id).replaceWith(itemAtributo(pojo));
	         },
	         error: function (err) {  
	         }
	     });
		 
	}
	
	
	var itemComplemento= function(obj){
		var id = obj.detalle_complemento_id==null?++compaux:obj.detalle_complemento_id;
		return "<div id='box"+id+"'>"+
		(obj.detalle_complemento_id==null?"<small id='mensaje"+id+"' class='text-info'>Sin Registrar</small>":"<small id='mensaje"+id+"' class='text-success'>Registrado</small>")+
		"<input id='nombre"+id+"' class='form-control mt-1' type='text' value='"+obj.complemento_nombre+"' disabled/>"+
		"<input id='precio"+id+"' class='form-control mt-1' type='number' value='"+obj.complemento_precio+"' placeholder='ingrese precio'>"+
		"<div class='text-right mt-1'>"+
		(obj.detalle_complemento_id==null?
		"<a href='javascript:void(0)' class='btn btn-sm btn-success' onclick='guardarDetalle("+id+","+obj.complemento_id+")'><i class='fas fa-save'></i></a>":
		"<a href='javascript:void(0)' class='btn btn-sm btn-danger' onclick='deleteDetalle("+id+","+obj.complemento_id+")'><i class='fas fa-trash'></i></a>"+
		"<a href='javascript:void(0)' class='btn btn-sm btn-success' onclick='actualizarDetalle("+id+","+obj.complemento_id+")'><i class='fas fa-save'></i></a>")+
		"</div>"+
		""+
		"<hr>"+
		"</div>";
	}
	var guardarDetalle = function(id,complemento_id){ 
		  var pojo = {
			producto_id:Gproducto_id,
			detalle_complemento_id: id,
			complemento_id:complemento_id,
			detalle_complemento_precio:$("#precio"+id).val()
		} 
	  
		 $.ajax({
	         method: 'POST',
	         url: "productos/complementos/registrar",
	         contentType: "application/json",
	 		data: JSON.stringify(pojo),
	         beforeSend: function () {
	         },
	         success: function (res) {
	        	 res.complemento_nombre=$("#nombre"+id).val();
	        	 res.complemento_precio = res.detalle_complemento_precio;
	        	 $("#box"+id).replaceWith(itemComplemento(res));
	         },
	         error: function (err) { 
	        	 
	         }
	     });
		
	}
	
	var actualizarDetalle = function(id){
	}
	
	var deleteDetalle = function(id,complemento_id){ 
		
		var pojo = {
				detalle_complemento_id: null, 
				complemento_id: complemento_id,
				complemento_precio: $("#precio"+id).val(),
				complemento_nombre: $("#nombre"+id).val(),
				detalle_complemento_precio: $("#precio"+id).val(),
				estado: "default"
				}
		
		 $.ajax({
	         method: 'DELETE',
	         url: "productos/complementos/delete/"+id,
	         //contentType: "application/json",
	 		//data: JSON.stringify(pojo),
	         beforeSend: function () {
	         },
	         success: function (res) {
	        	  $("#box"+id).replaceWith(itemComplemento(pojo));
	         },
	         error: function (err) { 
	        	 
	         }
	     });
		 
	}
	
	var OpenModelComplementos = function(producto_id){
		Gproducto_id=producto_id;
		$("#modalcomplementos").modal("show");
		
		$.ajax({
			method : 'GET',
			url : "productos/lista/complementos/"+almacen_id+"/"+producto_id,
		}).done(function(res) {  
			var html=""; 
			res.forEach((obj)=>{
				html += itemComplemento(obj);
			})
			$("#seccomplementos").html(html);
		});
		 
	}
	
	var html_atrr="";
	var OpenModelAtributos= function(producto_id){
		$("#modalatributos").modal("show");
		Gproducto_id=producto_id;		
		$.ajax({
			method : 'GET',
			url : "productos/lista/atributos/"+almacen_id+"/"+producto_id,
		}).done(function(res) {  
			var html=""; 
			res.forEach((obj)=>{
				html += itemAtributo(obj);
			})
			$("#secattributos").html(html);
		});
		
		
	}
	
	
</script>


<div class="modal" id="modalcomplementos" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					Añadir Complementos a
					<p id="modalcomp"></p>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<section id="seccomplementos"></section>
			</div>

		</div>
	</div>
</div>



<div class="modal" id="modalatributos" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					Añadir atributos a
					<p id="modalattr"></p>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<section id="secattributos"></section>
			</div>

		</div>
	</div>
</div>