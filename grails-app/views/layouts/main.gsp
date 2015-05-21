<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Luthiers</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<asset:stylesheet src="custom.css"/>
  		<asset:stylesheet src="bootstrap.css"/>
  		<asset:stylesheet src="theme.css"/>
		<asset:javascript src="jquery-1.11.3.min.js"/>
		<asset:javascript src="bootstrap.js"/>
		<g:layoutHead/>
	</head>
	<body role="document">
		<nav class="navbar navbar-inverse navbar-fixed-top">
      		<div class="container">
        		<div class="navbar-header">
          			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            			<span class="sr-only">Toggle navigation</span>
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
          			</button>
          			<a class="navbar-brand" href="#">Luthiers</a>
        		</div>
        		
				<div id="navbar" class="navbar-collapse collapse pull-right">
          			<ul class="nav navbar-nav">
			            <li><g:link controller="project">Proyectos</g:link></li>
			            <li><g:link controller="client">Clientes</g:link></li>
		        	</ul>
				</div>
			</div>
    	</nav>
    	
    	<div class="container theme-showcase" role="main">
			<g:layoutBody/>
    	</div>
		
	</body>
</html>
