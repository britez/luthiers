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
		<div class="row">
			<div class="page-header">
	        	<h1>Actualizar Proyecto</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2"></div>
  			<div class="col-md-8">
				<g:form action="update">
					<div id="form-content">
						<input type="hidden" value="${project.id}" name="id"/>
					  	<div class="form-group">
					    	<label for="client">Cliente</label>
					    	<select class="form-control" name="client" id="client">
					    		<option>Elegir cliente ...</option>
					    		<g:each in="${clients}">
									<option value="${it.id}" ${it.id.equals(project.owner.id)?'selected':''}>${it.name} ${it.lastName}</option>
					    		</g:each>
							</select>
					  	</div>
					  	<div class="form-group">
					    	<label for="description">Descripción</label>
					    	<input type="text" class="form-control" id="description" name="description" placeholder="Descripción del arreglo ..." value="${project.description }">
					  	</div>
					  	<div class="form-group">
					    	<label for="estimatedDate">Día de entrega</label>
					    	<div class="input-group date" id="datePicker">
			                    <input type="text" class="form-control" name="estimatedDate" id="estimatedDate" value="${project.estimatedDate }">
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
			                <script type="text/javascript">
	            				$(function () {
	            					$('#datePicker').datetimepicker({format: 'DD/MM/YYYY', locale:'es'});
	            					$("#datePicker").data("DateTimePicker").date(new Date("${project.estimatedDate}"));
	            				});
	        				</script>
					  	</div>
		  				<label for="estimatedDate">Arreglos</label>
		  				<g:each in="${project.refactors}" var="it" status="i">
					  	<div class="form-group">
			  				<div class="row">
			  					<input type="hidden" value="${it.id}" name="refactorIds">
	               				<div class="col-md-7">
	               					<input type="text" class="form-control" id="refactors" name="refactors" placeholder="Descripción del arreglo ..." value="${it.description}">
    				  			</div>
	    				  		<div class="col-md-${i==(size-1)?3:5}">
	    				  			<div class="input-group">
	    				  				<div class="input-group-addon">$</div>
	    				  				<input type="text" class="form-control" id="amount" name="amounts" placeholder="Precio" value="${it.price}">
	    				        	</div>
	    				        </div>
		    				    <g:if test="${(size-1)==i}">
					  			<div class="col-md-2">
					  				<button type="button" class="btn btn-primary pull-right" id="addRefactor">Agregar</button>
								</div>
		    				    </g:if>
	    				    </div>
						</div>
						</g:each>
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
	    				  			"<div class=\"input-group-addon\">$</div><input type=\"text\" class=\"form-control\" id=\"amount\" name=\"amounts\" placeholder=\"Precio\">" +
	    				        	"</div></div></div></div>"
									$('#form-content').append(html)
	                   				});
	           				});
	       				</script>
	       			</div>
					<button type="submit" class="btn btn-default">Actualizar</button>
				</g:form>
			</div>
  			<div class="col-md-2"></div>
		</div>
	</body>
</html>