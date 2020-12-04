package pe.edu.unsch.controller.handler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class HandlerController {
	
	@GetMapping("/403")
	public String unathorized403() {
		return "views/handlers/403";
	}
	
}
