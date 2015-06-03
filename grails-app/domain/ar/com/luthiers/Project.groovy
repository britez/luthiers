package ar.com.luthiers

class Project {
	
	Date estimatedDate
	String description
	Double ammount
	
    static constraints = {}
	static belongsTo = [owner:Client]
	static hasMany = [refactors:Refactor]
	
}
