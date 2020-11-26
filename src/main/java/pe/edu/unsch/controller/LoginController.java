package pe.edu.unsch.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import pe.edu.unsch.entities.RolUsuario;
import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.service.UsuarioLoginService;

@Controller
public class LoginController {
	@Autowired
	private UsuarioLoginService usuarioLoginService;

	@GetMapping("/login")
	public String login() {
		return "views/login/login";

	}

	@PostMapping("/login")
	public String login(HttpServletRequest request, HttpSession session, Model model) {
		Usuario user = usuarioLoginService.login(request.getParameter("username"), request.getParameter("password"));

		if (user == null) {
			model.addAttribute("error", "Cuenta inválida");
			return "redirect:/login";
		} 
		else if( user.getIdusuario() == 1) {
			return "redirect:/admin/home";
		}
		else if( user.getIdusuario() == 2) {
			return "redirect:/seller/home";
		}
		else {
			session.setAttribute("usuario", user.getUsuario());
			return "redirect:/";
		}

	}

}
