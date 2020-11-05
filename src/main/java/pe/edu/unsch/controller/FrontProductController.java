package pe.edu.unsch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FrontProductController {
	@GetMapping("/product")
	public String product() {
		return "views/front/product";
	}
	
	@GetMapping(path = "/productos_deseados")
	public String productoDeseadosView(Model model) {
		return "views/productos_deseados/index";
	}
}
