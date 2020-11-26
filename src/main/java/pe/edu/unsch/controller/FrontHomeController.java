package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import pe.edu.unsch.service.CarritoService;
import pe.edu.unsch.service.ProductoService;

@Controller
public class FrontHomeController {

	@Autowired
	private ProductoService productoService;

	@Autowired
	private CarritoService carritoService;

	@GetMapping({ "/", "/front" })
	public String home(Model model) {
		model.addAttribute("title", "Marketplace").addAttribute("productosDestacados",
				productoService.listaProductoDestacados());
		return "views/front/index";
	}

	@DeleteMapping(value = "carrito/{producto_id}")
	public String deleteMethodName(@PathVariable int producto_id) {

		return "redirect:/";
	}

}