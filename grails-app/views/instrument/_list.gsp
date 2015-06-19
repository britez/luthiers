<table class="table table-striped">
	<thead>
		<tr>
			<th>Tipo</th>
			<th>Marca</th>
			<th>Modelo</th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${instruments.isEmpty()}">
			<tr class="success">
				<td colspan="3" align="center"> No existen instrumentos.</td>
			</tr>
		</g:if>
		<g:each in="${instruments}">
			<tr id="${createLink(controller: "instrument", action: "view", id: it.id)}" class="selectable">
				<td>${it.type}</td>
				<td>${it.brand}</td>
				<td>${it.model}</td>
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