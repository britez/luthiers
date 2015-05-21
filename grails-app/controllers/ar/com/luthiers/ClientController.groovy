package ar.com.luthiers

import ar.com.luthiers.exception.PersistanceException

class ClientController {
	
	def clientService
	
	def index(){ [clients:clientService.list()] }

    def create() {}
	
	def save(){
		try {
			clientService.create(new Client(params))
			flash.success = "Cliente creado correctamente!"
			
		} catch (PersistanceException ex){
			flash.error = "Error creando el cliente"
		}
		redirect (action: "create")
	}
	
	def view(Long id){ [client: clientService.get(id)] }
}
