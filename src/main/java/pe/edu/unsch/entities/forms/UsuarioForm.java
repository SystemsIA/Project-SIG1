package pe.edu.unsch.entities.forms;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class UsuarioForm {

	@NotBlank(message = "El nombre de usuario no debe ser estar en blanco")
	@NotNull
	private String usuario;

	@NotBlank
	@NotNull
	private String password;

	private String password_confirmed;

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword_confirmed() {
		return password_confirmed;
	}

	public void setPassword_confirmed(String password_confirmed) {
		this.password_confirmed = password_confirmed;
	}

	@Override
	public String toString() {
		return "UsuarioForm [usuario=" + usuario + ", password=" + password + ", password_confirmed="
				+ password_confirmed + "]";
	}

}
