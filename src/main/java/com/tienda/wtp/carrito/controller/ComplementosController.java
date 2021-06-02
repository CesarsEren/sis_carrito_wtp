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
import com.tienda.wtp.carrito.domain.Complemento;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.service.AlmacenService;
import com.tienda.wtp.carrito.service.ComplementoService;
import com.tienda.wtp.carrito.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("complementos")
public class ComplementosController extends ValidatorPadreController {

	@Autowired
	ComplementoService Complementoservice;
	@Autowired
	AlmacenService almacenservice;
	@GetMapping
	public ModelAndView vistaComplementos() {
		log.trace("ENTRARON A LA VISTA DE ComplementoS");
		return new ModelAndView("pages/complementos");
	}

	@GetMapping("/lista")
	public @ResponseBody ResponseEntity<?> listaComplementos(@RequestParam("almacen_id") int almacen_id) {
		return new ResponseEntity<List<Complemento>>(Complementoservice.getComplementos(almacen_id), HttpStatus.OK);
	}

	@GetMapping("/lista/{complemento_id}")
	public @ResponseBody ResponseEntity<?> almacen(@PathVariable("complemento_id") int complemento_id) {
		return new ResponseEntity<Complemento>(Complementoservice.getComplemento(complemento_id), HttpStatus.OK);
	}

	@PostMapping("/cambiarestado")
	public @ResponseBody ResponseEntity<?> cambiarestado(@RequestParam("complemento_id") int complemento_id,
			@RequestParam("complemento_estado") boolean complemento_estado) {
		Complementoservice.CambiarEstado(complemento_id, !complemento_estado);
		return new ResponseEntity<Complemento>(new Complemento(), HttpStatus.OK);
	}

	@PostMapping("/registrar")
	public @ResponseBody ResponseEntity<?> registrar(@RequestBody Complemento comp) {
		Complementoservice.InsertComplemento(comp);
		return new ResponseEntity<Complemento>(comp, HttpStatus.CREATED);
	}
	
	@PostMapping("/actualizar")
	public @ResponseBody ResponseEntity<?> actualizar(@RequestBody Complemento comp) {
		Complementoservice.UpdateComplemento(comp);
		return new ResponseEntity<Complemento>(comp, HttpStatus.CREATED);
	}
	
	
	
	@GetMapping("/almacenes/combo")
	public @ResponseBody ResponseEntity<?> ComboboxAlmacenes() {
		return new ResponseEntity<List<Combobox>>(almacenservice.getComboAlmacenesActivos(), HttpStatus.OK);
	}
}
