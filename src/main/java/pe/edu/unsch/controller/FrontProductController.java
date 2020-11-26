package pe.edu.unsch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import pe.edu.unsch.entities.Producto;
import pe.edu.unsch.service.ProductoService;
import pe.edu.unsch.service.ProductosJuntosService;
import pe.edu.unsch.service.UsuarioService;

@Controller
public class FrontProductController {
	
	@Autowired
	private ProductoService productoService;
	
	@Autowired
	private ProductosJuntosService listaRelacion;
	
	@Autowired
	private UsuarioService usuarioService;

	@GetMapping(value = "/product/{id_producto}")
	public String product( @PathVariable( name = "id_producto") long id_producto, Model model){
		Producto detalleprod = productoService.mostrardetalles(id_producto);

		List<Producto> listarelacionjuntos = listaRelacion.ListarProductosJuntosH(id_producto);
		model.addAttribute("detalleprod", detalleprod);
		model.addAttribute("ProductosJuntos", listarelacionjuntos); 
		return "views/front/product";
	}
	 	
	@GetMapping(path = "/productos_deseados/{id_usuario}")
	public String productoDeseadosView( @PathVariable( name = "id_usuario") int id_usuario, Model model){
		
		List<Producto> deseados  = usuarioService.listarProductosDeseados(id_usuario);
		model.addAttribute("deseados", deseados );
		return "views/productos_deseados/index";
	}
}
