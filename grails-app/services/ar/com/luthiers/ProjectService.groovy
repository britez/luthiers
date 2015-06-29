package ar.com.luthiers

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
			throw new ResourceNotFoundException()
		}
		result
	}
	
	def create(Project project, Client client, Long instrumentId){
		project.owner = client
		project.ammount = getAmmount(project.refactors)
		project.instrument = client.getInstrument(instrumentId)
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
	
	def delete(Long id){
		Project project = get(id)
		project.delete()
	}
	
	def countNearToExpire(){
		Project.executeQuery("select count(p.id) from Project p where p.estimatedDate <= ? and p.estimatedDate >= ?",[(new Date()+5).clearTime(), new Date().clearTime()])[0]
	}
	
	def nearToExpire(){
		Project.executeQuery("from Project p where p.estimatedDate <= ? and p.estimatedDate >= ?",[(new Date()+5).clearTime(), new Date().clearTime()])
	}
	
	def countExpired(){
		Project.executeQuery("select count(p.id) from Project p where p.estimatedDate <= ? and p.status != ?",[(new Date()-1).clearTime(),ProjectStatus.FINISHED])[0]
	}
	
	def expired(){
		Project.executeQuery("from Project p where p.estimatedDate <= ? and p.status != ?",[new Date().clearTime(),ProjectStatus.FINISHED])
	}
	
	def search(String query){
		query = "%$query%"
		Project.executeQuery("from Project p where UPPER(p.description) like UPPER(?) or UPPER(p.owner.name) like UPPER(?) or UPPER(p.owner.lastName) like UPPER(?) or UPPER(p.instrument.model) like UPPER(?) or UPPER(p.instrument.brand) like UPPER(?)",[query, query, query, query, query])
	}
	
	def start(Long id){
		changeStatus(get(id),ProjectStatus.IN_PROGRESS)
	}
	
	def ready(Long id){
		changeStatus(get(id),ProjectStatus.READY)
	}
	
	def finish(Long id){
		changeStatus(get(id),ProjectStatus.FINISHED)
	}
	
	private void changeStatus(Project project, ProjectStatus newStatus){
		project.status = newStatus
		project.save()
	}
	
	private void changeOwner(Project stored, Client newClient){
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
