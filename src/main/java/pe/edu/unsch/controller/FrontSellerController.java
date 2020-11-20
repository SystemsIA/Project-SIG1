package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.service.ProductoService;

@Controller
@RequestMapping("seller")
public class FrontSellerController {
	
	int n = 2;
	
	@Autowired
	private ProductoService productoService;
	
	@GetMapping("/home")
	public String HomeVendedor() {
		return "views/vendedor/home/index";
	}
	
	@GetMapping("/products")
	public String sellerProducts(Model model) {
		model.addAttribute("productosVendedor", productoService.listaProductosVendedor(n));
		model.addAttribute("nombreVendedor",productoService.listaProductosVendedor(n).get(0).getPersona().getNombre()+" "+
				productoService.listaProductosVendedor(n).get(0).getPersona().getApellido());
		return "views/vendedor/sellerViews/sellerProducts";
	}

}
