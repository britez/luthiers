package ar.com.luthiers

class Project {
	
	Date estimatedDate
	String description
	Double ammount
	Instrument instrument
	ProjectStatus status
	
	static searchable = true
    static constraints = {}
	static belongsTo = [owner:Client]
	static hasMany = [refactors:Refactor]
	
}
