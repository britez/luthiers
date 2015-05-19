package ar.com.luthiers

class Project {
	
	Date estimatedDate
	String description
	
    static constraints = {}
	static belongsTo = [owner:Client]
	static hasMany = [refactors:Refactor]
	
}
