<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:javascript src="moment.min.js"/>
		<asset:javascript src="moment-es.js"/>
		<asset:javascript src="bootstrap-datetimepicker.js"/>
		<asset:stylesheet src="bootstrap-datetimepicker.css"/>
		<asset:javascript src="jquery.validate.min.js"/>
	</head>
	<body>
		<div class="row clearfix">
			<g:link controller="client" action="create">
				<button type="button" class="btn btn-primary pull-right">Nuevo cliente</button>
			</g:link>
			<div class="page-header">
	        	<h1>Crear Proyecto</h1>
			</div>
		</div>
		<g:if test="${clients.isEmpty()}">
		<div class="row alert alert-warning" role="alert">
      		<strong>No existen clientes</strong>, para agregar uno nuevo <g:link controller="client" action="create">aqui!</g:link>
    	</div>
		</g:if>
		<g:if test="${flash.success}">
		<div class="row alert alert-success" role="alert">
      		<strong>Creado!</strong> Proyecto creado con éxito.
    	</div>
		</g:if>
		<g:if test="${flash.error}">
		<div class="row alert alert-danger" role="alert">
      		<strong>Ups!</strong> El proyecto no pudo ser creado.
    	</div>
		</g:if>
		<div class="row">
			<div class="col-md-2"></div>
  			<div class="col-md-8">
				<g:form action="save" autocomplete="off" class="validable">
					<div id="form-content">
					  	<div class="form-group">
					    	<label for="client">Cliente</label>
					    	<select class="form-control" name="client" id="client" required>
					    		<option value>Elegir cliente ...</option>
					    		<g:each in="${clients}">
									<option value="${it.id}">${it.name} ${it.lastName}</option>
					    		</g:each>
							</select>
							<div class="hide" id="client-error"></div>
					  	</div>
					  	<div class="form-group" id="instrumentGroup" data-url="<g:createLink controller="instrument" action="list"/>">
					    	<label for="instrument">Instrumento</label>
					    	<select class="form-control" name="instrument" id="instrument" required>
					    		<option value>Elegir instrumento ...</option>
							</select>
							<div class="hide" id="instrument-error"></div>
					  	</div>
					  	<div class="form-group">
					    	<label for="description">Descripción</label>
					    	<input type="text" class="form-control" id="description" name="description" placeholder="Descripción del arreglo ..." required>
					    	<div class="hide" id="description-error"></div>
					  	</div>
					  	<div class="form-group">
					    	<label for="estimatedDate">Día de entrega</label>
					    	<div class="input-group date" id="datePicker">
			                    <input type="text" class="form-control" name="estimatedDate" id="estimatedDate" placeholder="dd / MM / AAAA" required>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
			                <div class="hide" id="estimatedDate-error"></div>
			                <script type="text/javascript">
	            				$(function () {
	                				$('#datePicker').datetimepicker({format: 'DD/MM/YYYY', locale:'es'});
	            				});
	        				</script>
					  	</div>
					  	<div class="form-group">
			  				<label for="estimatedDate">Arreglos</label>
	  						<div class="row">
	  							<div class="col-md-7  form-group">
									<input type="text" class="form-control" id="refactors" name="refactors" placeholder="Descripción del arreglo ..." required>
									<div class="hide" id="refactors-error"></div>
					  			</div>
								<div class="col-md-3 form-group">
					    			<div class="input-group">
					          			<div class="input-group-addon">$</div>
					          			<input type="number" class="form-control" id="amounts" name="amounts" placeholder="Precio" required>
					        		</div>
									<div class="hide" id="amounts-error"></div>
					  			</div>
					  			<div class="col-md-2">
					  				<button type="button" class="btn btn-primary pull-right" id="addRefactor">Agregar</button>
								</div>
							</div>
						</div>
		                <script type="text/javascript">
	           				$(function () {
	               				$('#addRefactor').click(function (){
	               					var html = "<div class=\"form-group\">"+
	                   				"<div class=\"row\">"+
	               					"<div class=\"col-md-7 form-group\">"+
	               					"<input type=\"text\" class=\"form-control\" id=\"refactors\" name=\"refactors\" placeholder=\"Descripción del arreglo ...\">" +
	    				  			"</div>"+
	    				  			"<div class=\"col-md-5 form-group\">"+
	    				  			"<div class=\"input-group\">"+
	    				  			"<div class=\"input-group-addon\">$</div><input type=\"number\" class=\"form-control\" id=\"amounts\" name=\"amounts\" placeholder=\"Precio\">" +
	    				        	"</div></div></div></div>"
									$('#form-content').append(html)
	                   			});
	           				});
	       				</script>
	       			</div>
					<button type="submit" class="btn btn-default">Crear</button>
				</g:form>
			</div>
  			<div class="col-md-2"></div>
		</div>
		<script type="text/javascript">
			$().ready(initialize());
			
			function initialize() {
				$('.validable').validate({
					errorClass: 'has-error',
					validClass: 'has-success',
					errorElement: 'b',
					errorPlacement: function (error, element){
						var label = "<label class=\"control-label\">{0}</label>";
						$("#"+element.attr('id')+"-error").html(jQuery.validator.format(label,error.text()));
					},
				  	highlight: function(element, errorClass, validClass) {
    					$(element).closest(".form-group").addClass(errorClass).removeClass(validClass);
    					$('#' + element.id + "-error").removeClass('hide');
  					},
  					unhighlight: function(element, errorClass, validClass) {
    					$(element).closest(".form-group").removeClass(errorClass).addClass(validClass);
    					$('#' + element.id + "-error").addClass('hide');
  					},
  					messages: {
  	  					client: {
  	  	  					required: "Debe de elegir un cliente"
  	  	  				},
  						instrument: {
	  	  					required: "Debe de elegir un instrumento"
	  	  				},
  	  	  				description: {
  	  	  	  				required: "Debe agregar una descripción"
 	  	  	  			},
 	  	  	  			estimatedDate: {
							required: "Debe agregar una fecha de entrega"
 	 	  	  	  		},
 	 	  	  	  		refactors: {
							required: "Debe agregar una descripcion para el arreglo"
 	 	 	  	  	  	},
 	 	 	  	  		amounts: {
							required: "Debe agregar un precio para el arreglo"
	 	 	  	  	  	}
  	  				}
				});
				$('#client').change(function (){
					var id = $('#client').val();
					var url = $('#instrumentGroup').attr('data-url');
					var request = $.ajax({
				  		url: url,
						method: "GET",
					  	data: { id : id },
					});
					request.done(function(data) {
				  		$("#instrument").append(data);
					});
				});
			}
		</script>
	</body>
</html>