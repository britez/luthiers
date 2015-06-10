package ar.com.luthiers

import grails.transaction.Transactional
import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException


@Transactional
class ClientService {

    def list() { Client.executeQuery("from Client") }
	
	def create(Client client){
		client.projects = []
		client.save()
		if (client.hasErrors()){
			throw new PersistanceException()
		}
		return client.id
	}
	
	def update(Long id, Client client){
		def stored = get(id)
		stored.name = client.name
		stored.lastName = client.lastName
		stored.contact = client.contact
		stored.email = client.email
		stored.save()
		if (stored.hasErrors()){
			throw new PersistanceException()
		}
		id
	}
	
	def get(Long id){
		Client result = Client.executeQuery("from Client c where c.id = ?",id)[0]
		if(!result){
			throw ResourceNotFoundException()
		}
		result
	}
}