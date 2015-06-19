package ar.com.luthiers

import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException

class ClientController {
	
	def clientService
	
	def index(){ [clients:clientService.list()] }

    def create() {}
	
	def save(){
		Long result
		try {
			result = clientService.create(new Client(params))
			flash.success = "Cliente creado correctamente!"
		} catch (PersistanceException ex){
			flash.error = "Error creando el cliente"
		}
		redirect (action: "view", id: result)
	}
	
	def update(){
		try {
			clientService.update(params.id?.toLong(), new Client(params))
			flash.success = "Cliente actualizado correctamente!"
		} catch (PersistanceException ex){
			flash.error = "Error, el cliente no existe"
		} catch (PersistanceException ex){
			flash.error = "Error actualizando el cliente"
		}
		redirect (action: "view", id: params.id)
	}
	
	def view(Long id){ [client: clientService.get(id)] }
	
	def edit(Long id){ [client: clientService.get(id)] }
	
	def delete(Long id){
		try {
			clientService.delete(id)
			flash.success = "Cliente eliminado correctamente"
		} catch(ResourceNotFoundException ex){
			flash.error = "El cliente no existe"
		} catch(PersistanceException ex){
			flash.error = "Error elinando el cliente"
		}
		redirect (action: "index")
	}
	
	
	//Ajax endpoints
	
	def search() {
		String query = params.query
		render(template: 'listItems', model:[clients:clientService.search(params.query), query:query])
	}
}