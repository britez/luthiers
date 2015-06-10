package ar.com.luthiers

class Client {
	
	String name
	String lastName
	String contact
	String email

    static constraints = {}
	static hasMany = [projects:Project]
	static mapping = { projects lazy: false }
	
}
