package com.tienda.wtp.carrito.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import com.tienda.wtp.carrito.domain.FormaEntrega; 
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.service.AlmacenService;
import com.tienda.wtp.carrito.service.FormaEntregaService; 
import com.tienda.wtp.carrito.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("formadeentrega")
public class FormaEntregaController extends ValidatorPadreController {

	
	/*
	 * 
	 * public Integer id_formaentrega;
	public String nombre_formaentrega;
	public Double precio_formaentrega;
	public Boolean formaentrega_estado;
	
	 * */
  @Autowired
  FormaEntregaService formaentregaservice;
  
	@GetMapping
	public ModelAndView vistaforma_entregas() {
		log.trace("ENTRARON A LA VISTA DE forma_entregaS");
		return new ModelAndView("pages/formaentrega");
	}

	@GetMapping("/lista")
	public @ResponseBody ResponseEntity<?> listaforma_entregas() {
		return new ResponseEntity<List<FormaEntrega>>(formaentregaservice.getFormasEntrega(), HttpStatus.OK);
	}

	@GetMapping("/lista/{id_formaentrega}")
	public @ResponseBody ResponseEntity<?> almacen(@PathVariable("id_formaentrega") int id_formaentrega) {
		return new ResponseEntity<FormaEntrega>(formaentregaservice.getFormaEntrega(id_formaentrega), HttpStatus.OK);
	}

	@PostMapping("/cambiarestado")
	public @ResponseBody ResponseEntity<?> cambiarestado(@RequestParam("id_formaentrega") int id_formaentrega,
			@RequestParam("formaentrega_estado") boolean formaentrega_estado) {
		formaentregaservice.CambiarEstado(id_formaentrega, !formaentrega_estado);
		return new ResponseEntity<FormaEntrega>(new FormaEntrega(), HttpStatus.OK);
	}

	
	@PostMapping("/registrar")
	public @ResponseBody ResponseEntity<?> registrar(@RequestBody FormaEntrega attr) {
		formaentregaservice.InsertFormaEntrega(attr);
		return new ResponseEntity<FormaEntrega>(new FormaEntrega(), HttpStatus.CREATED);
	}
	
	@PostMapping("/actualizar")
	public @ResponseBody ResponseEntity<?> actualizar(@RequestBody FormaEntrega attr) {
		formaentregaservice.UpdateFormaEntrega(attr);
		return new ResponseEntity<FormaEntrega>(new FormaEntrega(), HttpStatus.CREATED);
	}
	
}
