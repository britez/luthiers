<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
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
			
			<g:form action="search" class="search">
			<div class="form-group has-feedback clearfix">
				<div class="pull-right">
	      			<input type="text" class="form-control" id="query" name="query" placeholder="Búsqueda...">
	      			<span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
				</div>
    		</div>
			</g:form>
			<script>
				$().ready(function(){
					var form = $('.search');
					form.submit(function (event){
						search(form.attr('action'));
						return event.preventDefault();
					});

					$('#query').keyup(function () {
						$('.search').submit();
					});
				});

				function search(url){
					var query = $('#query').val();
					var request = $.ajax({
				  		url: url,
						method: "GET",
					  	data: { query : query },
					});
					request.done(function(data) {
				  		$("tbody").html(data);
					});
				}
			</script>
			

			<g:render template="list" model="${projects}"/>
		</div>
	</body>
</html>