<table class="table table-striped">
	<thead>
		<tr>
			<th>Descripción</th>
			<th>Precio ($)</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${refactors}">
			<tr>
				<td>${it.description}</td>
				<td>$ ${it.price}</td>
			</tr>
		</g:each>
	</tbody>
</table>