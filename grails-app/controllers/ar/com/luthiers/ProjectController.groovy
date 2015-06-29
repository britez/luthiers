package ar.com.luthiers

import java.text.SimpleDateFormat

import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException

class ProjectController {
	
	def projectService
	def clientService
	def instrumentService

    def index() {
		[projects:projectService.list(), 
		 nearToExpire:projectService.countNearToExpire(),
		 expired: projectService.countExpired()]
	}
	
	def search() {
		String query = params.query
		render(template: 'listItems', model:[projects:projectService.search(params.query), query:query])
	}
	
	def expired(){
		[projects:projectService.expired()]
	}
	
	def near(){
		[projects:projectService.nearToExpire()]
	}
	
	def view(Long id){
		[project:projectService.get(id), 
		 ready:ProjectStatus.READY, 
		 inProgress: ProjectStatus.IN_PROGRESS, 
		 finished: ProjectStatus.FINISHED]
	}
	
	def create(){
		[clients:clientService.list()]
	}
	
	def edit(Long id){
		def project = projectService.get(id)
		[project:project,clients:clientService.list(),size:project.refactors?.size()]
	}
	
	def save(){
		Long result
		try {
			def a = params.instrument.toLong()
			def b = params.client.toLong()
			result = projectService.create(createProject(params), clientService.get(b), a)
			flash.success = "Proyecto creado con éxito"
		}catch(ResourceNotFoundException ex){
			flash.error = "El cliente no existe"
		}catch(PersistanceException ex){
			flash.error = "El proyecto no pudo ser creado"
		}
		redirect (action: "view", id: result)
	}
	
	def update(){
		try {
			def project = createProject(params)
			project.owner = clientService.get(params.client.toLong())
			projectService.update(params.id?.toLong(), project)
			flash.success = "Proyecto actualizado correctamente!"
		} catch (ResourceNotFoundException ex){
			flash.error = "Error, el proyecto no existe"
		} catch (PersistanceException ex){
			flash.error = "Error actualizando el proyecto"
		}
		redirect (action: "view", id: params.id)
	}
	
	def delete(Long id){
		try {
			projectService.delete(id)
			flash.success = "Proyecto eliminado correctamente"
		} catch(ResourceNotFoundException ex){
			flash.error = "El proyecto no existe"
		} catch(PersistanceException ex){
			flash.error = "Error elinando el proyecto"
		}
		redirect (action: "index")
	}
	
	def start(Long id){
		projectService.start(id)
		redirect (action: "view", id: id)
	}
	
	def ready(Long id){
		projectService.ready(id)
		redirect (action: "view", id: id)
	}
	
	def finish(Long id){
		projectService.finish(id)
		redirect (action: "view", id: id)
	}
	
	private def createProject(def params){
		Project project = new Project()
		project.status = ProjectStatus.READY
		project.description = params.description
		project.estimatedDate = new SimpleDateFormat("dd/MM/yyyy").parse(params.estimatedDate)
		project.refactors = createRefactors(params.refactors, params.amounts, project)
		project
	}
	
	private def createRefactors(String[] refactors, String[] amounts, Project project){
		List<Refactor> result = []
		for(int i=0;i<refactors.length;i++){
			result.addAll(createRefactors(refactors[i],amounts[i], project))
		}
		result
	}
	
	private def createRefactors(String refactor, String amount, Project project){
		List<Refactor> result = []
		if(refactor != null && refactor != "" && amount != null && amount != ""){
			Refactor item = new Refactor()
			item.price = amount.toDouble()
			item.description = refactor
			result << item
		}
		result
	}
}