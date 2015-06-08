<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
			<div class="page-header">
	        	<h1>Editar Cliente</h1>
			</div>
		</div>
		<g:if test="${flash.success}">
		<div class="row alert alert-success" role="alert">
      		<strong>Actualizado!</strong> Cliente actualizado con éxito.
    	</div>
		</g:if>
		<g:if test="${flash.error}">
		<div class="row alert alert-danger" role="alert">
      		<strong>Ups!</strong> El cliente no pudo ser actualizado.
    	</div>
		</g:if>
		<div class="row">
			<div class="col-md-2"></div>
  			<div class="col-md-8">
				<g:form action="update">
					<input type="hidden" name="id" value="${client.id}" />
				  	<div class="form-group">
				    	<label for="name">Nombre</label>
				    	<input type="text" class="form-control" id="name" name="name" placeholder="Nombre del cliente ..." value="${client.name}" />
				  	</div>
				  	<div class="form-group">
				    	<label for="lastName">Apellido</label>
				    	<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Apellido del cliente ..." value="${client.lastName}">
				  	</div>
				  	<div class="form-group">
				    	<label for="contact">Contacto</label>
				    	<input type="text" class="form-control" id="contact" name="contact" placeholder="Contacto del cliente ..." value="${client.contact}">
				  	</div>
					<button type="submit" class="btn btn-default">Actualizar</button>
				</g:form>
			</div>
  			<div class="col-md-2"></div>
		</div>
	</body>
</html>