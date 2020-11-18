package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.ProductoService;

@Controller
public class FrontProductController {
	
	@Autowired
	private ProductoService productoService;

	@GetMapping(value = "/product/{id_producto}")
	public String product( @PathVariable(name = "id_producto") long id_producto, Model model){
		Producto detalleprod = productoService.mostrardetalles(id_producto);
		model.addAttribute("detalleprod", detalleprod);
		return "views/front/product";
	}
	
	@GetMapping(path = "/productos_deseados")
	public String productoDeseadosView(Model model) {
		return "views/productos_deseados/index";
	}
}
