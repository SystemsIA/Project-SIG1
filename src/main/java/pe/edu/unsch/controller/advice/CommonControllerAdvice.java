package pe.edu.unsch.controller.advice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import pe.edu.unsch.service.UsuarioService;

@ControllerAdvice
public class CommonControllerAdvice {

	@Autowired
	private UsuarioService usuarioService;

	@ModelAttribute
	public void addAttributes(Authentication authentication, Model model) {

		try {

			model.addAttribute("username", authentication.getName());
			model.addAttribute("usuario", usuarioService.usuarioAuthenticated(authentication.getName()));

		} catch (NullPointerException e) {
			model.addAttribute("username", "Anonimo");
		}

	}

}
