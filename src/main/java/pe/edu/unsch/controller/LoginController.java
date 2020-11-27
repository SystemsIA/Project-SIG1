package pe.edu.unsch.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.service.UsuarioLoginService;

@Controller
@RequestMapping
public class LoginController {
	@Autowired
	private UsuarioLoginService usuarioLoginService;

	@GetMapping("/login")
	public String login() {
		return "views/login/login";

	}

	@PostMapping("/login")
	public String login(HttpServletRequest request, HttpSession session, Model model) {

		Usuario[] users = {
				usuarioLoginService.loginAdmin(request.getParameter("username"), request.getParameter("password")),
				usuarioLoginService.loginVendedor(request.getParameter("username"), request.getParameter("password")),
				usuarioLoginService.loginComprador(request.getParameter("username"),
						request.getParameter("password")) };

		if (users[0] != null) {
			session.setAttribute("usuario", users[0]);
			return "redirect:/admin/home";
		} else if (users[1] != null) {
			session.setAttribute("usuario", users[1]);
			return "redirect:/seller/home";
		} else if (users[2] != null) {
			session.setAttribute("usuario", users[2]);
			return "redirect:/";
		} else {

			return "redirect: /login";
		}

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("usuario");
		return "redirect:/login";
	}

}
