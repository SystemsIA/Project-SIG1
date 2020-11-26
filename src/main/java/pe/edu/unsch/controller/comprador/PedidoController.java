package pe.edu.unsch.controller.comprador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.service.UsuarioService;

@Controller
@RequestMapping("/client")
public class PedidoController {

	@Autowired
	private UsuarioService compradorService;

	@GetMapping(path = "/{idcomprador}/pedidos")
	public String pedidosPorComprador(@PathVariable(name = "idcomprador", required = true) int idcomprador,
			Model model) {

		model.addAttribute("listaPedidos", compradorService.listarPedidosDeComprador(idcomprador)).addAttribute("title",
				"Mis Pedidos");

		return "views/pedidos/index";

	}

}
