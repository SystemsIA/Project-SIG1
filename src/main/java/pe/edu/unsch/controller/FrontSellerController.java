package pe.edu.unsch.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.service.ProductoService;

@Controller
@RequestMapping("seller")
public class FrontSellerController {
	
	
	@Autowired
	private ProductoService productoService;
	
	@GetMapping("/home")
	public String HomeVendedor() {
		return "views/vendedor/home/index";
	}
	
	@GetMapping("/{idVendedor}/products")
	public String sellerProducts(@PathVariable(name="idVendedor") Integer idVendedor, Model model) {
		model.addAttribute("productosVendedor", productoService.listaProductosVendedor( idVendedor));
		/*
		 * model.addAttribute("nombreVendedor",productoService.listaProductosVendedor(
		 * idVendedor).get(0).getPersona().getNombre()+" "+
		 * productoService.listaProductosVendedor(idVendedor).get(0).getPersona().
		 * getApellido());
		 */
		return "views/vendedor/sellerViews/sellerProducts";
	}

}
