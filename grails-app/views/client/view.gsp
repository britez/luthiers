<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row clearfix">
			<g:link action="edit" id="${client.id}">
				<button type="button" class="btn btn-primary pull-right">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Editar
				</button>
			</g:link>
			<div class="page-header">
	        	<h1>${client.name} ${client.lastName}</h1>
			</div>
		</div>
		<div class="row">
		  	<div class="form-group">
		    	<label for="contact">Contacto: ${client.contact}</label>
		  	</div>
		</div>
	</body>
</html>