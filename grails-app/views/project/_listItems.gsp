<g:if test="${projects.isEmpty()}">
	<tr class="success">
		<td colspan="6" align="center"> No existen proyectos. Para la búsqueda ${query}</td>
	</tr>
</g:if>
<g:each in="${projects}">
	<tr id="${createLink(controller: "project", action: "view", id: it.id)}" class="selectable">
		<td>${it.id}</td>
		<td>${it.owner.name} ${it.owner.lastName}</td>
		<td>${it.instrument.brand} ${it.instrument.model}</td>
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
