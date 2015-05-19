package ar.com.luthiers

class Refactor {
	
	Double price
	String description

    static constraints = {}
	static belongsTo = [owner: Project]
}
