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
	        	<h1>Proyectos expirados</h1>
			</div>
			<g:render template="list" model="${projects}"/>
		</div>
	</body>
</html>