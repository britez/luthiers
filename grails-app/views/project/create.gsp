<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:javascript src="moment.min.js"/>
		<asset:javascript src="moment-es.js"/>
		<asset:javascript src="bootstrap-datetimepicker.js"/>
		<asset:stylesheet src="bootstrap-datetimepicker.css"/>
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
      		<strong>No existen clientes</strong> , para agregar uno nuevo <g:link controller="client" action="create">aqui!</g:link>
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
				<g:form action="save">
					<div id="form-content">
					  	<div class="form-group">
					    	<label for="client">Cliente</label>
					    	<select class="form-control" name="client" id="client">
					    		<option>Elegir cliente ...</option>
					    		<g:each in="${clients}">
									<option value="${it.id}">${it.name} ${it.lastName}</option>
					    		</g:each>
							</select>
					  	</div>
					  	<div class="form-group">
					    	<label for="description">Descripción</label>
					    	<input type="text" class="form-control" id="description" name="description" placeholder="Descripción del arreglo ...">
					  	</div>
					  	<div class="form-group">
					    	<label for="estimatedDate">Día de entrega</label>
					    	<div class="input-group date" id="datePicker">
			                    <input type="text" class="form-control" name="estimatedDate" id="estimatedDate" placeholder="dd / MM / AAAA">
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
			                <script type="text/javascript">
	            				$(function () {
	                				$('#datePicker').datetimepicker({format: 'DD/MM/YYYY', locale:'es'});
	            				});
	        				</script>
					  	</div>
					  	<div class="form-group">
			  				<label for="estimatedDate">Arreglos</label>
	  						<div class="row">
	  							<div class="col-md-7">
									<input type="text" class="form-control" id="refactors" name="refactors" placeholder="Descripción del arreglo ...">
					  			</div>
								<div class="col-md-3">
					    			<div class="input-group">
					          			<div class="input-group-addon">$</div>
					          			<input type="text" class="form-control" id="amount" name="amount" placeholder="Precio">
					        		</div>
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
	               					"<div class=\"col-md-7\">"+
	               					"<input type=\"text\" class=\"form-control\" id=\"refactors\" name=\"refactors\" placeholder=\"Descripción del arreglo ...\">" +
	    				  			"</div>"+
	    				  			"<div class=\"col-md-5\">"+
	    				  			"<div class=\"input-group\">"+
	    				  			"<div class=\"input-group-addon\">$</div><input type=\"text\" class=\"form-control\" id=\"amount\" name=\"amount\" placeholder=\"Precio\">" +
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
	</body>
</html>