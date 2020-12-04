package pe.edu.unsch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.service.ProductoCarritoService;
import pe.edu.unsch.service.ProductoService;

@Controller
@RequestMapping({"/"})
public class FrontHomeController {

	@Autowired
	private ProductoService productoService;

	@Autowired
	private ProductoCarritoService carritoService;

	@GetMapping({"/front","/"})
	public String home(Model model, HttpSession httpSession) {

		model.addAttribute("title", "Marketplace").addAttribute("productosDestacados",
				productoService.listaProductoDestacados());
		
		try {
			
			Usuario user = (Usuario) httpSession.getAttribute("usuario");
			model.addAttribute("carritoProductos", carritoService.listaProductoCarrito(user.getIdusuario()));
		} catch (NullPointerException e) {
			return "views/front/index";
		}

		return "views/front/index";
	}

	@GetMapping("/carrito/{idproducto}")
	public String eliminarProductoCarrito(@PathVariable(name = "idproducto") long idproducto,
			RedirectAttributes redirectAttributes, Model model) {
		carritoService.eliminarProductoDeCarrito(idproducto);
		redirectAttributes.addFlashAttribute("message", "Se quito un producto de su carrito");
		return "redirect:/";
	}

}