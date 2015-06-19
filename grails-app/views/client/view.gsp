<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:javascript src="jquery.validate.min.js"/>
	</head>
	<body>
		<div class="row">
			<g:if test="${flash.success}">
				<div class="row alert alert-success" role="alert">
		      		<strong>OK!</strong> ${flash.success}.
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
				<g:link action="edit" id="${client.id}">
					<button type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Editar
					</button>
				</g:link>
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#createInstrumentModal">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					Instrumento
				</button>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Eliminar
				</button>
			</div>
			<div class="page-header">
	        	<h1>${client.name} ${client.lastName}</h1>
			</div>
		</div>
		<div class="row">
    		<p><b>Contacto:</b> ${client.contact}</p>
		</div>
		<div class="row">
    		<p><b>E-mail:</b> ${client.email}</p>
		</div>
		<div class="row">
			<p><b>Instrumentos y Proyectos:</b></p>
			<div class="col-md-4">
				<g:render template="/instrument/list" model="${[instruments:client.instruments]}"/>
			</div>
			<div class="col-md-8">
				<g:render template="/project/list" model="${[projects:client.projects]}"/>
			</div>
		</div>
		
		<!-- Modal delete client-->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
   						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   						<h3 class="modal-title" id="myModalLabel">Eliminar cliente</h3>
					</div>
					<div class="modal-body">
						<h4>¿Esta seguro de eliminar el cliente ${client.name} ${client.lastName}?</h4>
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
   						<g:link action="delete" id="${client.id}">
	   						<button type="button" class="btn btn-danger">
	   							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
	   							Eliminar
	   						</button>
   						</g:link>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Modal new instrument -->
		<div class="modal fade" id="createInstrumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<g:render template="/instrument/modalForm" model="${[clientId:client.id]}"/>
			</div>
		</div>
	</body>
</html>