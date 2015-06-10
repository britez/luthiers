package ar.com.luthiers

import grails.transaction.Transactional
import ar.com.luthiers.exception.PersistanceException
import ar.com.luthiers.exception.ResourceNotFoundException

@Transactional
class RefactorService {
	
	def update(Project project, def refactors){
		project.refactors.each { it.delete() }
		project.refactors = []
		refactors.each { it.save() }
		project.refactors.addAll(refactors)
	}

}
