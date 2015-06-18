<table class="table table-striped">
<thead>
	<tr>
		<th>N°</th>
		<th>Nombre</th>
		<th>Contacto</th>
		<th>E-mail</th>
		<th>Proyectos</th>
	</tr>
</thead>
<tbody>
	<g:if test="${clients.isEmpty()}">
		<tr class="success">
			<td colspan="5" align="center"> No existen clientes. Crea uno <g:link action="create">aqui!</g:link></td>
		</tr>
	</g:if>
	<g:each in="${clients}">
		<tr id="${createLink(action: "view", id: it.id)}" class="selectable">
			<td>${it.id}</td>
			<td>${it.name} ${it.lastName}</td>
			<td>${it.contact}</td>
			<td>${it.email}</td>
			<td>${it.projects?it.projects.size():0}</td>
		</tr>
	</g:each>
	</tbody>
</table>
<script type="text/javascript">
	$('.selectable').click(function (){
		window.location.href = $(this).attr("id"); 
		return false;
	});
</script>