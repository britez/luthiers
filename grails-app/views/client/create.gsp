<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:javascript src="jquery.validate.min.js"/>
	</head>
	<body>
		<div class="row">
			<div class="page-header">
	        	<h1>Crear Cliente</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
  			<div class="col-md-8">
				<g:form action="save" autocomplete="off" class="validable">
				  	<div class="form-group">
				    	<label for="name">Nombre</label>
				    	<input type="text" class="form-control" id="name" name="name" placeholder="Nombre del cliente ..." required minlength="5">
				    	<div class="hide" id="name-error"></div>
				  	</div>
				  	<div class="form-group">
				    	<label for="lastName">Apellido</label>
				    	<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Apellido del cliente ..." required minlength="5">
				    	<div class="hide" id="lastName-error"></div>
				  	</div>
				  	<div class="form-group">
				    	<label for="contact">Contacto</label>
				    	<input type="number" class="form-control" id="contact" name="contact" placeholder="Contacto del cliente ..." required minlength="10">
				    	<div class="hide" id="contact-error"></div>
				  	</div>
				  	<div class="form-group">
				    	<label for="contact">E-Mail</label>
				    	<input type="email" class="form-control" id="email" name="email" placeholder="Email del cliente ..." required>
				    	<div class="hide" id="email-error"></div>
				  	</div>
					<button type="submit" class="btn btn-default">Crear</button>
				</g:form>
			</div>
  			<div class="col-md-2"></div>
		</div>
		<script type="text/javascript">
			$().ready(function() {
				$('.validable').validate({
					errorClass: 'has-error',
					validClass: 'has-success',
					errorElement: 'b',
					errorPlacement: function (error, element){
						var label = "<label class=\"control-label\">{0}</label>";
						$("#"+element.attr('id')+"-error").html(jQuery.validator.format(label,error.text()));
					},
				  	highlight: function(element, errorClass, validClass) {
    					$(element).parent().addClass(errorClass).removeClass(validClass);
    					$('#' + element.id + "-error").removeClass('hide');
  					},
  					unhighlight: function(element, errorClass, validClass) {
    					$(element).parent().removeClass(errorClass).addClass(validClass);
    					$('#' + element.id + "-error").addClass('hide');
  					},
  					messages: {
						name: {
							required: "Debe completar un nombre.",
							minlength: "Debe contener como mínimo 5 letras."
						},
						lastName: {
							required: "Debe completar un apellido.",
							minlength: "Debe contener como mínimo 5 letras."
						},
						contact: {
							required: "Debe completar un número de contacto.",
							minlength: "Debe contener como mínimo 10 números.",
							number: "Debe ser un número."	
						},
						email: {
							required: "Debe completar un mail de contacto.",
							email: "Debe ser un mail válido."
						}
  	  				}
				});
			});
		</script>
	</body>
</html>