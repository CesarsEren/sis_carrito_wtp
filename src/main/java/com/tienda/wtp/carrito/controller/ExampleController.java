package com.tienda.wtp.carrito.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("example")
public class ExampleController {

	@GetMapping
	public ModelAndView vistaExample() {
		log.trace("ENTRARON A LA VISTA DE Example");
		return new ModelAndView("pages/example");
	}
}
