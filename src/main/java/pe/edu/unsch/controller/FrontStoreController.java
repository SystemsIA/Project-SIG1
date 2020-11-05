package pe.edu.unsch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FrontStoreController {
	@GetMapping("/store")
	public String store() {
		return "views/front/store";
	}

}
