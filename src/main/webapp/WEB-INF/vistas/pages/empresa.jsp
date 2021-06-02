<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="js/yellow-text.min.js"></script>

<!--link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/yellow-text-blue.css"-->
<link rel="stylesheet" href="css/yellow-text-blue.css">

<div class="card w-100">
	<div class="card-body">
		<div class="card-title">
			<h2>Footer Page</h2>
		</div>
		<div class="row">
		<!--form id="js-editor-form"-->
		<form action="empresa/registrar" method="POST" enctype='multipart/form-data' id="js-editor-form">
			<textarea class="form-control" name="mensajefooter" id="js-textarea">${empresa_footer}</textarea>
			</form>
		</div>
		<div class="row">
			<button type="submit" class="float-right mt-2 btn btn-primary" form="js-editor-form" id="btn_registrar">Guardar</button>
		</div>
	</div>
 
</div>

<script>
	$(function() {
	    $("#js-textarea").YellowText({
	        
	      });
	});
/*
	$("#btn_registrar").on("click", function() {

		//nsole.log($("#form").serialize())
		
	    $.ajax({
	        method: 'POST',
	        url: "empresa/registrar",
	        contentType: "application/json",
			data: $('#js-textarea').text(),	       
	        success: function (res) {
	        	 console.log(res)
	        },
	    }); 
	    
	});*/
	/*
	 $.ajax({method : 'GET', url : "usuarios/almacenes/combo"}).done(function(res) {

	 var html = "";
	 res.forEach(function(obj){
	 html+= '<option id="'+obj.id+'">'+obj.text+'</option>';
	 })
	 $("#usuario_almacen").html(html);
	 $("#editusuario_almacen").html(html);

	 console.log()
	 });
	 */
</script>


