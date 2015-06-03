package ar.com.luthiers

import grails.transaction.Transactional
import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException

@Transactional
class ProjectService {
	
    def list() {
		Project.executeQuery("from Project")
    }

	def get(Long id){
		Project result = Project.executeQuery("from Project as p where p.id = ?",id)[0]
		if(!result){
			throw ResourceNotFoundException()
		}
		result
	}
	
	def create(Project project, Client client){
		project.owner = client
		project.ammount = getAmmount(project.refactors)
		project.save()
		if(project.hasErrors()){
			throw new PersistanceException()
		}
		project
	}
	
	private Double getAmmount(def refactors){
		Double result = 0
		refactors.each {
			result += it.price
		}
		result
	}
}
