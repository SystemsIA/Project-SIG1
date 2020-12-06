package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.unsch.annotation.permisos.IsComprador;
import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.entities.Usuario;
import pe.edu.unsch.service.CarritoService;
import pe.edu.unsch.service.ProductoCarritoService;
import pe.edu.unsch.service.ProductoService;
import pe.edu.unsch.service.UsuarioService;

@Controller
@RequestMapping({ "/" })
public class FrontHomeController {

	@Autowired
	private ProductoCarritoService productoCarritoService;

	@Autowired
	private CarritoService carritoService;

	@Autowired
	private ProductoService productoService;

	@Autowired
	private UsuarioService usuarioService;

	@GetMapping({ "/front", "/" })
	public String home(Model model) {
		model.addAttribute("title", "Inicio");

		return "views/front/index";
	}

	@GetMapping(path = "/carrito", params = { "idproducto" })
	public String eliminarProductoCarrito(@RequestParam(name = "idproducto") long idproducto,
			RedirectAttributes redirectAttributes, Model model) {
		productoCarritoService.eliminarProductoDeCarrito(idproducto);
		redirectAttributes.addFlashAttribute("message", "Se quito un producto de su carrito");
		return "redirect:/";
	}

	@IsComprador
	@GetMapping(path = "/carrito/agregarproducto", params = { "idproducto" })
	public String agrearProductoCarrito(@RequestParam(value = "idproducto", required = true) int idproducto,
			Authentication auth, RedirectAttributes attributes) {
		try {
			if (auth.isAuthenticated()) {

				Usuario usuario = usuarioService.usuarioAuthenticated(auth.getName());

				Producto producto = productoService.traerProducto(idproducto);

				carritoService.agregarProductoACarrito(producto, usuario);

				return "redirect:/";
			} else {
				return "redirect:/login";
			}

		} catch (NullPointerException e) {
			return "redirect:/";
		}
	}

}