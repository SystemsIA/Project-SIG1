package pe.edu.unsch.controller.vendedor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.unsch.annotation.permisos.IsVendedor;
import pe.edu.unsch.service.CategoriaProductoService;
import pe.edu.unsch.service.CategoriaService;
import pe.edu.unsch.service.ProductoService;

@IsVendedor
@Controller
@RequestMapping("seller")
public class FrontSellerController {

	@Autowired
	private ProductoService productoService;

	@Autowired
	private CategoriaService categoriaService;

	@Autowired
	private CategoriaProductoService categoriaProductoService;

	@GetMapping({ "/home", "" })
	public String HomeVendedor(Model model) {
		model.addAttribute("title", "Vendedor");
		return "views/vendedor/home/index";
	}

	@GetMapping("/{idVendedor}/products")
	public String sellerProducts(@PathVariable(name = "idVendedor") Integer idVendedor, Model model) {
		model.addAttribute("productosVendedor", productoService.listaProductosVendedor(idVendedor));

		return "views/vendedor/sellerViews/sellerProducts";
	}

	@GetMapping(value = "/{idVendedor}/categoria/products")
	public String getMethodName(@PathVariable(name = "idVendedor") Integer idVendedor, Model model) {

		model.addAttribute("productosVendedor", productoService.listaProductosVendedor(idVendedor));
		model.addAttribute("categorias", categoriaService.listaCategoriVendedor(idVendedor));

		return "views/vendedor/sellerViews/categoriaProducts";
	}

	@GetMapping(value = "/categoria/quitar/{idproducto}")
	public String eliminarProductoCategoria(@PathVariable Integer idproducto, RedirectAttributes redirectAttributes) {

		try {
			categoriaProductoService.eliminarCategoriaProducto(idproducto);
		} catch (IncorrectResultSizeDataAccessException e) {
			return "redirect:/seller/home";
		}

		redirectAttributes.addFlashAttribute("message", "El producto fue eliminado de esta categoria");

		return "redirect:/seller/home";
	}

}
