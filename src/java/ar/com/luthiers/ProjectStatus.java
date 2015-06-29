package ar.com.luthiers;

public enum ProjectStatus {
	
	READY("Listo para empezar"),
	IN_PROGRESS("En curso"),
	FINISHED("Terminado");
	
	private String message;

	private ProjectStatus(String message){
		this.message = message;
	}
	
	@Override
	public String toString(){
		return message;
	}
	
	
}
