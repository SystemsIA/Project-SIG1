package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import pe.edu.unsch.service.ProductoService;

@Controller
public class FrontHomeController {

	@Autowired
	private ProductoService productoService;

	@GetMapping({"/", "/front"})
	public String home(Model model) {
		model.addAttribute("title", "Marketplace").addAttribute("productosDestacados",
				productoService.listaProductoDestacados());
		return "views/front/index";
	}
}