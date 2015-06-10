<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<g:if test="${nearToExpire > 0}">
		<div class="row clearfix">
			<div class="alert alert-warning" role="alert">
				<span class="glyphicon glyphicon-align-left glyphicon-hourglass" aria-hidden="true"></span>
				<b>Próximos a expirar!</b> Existen ${nearToExpire} proyectos apunto de expirar. Para verlos <g:link action="near">aqui!</g:link>
			</div>
		</div>
		</g:if>
		<g:if test="${expired > 0}">
		<div class="row clearfix">
			<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-align-left glyphicon-fire" aria-hidden="true"></span>
				<b>Expirados!</b> Existen ${expired} proyectos expirados. Para verlos <g:link action="expired">aqui!</g:link>
			</div>
		</div>
		</g:if>
		<div class="row clearfix">
			<g:link controller="project" action="create">
				<button type="button" class="btn btn-primary pull-right">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					Nuevo proyecto
				</button>
			</g:link>
			<div class="page-header">
	        	<h1>Proyectos</h1>
			</div>
			<g:render template="list" model="${projects}"/>
		</div>
	</body>
</html>