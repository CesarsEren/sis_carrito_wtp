package com.tienda.wtp.carrito.controller;

import com.tienda.wtp.carrito.domain.Usuarios;
import com.tienda.wtp.carrito.repository.UsuarioRepository;
import com.tienda.wtp.carrito.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
public class InitController {

	
	@GetMapping("/")
	public ModelAndView index(HttpSession httpSession) {
		Usuarios usuariosession = null;
		usuariosession =(Usuarios)httpSession.getAttribute("usuario");
		if(usuariosession == null){
			return new ModelAndView("redirect:login");
		}else{
			return new ModelAndView("index");
		}
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/tablero")
	public ModelAndView tablero() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pages/tablero");
		return mav;
	}
	@Autowired
	UsuarioService usuarioService;

	@PostMapping("/ingresar")
	public String ingresar(@RequestParam("usuario") String usuario, @RequestParam("password") String password, HttpSession httpSession){
		Usuarios usuariosession = new Usuarios();
		usuariosession = usuarioService.login(usuario,password);
		usuariosession.setUsuario_password("");
		httpSession.setAttribute("usuario",usuariosession);
		return  "redirect:/";
	}

	@GetMapping("/SESSION")
	public ResponseEntity<?> session(HttpSession httpSession){
		Map<String,Object> rpta = new HashMap<>();
		Usuarios usuariosession = new Usuarios();
		usuariosession =(Usuarios)httpSession.getAttribute("usuario");
		rpta.put("usuario",usuariosession);

		return new ResponseEntity<Map<String,Object>>(rpta, HttpStatus.OK);
	}
}
