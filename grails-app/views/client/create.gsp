<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
			<div class="page-header">
	        	<h1>Crear Cliente</h1>
			</div>
		</div>
		<g:if test="${flash.success}">
		<div class="row alert alert-success" role="alert">
      		<strong>Creado!</strong> Cliente creado con éxito.
    	</div>
		</g:if>
		<g:if test="${flash.error}">
		<div class="row alert alert-danger" role="alert">
      		<strong>Ups!</strong> El cliente no pudo ser creado.
    	</div>
		</g:if>
		<div class="row">
			<div class="col-md-2"></div>
  			<div class="col-md-8">
				<g:form action="save">
				  	<div class="form-group">
				    	<label for="name">Nombre</label>
				    	<input type="text" class="form-control" id="name" name="name" placeholder="Nombre del cliente ...">
				  	</div>
				  	<div class="form-group">
				    	<label for="lastName">Apellido</label>
				    	<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Apellido del cliente ...">
				  	</div>
				  	<div class="form-group">
				    	<label for="contact">Contacto</label>
				    	<input type="text" class="form-control" id="contact" name="contact" placeholder="Contacto del cliente ...">
				  	</div>
					<button type="submit" class="btn btn-default">Crear</button>
				</g:form>
			</div>
  			<div class="col-md-2"></div>
		</div>
	</body>
</html>