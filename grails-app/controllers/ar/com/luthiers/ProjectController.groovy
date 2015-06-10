package ar.com.luthiers

import java.text.SimpleDateFormat

import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException

class ProjectController {
	
	def projectService
	def clientService

    def index() {
		[projects:projectService.list()]
	}
	
	def view(Long id){
		[project:projectService.get(id)]
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
			result = projectService.create(createProject(params), clientService.get(params.client.toLong()))
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
	
	private def createProject(def params){
		Project project = new Project()
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
		Refactor item = new Refactor()
		item.price = amount.toDouble()
		item.description = refactor
		result << item
		result
	}
}