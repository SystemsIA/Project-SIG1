package pe.edu.unsch.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import pe.edu.unsch.dao.ProductoDao;
import pe.edu.unsch.entities.Usuario;

@ControllerAdvice
public class CommonControllerAdvice {

//	@Autowired
//	private ProductoDao productoDao;
//
//	@ModelAttribute
//	public void addAttributes(HttpServletRequest request, Model model) { // recuperacion de session
//		HttpSession session = request.getSession();
//		Usuario usuario = (Usuario) session.getAttribute("usuario");
//
//		// producto
//		model.addAttribute("productosVendedor", productoDao.listaProductosVendedor(usuario.getIdpersona()));
//	}

}
