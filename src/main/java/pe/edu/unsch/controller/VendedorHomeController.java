package pe.edu.unsch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("vendedor")
public class VendedorHomeController {
	
	@GetMapping("/home")
	public String HomeVendedor() {
		return "views/vendedor/home/index";
	}

}
