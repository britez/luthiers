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
    		<p><b>Contacto:</b> ${client.contact}</p>
		</div>
		<div class="row">
			<p><b>Proyectos:</b></p>
			<g:render template="/project/list" model="${[projects:client.projects]}"/>
		</div>
	</body>
</html>