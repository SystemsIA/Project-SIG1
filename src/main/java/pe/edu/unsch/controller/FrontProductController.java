package pe.edu.unsch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping(value = "/product", params = { "idproducto" })
	public String product(@RequestParam(value = "idproducto", required = false) Long idproducto, Model model) {
		Producto detalleprod = productoService.traerProducto(idproducto);

		List<Producto> listarelacionjuntos = listaRelacion.ListarProductosJuntosH(idproducto);
		model.addAttribute("detalleprod", detalleprod);
		model.addAttribute("ProductosJuntos", listarelacionjuntos);

		model.addAttribute("title", detalleprod.getNombre());
		return "views/front/product";
	}

	@GetMapping(path = "/productos_deseados", params = { "id_usuario" })
	public String productoDeseadosView(@RequestParam(value = "id_usuario", required = true) int id_usuario,
			Model model) {

		List<Producto> deseados = usuarioService.listarProductosDeseados(id_usuario);
		model.addAttribute("deseados", deseados);

		model.addAttribute("title", "Mis producto deseados");

		return "views/productos_deseados/index";
	}
}
