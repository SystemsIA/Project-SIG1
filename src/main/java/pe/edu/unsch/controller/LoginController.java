package pe.edu.unsch.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.unsch.annotation.permisos.IsAuthenticated;
import pe.edu.unsch.entities.forms.UsuarioForm;
import pe.edu.unsch.service.UsuarioService;

@Controller
@RequestMapping
public class LoginController {

	@Autowired
	private UsuarioService usuarioService;

	@GetMapping("/login")
	public String login(Authentication authentication, UsuarioForm usuarioForm, Model model) {
		try {
			if (!authentication.isAuthenticated())
				return "views/login/login";
			else
				return "redirect:/";

		} catch (NullPointerException e) {
			return "views/login/login";
		}

	}

	@IsAuthenticated
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/";
	}

	@PostMapping(path = "/registrarse")
	public String registrarse(@Valid @ModelAttribute UsuarioForm usuarioForm, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		if (bindingResult.hasErrors()) {

			redirectAttributes.addFlashAttribute("message", "No se pudo completar el registro");
			return "views/login/login";
		} else {

			usuarioService.crearUsuario(usuarioForm.getUsuario(), usuarioForm.getPassword());
			redirectAttributes.addFlashAttribute("message", "Se pudo completar el registro");
			return "redirect:/login";
		}
	}

}
