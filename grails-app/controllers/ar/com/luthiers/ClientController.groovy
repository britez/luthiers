package ar.com.luthiers

import ar.com.luthiers.exception.PersistanceException

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
}