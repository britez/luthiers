package ar.com.luthiers

import javax.persistence.StoredProcedureParameter;

import grails.transaction.Transactional
import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException

@Transactional
class ProjectService {
	
	def refactorService
	
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
		project.id
	}
	
	def update(Long id, Project project){
		Project stored = get(id)
		stored.description = project.description
		stored.estimatedDate = project.estimatedDate
		changeOwner(stored, project.owner)
		refactorService.update(stored, project.refactors)
		stored.ammount = getAmmount(project.refactors)
		stored.save()
		if(stored.hasErrors()){
			throw new PersistanceException()
		}
		id
	}
	
	private changeOwner(Project stored, Client newClient){
		if(!stored.owner.equals(newClient)){
			stored.owner = newClient
		}
	}
	
	private Double getAmmount(def refactors){
		Double result = 0
		refactors.each {
			result += it.price
		}
		result
	}
}
