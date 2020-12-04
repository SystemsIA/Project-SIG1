package pe.edu.unsch.entities.forms;

import javax.validation.constraints.NotBlank;

public class PersonaForm {

	@NotBlank
	private String nombre;

	@NotBlank
	private String apellido;

	private String telefono;

	@NotBlank
	private String correo;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	@Override
	public String toString() {
		return "PersonaForm [nombre=" + nombre + ", apellido=" + apellido + ", telefono=" + telefono + ", correo="
				+ correo + "]";
	}

}
