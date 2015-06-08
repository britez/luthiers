<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
			<g:if test="${flash.success}">
				<div class="row alert alert-success" role="alert">
		      		<strong>Creado!</strong> ${flash.success}.
		    	</div>
			</g:if>
			<g:if test="${flash.error}">
				<div class="row alert alert-danger" role="alert">
		      		<strong>Ups!</strong> ${flash.error}.
		    	</div>
			</g:if>
		</div>
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