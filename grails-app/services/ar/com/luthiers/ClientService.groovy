package ar.com.luthiers

import grails.transaction.Transactional
import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException


@Transactional
class ClientService {

    def list() { Client.executeQuery("from Client") }
	
	def create(Client client){
		client.projects = []
		client.instruments = []
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
			throw new ResourceNotFoundException()
		}
		result
	}
	
	def delete(Long id){
		get(id).delete()
	}
	def search(String query){
		query = "%$query%"
		Client.executeQuery("from Client c where UPPER(c.name) like UPPER(?) or UPPER(c.lastName) like UPPER(?) or UPPER(c.contact) like UPPER(?) or UPPER(c.email) like UPPER(?)",[query, query, query, query])
	}
}