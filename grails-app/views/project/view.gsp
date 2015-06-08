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
			<g:link action="edit" id="${project.id}">
				<button type="button" class="btn btn-primary pull-right">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Editar
				</button>
			</g:link>
			<div class="page-header">
	        	<h1>Proyecto</h1>
			</div>
		</div>
		<div class="row">
    		<p><b>Cliente:</b> ${project.owner.name} ${project.owner.lastName}</p>
   		</div>
   		<div class="row">
    		<p><b>Fecha estimada:</b> <g:formatDate format="dd/MM/yyyy" date="${project.estimatedDate}"/></p>
   		</div>
   		<div class="row">
    		<p><b>Descripción:</b> ${project.description}</p>
   		</div>
   		<div class="row">
    		<p><b>Precio:</b> $ ${project.ammount}</p>
   		</div>
   		<div class="row">
    		<p><b>Detalle de arreglos:</b></p>
    		<g:render template="listRefactor" model="${[refactors: project.refactors]}"/>
		</div>
	</body>
</html>