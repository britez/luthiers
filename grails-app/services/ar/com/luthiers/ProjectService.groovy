package ar.com.luthiers

import grails.transaction.Transactional
import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException

@Transactional
class ProjectService {
	
    def list() {
		Project.executeQuery("from Project")
    }
	
	def create(Project project, Client client){
		project.owner = client
		project.save()
		if(project.hasErrors()){
			throw new PersistanceException()
		}
		project
	}
}
