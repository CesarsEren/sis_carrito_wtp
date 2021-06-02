package com.tienda.wtp.carrito.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tienda.wtp.carrito.domain.Almacen;
import com.tienda.wtp.carrito.domain.Detalle_atributo;
import com.tienda.wtp.carrito.domain.Detalle_complemento;
import com.tienda.wtp.carrito.domain.Producto;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.domain.dto.Detalle_atributoDTO;
import com.tienda.wtp.carrito.domain.dto.Detalle_complementoDTO;
import com.tienda.wtp.carrito.domain.dto.ProductoDTO;
import com.tienda.wtp.carrito.service.AlmacenService;
import com.tienda.wtp.carrito.service.ProductoService;
import com.tienda.wtp.carrito.utils.ErrorHelp;
import com.tienda.wtp.carrito.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("productos")
public class ProductosController extends ValidatorPadreController {

	@Autowired
	ProductoService productoservice;

	@Autowired
	AlmacenService almacenservice;

	@GetMapping
	public ModelAndView vistaproductos() {
		log.trace("ENTRARON A LA VISTA DE productos");
		return new ModelAndView("pages/productos");
	}

	@GetMapping("/lista")
	public @ResponseBody ResponseEntity<?> listaproductos(@RequestParam("almacen_id") int almacen_id) {
		return new ResponseEntity<List<ProductoDTO>>(productoservice.getproductos(almacen_id), HttpStatus.OK);
	} 

	
	@GetMapping("/lista/{producto_id}")
	public @ResponseBody ResponseEntity<?> almacen(@PathVariable("producto_id") int producto_id) {
		return new ResponseEntity<ProductoDTO>(productoservice.getproducto(producto_id), HttpStatus.OK);
	}

	@PostMapping("/cambiarestado")
	public @ResponseBody ResponseEntity<?> cambiarestado(@RequestParam("producto_id") int producto_id,
			@RequestParam("producto_estado") boolean producto_estado) {
		productoservice.CambiarEstado(producto_id, !producto_estado);
		return new ResponseEntity<Producto>(new Producto(), HttpStatus.OK);
	}

	@PostMapping("/registrar")
	public @ResponseBody ResponseEntity<?> cambiarestado(@RequestBody Producto p) {
		limpiarVariables();
		 productoservice.registrar(p);
		return new ResponseEntity<Producto>(p, HttpStatus.CREATED);
	}
	
	@PostMapping("/actualizar")
	public @ResponseBody ResponseEntity<?> actualizar(@RequestBody Producto p) {
		limpiarVariables();
		
		if(p.getImagen_producto() == null || p.getImagen_producto().isEmpty()) {
			productoservice.actualizarSinImagen(p);
		}else {
			productoservice.actualizar(p);	
		}
		 
		 
		return new ResponseEntity<Producto>(p, HttpStatus.CREATED);
	}
	

	@GetMapping("/almacenes/combo")
	public @ResponseBody ResponseEntity<?> ComboboxAlmacenes() {
		return new ResponseEntity<List<Combobox>>(almacenservice.getComboAlmacenesActivos(), HttpStatus.OK);
	}
	
	
	//DETALLES COMPLEMENTOS
	
	
	 
	@PostMapping("/complementos/registrar")
	public @ResponseBody ResponseEntity<?> complementosregistrar(@RequestBody Detalle_complemento dto) {
		//return new ResponseEntity<List<Detalle_complementoDTO>>(productoservice.getproductosComplementos(producto_id), HttpStatus.OK);
		if(dto.getDetalle_complemento_id()>(10000-1)) {
			productoservice.registroComplemento(dto);	
		}else {
			productoservice.updateComplemento(dto);
		}		
		return new ResponseEntity<Detalle_complemento>(dto,HttpStatus.CREATED);
	}
	
	@DeleteMapping("/complementos/delete/{detalle_complemento_id}")
	public @ResponseBody ResponseEntity<?> complementosdelete(@PathVariable("detalle_complemento_id") int detalle_complemento_id) {
		//return new ResponseEntity<List<Detalle_complementoDTO>>(productoservice.getproductosComplementos(producto_id), HttpStatus.OK);
		productoservice.deleteComplemento(detalle_complemento_id);		
		return new ResponseEntity<String>("ELIMINADO",HttpStatus.OK);
	}
	
	@GetMapping("/lista/complementos/{almacen_id}/{producto_id}")
	public @ResponseBody ResponseEntity<?> listaproductoscomplementos(@PathVariable("producto_id") int producto_id,@PathVariable("almacen_id") int almacen_id) {
		return new ResponseEntity<List<Detalle_complementoDTO>>(productoservice.getproductosComplementos(producto_id,almacen_id), HttpStatus.OK);
	}
	
	//DETALLE ATRIBUTOS
	
	@GetMapping("/lista/atributos/{almacen_id}/{producto_id}")
	public @ResponseBody ResponseEntity<?> listaproductosatributos(@PathVariable("producto_id") int producto_id,@PathVariable("almacen_id") int almacen_id) {
		return new ResponseEntity<List<Detalle_atributoDTO>>(productoservice.getproductosAtributos(producto_id,almacen_id), HttpStatus.OK);
	}
	
	
	@PostMapping("/atributos/registrar")
	public @ResponseBody ResponseEntity<?> atributosregistrar(@RequestBody Detalle_atributo dto) {
		//return new ResponseEntity<List<Detalle_complementoDTO>>(productoservice.getproductosComplementos(producto_id), HttpStatus.OK);
		if(dto.getDetalle_atributo_id()>(10000-1)) {
			productoservice.registroAtributo(dto);	
		}else {
			productoservice.updateAtributo(dto);
		}		
		return new ResponseEntity<Detalle_atributo>(dto,HttpStatus.CREATED);
	}
	
	@DeleteMapping("/atributos/delete/{detalle_complemento_id}")
	public @ResponseBody ResponseEntity<?> atributosdelete(@PathVariable("detalle_complemento_id") int detalle_complemento_id) {
		//return new ResponseEntity<List<Detalle_complementoDTO>>(productoservice.getproductosComplementos(producto_id), HttpStatus.OK);
		productoservice.deleteComplemento(detalle_complemento_id);		
		return new ResponseEntity<String>("ELIMINADO",HttpStatus.OK);
	}
}
