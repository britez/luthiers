package ar.com.luthiers

import grails.transaction.Transactional
import ar.com.luthiers.exception.PersistanceException


@Transactional
class ClientService {

    def list() { Client.executeQuery("from Client") }
	
	def create(Client client){
		client.save()
		if (client.hasErrors()){
			throw new PersistanceException()
		}
		return client.id
	}
	
	def get(Long id){
		Client result = Client.executeQuery("from Client c where c.id = ?",id)[0]
		if(!result){
			throw ResourceNotFoundException()
		}
		result
	}
}