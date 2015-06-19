<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h3 class="modal-title" id="myModalLabel">Crear instrumento</h3>
	</div>
	<div class="modal-body">
		<g:form controller="instrument" action="save" autocomplete="off" class="validable">
			<input type="hidden" name="clientId" value="${clientId}" />
		  	<div class="form-group">
		    	<label for="name">Tipo</label>
		    	<input type="text" class="form-control" id="type" name="type" placeholder="Guitarra, Bajo, Equipo, etc ..." required minlength="5">
		    	<div class="hide" id="type-error"></div>
		  	</div>
		  	<div class="form-group">
		    	<label for="lastName">Marca</label>
		    	<input type="text" class="form-control" id="brand" name="brand" placeholder="Gibson, Fender, etc ..." required minlength="5">
		    	<div class="hide" id="brand-error"></div>
		  	</div>
		  	<div class="form-group">
		    	<label for="contact">Modelo</label>
		    	<input type="text" class="form-control" id="model" name="model" placeholder="Modelos de instrumentos ..." required minlength="5">
		    	<div class="hide" id="model-error"></div>
		  	</div>
		</g:form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
		<button type="button" class="btn btn-success" id="submit">
			Crear
		</button>
	</div>
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
			type: {
				required: "Debe completar un tipo de instrumento.",
				minlength: "Debe contener como mínimo 5 letras."
			},
			brand: {
				required: "Debe completar una marca.",
				minlength: "Debe contener como mínimo 5 letras."
			},
			model: {
				required: "Debe completar el modelo.",
				minlength: "Debe contener como mínimo 5 letras.",
			}
		}
	});

	$('#submit').click(function (){
		$('.validable').submit();
	});
});
</script>