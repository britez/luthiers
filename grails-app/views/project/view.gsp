<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
			<g:if test="${flash.success}">
				<div class="row alert alert-success" role="alert">
    				<strong>Eliminado!</strong> ${flash.success}.
    			</div>
			</g:if>
			<g:if test="${flash.error}">
				<div class="row alert alert-danger" role="alert">
		      		<strong>Ups!</strong> ${flash.error}.
		    	</div>
			</g:if>
		</div>
		<div class="row clearfix">
			<div class="pull-right">
				<g:link action="edit" id="${project.id}">
					<button type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Editar
					</button>
				</g:link>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Eliminar
				</button>
			</div>
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
		
		<!-- Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
   						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   						<h3 class="modal-title" id="myModalLabel">Eliminar proyecto</h3>
					</div>
					<div class="modal-body">
						<h4>¿Esta seguro de eliminar el proyecto?</h4>
						<div class="alert alert-warning" role="alert">
							<p>
								<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
								<b>Cuidado!</b> 
								Esta operación no podrá ser deshecha.
							</p>
						</div>
			      	</div>
					<div class="modal-footer">
   						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
   						<g:link action="delete" id="${project.id}">
	   						<button type="button" class="btn btn-danger">
	   							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	   							Eliminar
	   						</button>
   						</g:link>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>