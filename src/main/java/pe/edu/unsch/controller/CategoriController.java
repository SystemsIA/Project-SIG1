package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.service.CategoriaService;

@Controller
@RequestMapping("/admin")
public class CategoriController {
	
	@Autowired
	private CategoriaService categoriaService;

	@GetMapping("/home")
	public String index() {
		return "views/admin/home/index";
	}
	
	@GetMapping("/categori")
	public String index(Model model) {
		model.addAttribute("categorias", categoriaService.listaCategorias());
		return "views/admin/Categori/index";
	}
	
	@GetMapping("/eliminarCategoria/{idCategoria}")
	public String eliminarCategoria(Model model, @PathVariable Integer idCategoria) {
		categoriaService.borrarCategoria(idCategoria);
		return "redirect:/admin/categori";
	}

}