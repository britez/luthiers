package ar.com.luthiers

class Client {
	
	String name
	String lastName
	String contact

    static constraints = {}
	static hasMany = [projects:Project]
}
