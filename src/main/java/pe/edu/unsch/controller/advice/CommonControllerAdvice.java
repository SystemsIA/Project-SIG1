package pe.edu.unsch.controller.advice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import pe.edu.unsch.service.ProductoCarritoService;
import pe.edu.unsch.service.ProductoService;
import pe.edu.unsch.service.UsuarioService;

@ControllerAdvice
public class CommonControllerAdvice {

	@Autowired
	private ProductoService productoService;

	@Autowired
	private ProductoCarritoService carritoService;

	@Autowired
	private UsuarioService usuarioService;

	@ModelAttribute
	public void addAttributes(Authentication authentication, Model model) {

		model.addAttribute("productosDestacados", productoService.listaProductoDestacados());

		try {
			Integer idusuario = usuarioService.usuarioAuthenticated(authentication.getName()).getIdusuario();
			model.addAttribute("username", authentication.getName());
			model.addAttribute("usuario", usuarioService.usuarioAuthenticated(authentication.getName()));

			model.addAttribute("carritoProductos", carritoService.listaProductoCarrito(idusuario));

		} catch (NullPointerException e) {
			model.addAttribute("username", "Anonimo");
			model.addAttribute("carritoProductos", null);
		}

	}

}
