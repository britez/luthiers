package ar.com.luthiers

import ar.com.luthiers.exception.PersistanceException;
import grails.transaction.Transactional


@Transactional
class InstrumentService {

    def save(Client client, Instrument instrument) {
		if(!client.instruments){
			client.instruments = []
		}
		client.instruments.add(instrument)
		client.save(flush:true)
		if(client.hasErrors()){
			throw new PersistanceException()
		}
    }
	
	def listByClientId(Long clientId){
		Client.executeQuery("select c.instruments from Client c where c.id = ?",clientId)[0]
	}
}
