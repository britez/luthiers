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
			<g:link action="create">
				<button type="button" class="btn btn-primary pull-right">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					Nuevo cliente
				</button>
			</g:link>
			<div class="page-header">
	        	<h1>Clientes</h1>
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
			<g:render template="list" model="${[clients:clients]}"/>
		</div>
	</body>
</html>