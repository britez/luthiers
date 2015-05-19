<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row clearfix">
			<g:link controller="project" action="create">
				<button type="button" class="btn btn-primary pull-right">Nuevo proyecto</button>
			</g:link>
			<div class="page-header">
	        	<h1>Proyectos</h1>
			</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>N°</th>
						<th>Cliente</th>
						<th>Descripción</th>
						<th>Fecha de entrega</th>
					</tr>
				</thead>
				<tbody>
					<g:if test="${projects.isEmpty()}">
						<tr class="success">
							<td colspan="4" align="center"> No existen proyectos. Crea uno <g:link controller="project" action="create">aqui!</g:link></td>
						</tr>
					</g:if>
					<g:each in="${projects}">
						<tr>
							<td>${it.id}</td>
							<td>${it.owner.name} ${it.owner.lastName}</td>
							<td>${it.description}</td>
							<td><g:formatDate format="dd/MM/yyyy" date="${it.estimatedDate}"/></td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>