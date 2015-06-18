<g:if test="${clients.isEmpty()}">
	<tr class="success">
		<td colspan="5" align="center"> No existen clientes para la búsqueda ${query}</td>
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
<script type="text/javascript">
	$('.selectable').click(function (){
		window.location.href = $(this).attr("id"); 
		return false;
	});
</script>