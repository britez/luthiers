package ar.com.luthiers

class Client {
	
	String name
	String lastName
	String contact
	String email

	static searchable = true
	
    static constraints = {
		instruments nullable: true	
	}
	
	static hasMany = [projects:Project, instruments: Instrument]
	static mapping = { projects lazy: false }
	
	public Instrument getInstrument(Long id){
		instruments.find  {	it.id.equals(id) }
	}
}
