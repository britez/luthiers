package ar.com.luthiers

import ar.com.luthiers.exception.ResourceNotFoundException;
import ar.com.luthiers.exception.PersistanceException;

class InstrumentController {
	
	def instrumentService
	def clientService

    def save() {
		try {
			instrumentService.save(clientService.get(params.clientId?.toLong()), new Instrument(params))
		} catch (ResourceNotFoundException ex){
			flash.error = "El client con id: ${params.clientId} no existe"
		} catch (PersistanceException ex){
		flash.error = "Error creando el instrumento"
		}
		redirect(controller: 'client', action: 'view', id: params.clientId)
	}
	
	//Ajax endpoints
	def list(Long id){
		render(template: 'options', model: [instruments:instrumentService.listByClientId(id)])
	}
}
