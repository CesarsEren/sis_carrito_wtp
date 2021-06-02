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
import com.tienda.wtp.carrito.domain.Atributo;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.service.AlmacenService;
import com.tienda.wtp.carrito.service.AtributoService;
import com.tienda.wtp.carrito.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("atributos")
public class AtributosController extends ValidatorPadreController {

	@Autowired
	AtributoService atributoservice;
	@Autowired
	AlmacenService almacenservice;
	@GetMapping
	public ModelAndView vistaatributos() {
		log.trace("ENTRARON A LA VISTA DE ATRIBUTOS");
		return new ModelAndView("pages/atributos");
	}

	@GetMapping("/lista")
	public @ResponseBody ResponseEntity<?> listaatributos(@RequestParam("almacen_id") int almacen_id) {
		return new ResponseEntity<List<Atributo>>(atributoservice.getAtributos(almacen_id), HttpStatus.OK);
	}

	@GetMapping("/lista/{atributo_id}")
	public @ResponseBody ResponseEntity<?> almacen(@PathVariable("atributo_id") int atributo_id) {
		return new ResponseEntity<Atributo>(atributoservice.getAtributo(atributo_id), HttpStatus.OK);
	}

	@PostMapping("/cambiarestado")
	public @ResponseBody ResponseEntity<?> cambiarestado(@RequestParam("atributo_id") int atributo_id,
			@RequestParam("atributo_estado") boolean atributo_estado) {
		atributoservice.CambiarEstado(atributo_id, !atributo_estado);
		return new ResponseEntity<Atributo>(new Atributo(), HttpStatus.OK);
	}

	@PostMapping("/registrar")
	public @ResponseBody ResponseEntity<?> registrar(@RequestBody Atributo attr) {
		atributoservice.InsertAtributo(attr);
		return new ResponseEntity<Atributo>(attr, HttpStatus.CREATED);
	}
	
	@PostMapping("/actualizar")
	public @ResponseBody ResponseEntity<?> actualizar(@RequestBody Atributo attr) {
		atributoservice.UpdateAtributo(attr);
		return new ResponseEntity<Atributo>(attr, HttpStatus.CREATED);
	}
	
	
	@GetMapping("/almacenes/combo")
	public @ResponseBody ResponseEntity<?> ComboboxAlmacenes() {
		return new ResponseEntity<List<Combobox>>(almacenservice.getComboAlmacenesActivos(), HttpStatus.OK);
	}
}
