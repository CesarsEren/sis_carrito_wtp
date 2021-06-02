package com.tienda.wtp.carrito.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tienda.wtp.carrito.domain.Almacen;
import com.tienda.wtp.carrito.domain.Atributo;
import com.tienda.wtp.carrito.domain.Producto;
import com.tienda.wtp.carrito.domain.Usuarios;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.domain.dto.ProductoDTO;
import com.tienda.wtp.carrito.domain.dto.UsuariosDTO2;
import com.tienda.wtp.carrito.domain.dto.UsuariosEdit;
import com.tienda.wtp.carrito.domain.dto.UsuariosRQ;
import com.tienda.wtp.carrito.service.AlmacenService;
import com.tienda.wtp.carrito.service.UsuarioService;
import com.tienda.wtp.carrito.utils.ErrorHelp;
import com.tienda.wtp.carrito.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("usuarios")
public class UsuariosController extends ValidatorPadreController {

	@Autowired
	UsuarioService usuarioservice;

	@GetMapping
	public ModelAndView vistausuarios() {
		log.trace("ENTRARON A LA VISTA DE usuarios");
		return new ModelAndView("pages/usuarios");
	}

	@GetMapping("/lista")
	public @ResponseBody ResponseEntity<?> listausuarios() {
		return new ResponseEntity<List<UsuariosDTO2>>(usuarioservice.getUsuarios(), HttpStatus.OK);
	}

	@GetMapping("/lista/{usuario_id}")
	public @ResponseBody ResponseEntity<?> usuario(@PathVariable("usuario_id") int usuario_id) {
		return new ResponseEntity<UsuariosEdit>(usuarioservice.getUsuario(usuario_id), HttpStatus.OK);
	}
	
	@GetMapping("/almacenes/combo")
	public @ResponseBody ResponseEntity<?> ComboboxAlmacenes() {
		return new ResponseEntity<List<Combobox>>(usuarioservice.getComboAlmacenesActivos(), HttpStatus.OK);
	}

	@PostMapping("/registrar")
	public @ResponseBody ResponseEntity<?> registrar(@RequestBody UsuariosRQ us) {
		limpiarVariables();
		usuarioservice.registrar(us);
		return new ResponseEntity<UsuariosRQ>(us, HttpStatus.CREATED);		
	}
	
	@PostMapping("/actualizar")
	public @ResponseBody ResponseEntity<?> actualizar(@RequestBody UsuariosRQ us) {
		limpiarVariables();
		usuarioservice.actualizar(us);
		return new ResponseEntity<UsuariosRQ>(us, HttpStatus.CREATED);		
	}

	@PostMapping("/cambiarestado")
	public @ResponseBody ResponseEntity<?> cambiarestado(@RequestParam("usuario_id") int usuario_id,
			@RequestParam("usuario_estado") boolean usuario_estado) {
		usuarioservice.CambiarEstado(usuario_id, !usuario_estado);
		return new ResponseEntity<Usuarios>(new Usuarios(), HttpStatus.OK);
	}
	
}
