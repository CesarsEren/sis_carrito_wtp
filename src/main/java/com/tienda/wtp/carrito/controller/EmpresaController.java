package com.tienda.wtp.carrito.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.tienda.wtp.carrito.service.EmpresaService;

import lombok.extern.slf4j.Slf4j;
 

@Controller
@Slf4j
@RequestMapping("empresa")
public class EmpresaController {

	@Autowired
	EmpresaService empservice;

	@GetMapping
	public ModelAndView vistaEmpresa() {
		ModelAndView MAV = new ModelAndView("pages/empresa");
		MAV.addObject("empresa_footer", empservice.getEmpresaFooter());
		return MAV;
	}

	@PostMapping("/registrar")
	public String registrar(@RequestParam("mensajefooter") String mensajefooter) {
		log.info(mensajefooter);
		empservice.registrarEmpresaFooter(mensajefooter);
		//return new ResponseEntity<Map<String, Object>>(HttpStatus.ACCEPTED);
		return "redirect:/#/empresa";
	}

}
