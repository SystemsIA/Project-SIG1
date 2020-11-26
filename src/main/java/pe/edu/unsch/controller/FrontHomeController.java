package pe.edu.unsch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.service.ProductoCarritoService;
import pe.edu.unsch.service.ProductoService;

@Controller
@RequestMapping
public class FrontHomeController {

	@Autowired
	private ProductoService productoService;

	@Autowired
	private ProductoCarritoService carritoService;

	@GetMapping({ "/", "/front" })
	public String home(Model model, HttpSession httpSession) {

		model.addAttribute("title", "Marketplace").addAttribute("productosDestacados",
				productoService.listaProductoDestacados());

		int idusuario = (int) httpSession.getAttribute("idusuario");
		model.addAttribute("carritoProductos", carritoService.listaProductoCarrito(idusuario));

		return "views/front/index";
	}

	@GetMapping(value = "carrito/{idproducto}")
	public String eliminarProductoCarrito(@PathVariable(name = "idproducto") int idproducto) {
		carritoService.eliminarProductoDeCarrito(idproducto);
		return "redirect:/";
	}

}