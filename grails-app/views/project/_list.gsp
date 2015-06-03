<table class="table table-striped">
	<thead>
		<tr>
			<th>N°</th>
			<th>Cliente</th>
			<th>Descripción</th>
			<th>Fecha de entrega</th>
			<th>Precio ($)</th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${projects.isEmpty()}">
			<tr class="success">
				<td colspan="5" align="center"> No existen proyectos. Crea uno <g:link controller="project" action="create">aqui!</g:link></td>
			</tr>
		</g:if>
		<g:each in="${projects}">
			<tr id="${createLink(controller: "project", action: "view", id: it.id)}" class="selectable">
				<td>${it.id}</td>
				<td>${it.owner.name} ${it.owner.lastName}</td>
				<td>${it.description}</td>
				<td><g:formatDate format="dd/MM/yyyy" date="${it.estimatedDate}"/></td>
				<td>$ ${it.ammount}</td>
			</tr>
		</g:each>
		<script type="text/javascript">
			$('.selectable').click(function (){
				window.location.href = $(this).attr("id"); 
				return false;
			});
		</script>
	</tbody>
</table>