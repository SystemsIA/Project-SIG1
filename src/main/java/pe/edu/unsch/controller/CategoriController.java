package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.service.CategoriaService;

@Controller
@RequestMapping("admin")
public class CategoriController {
	
	@Autowired
	private CategoriaService categoriaService;

	@GetMapping("/categori")
	public String index(Model model) {
		model.addAttribute("categorias", categoriaService.listaCategorias());
		return "views/admin/Categori/index";
	}

}