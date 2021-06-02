package com.tienda.wtp.carrito.controller;

import java.util.List;

import com.tienda.wtp.carrito.domain.DetalleFormaDeEntrega;
import com.tienda.wtp.carrito.domain.dto.DetalleFormaDeEntregaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import com.tienda.wtp.carrito.domain.FormaEntrega;
import com.tienda.wtp.carrito.service.AlmacenService;
import com.tienda.wtp.carrito.utils.ValidatorPadreController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("almacen")
public class AlmacenController extends ValidatorPadreController {

    @Autowired
    AlmacenService almacenservice;

    // @GetMapping("almacen")
    @GetMapping
    public ModelAndView vistaalmacen() {
        log.trace("ENTRARON A LA VISTA DE ALMACEN");
        return new ModelAndView("pages/almacen");
    }

    @GetMapping("/lista")
    public @ResponseBody
    ResponseEntity<?> listaalmacenes() {
        return new ResponseEntity<List<Almacen>>(almacenservice.getalmacenes(), HttpStatus.OK);
    }

    @GetMapping("/lista/{almacen_id}")
    public @ResponseBody
    ResponseEntity<?> almacen(@PathVariable("almacen_id") int almacen_id) {
        return new ResponseEntity<Almacen>(almacenservice.getalmacen(almacen_id), HttpStatus.OK);
    }

    @PostMapping("/cambiarestado")
    public @ResponseBody
    ResponseEntity<?> cambiarestado(@RequestParam("almacen_id") int almacen_id,
                                    @RequestParam("almacen_estado") boolean almacen_estado) {
        almacenservice.cambiarestado(almacen_id, !almacen_estado);
        return new ResponseEntity<Almacen>(new Almacen(), HttpStatus.OK);
    }

    @PostMapping("/registrar")
    public @ResponseBody
    ResponseEntity<?> registrar(@RequestBody Almacen alm) {
        /* almacenservice.cambiarestado(almacen_id, !almacen_estado); */
        almacenservice.registrar(alm);
        return new ResponseEntity<Almacen>(new Almacen(), HttpStatus.OK);
    }

    // Formas de Entrega

    @GetMapping("/lista/formaentrega/{almacen_id}")
    public @ResponseBody
    ResponseEntity<?> listaformaentrega(@PathVariable("almacen_id") int almacen_id) {
        return new ResponseEntity<List<DetalleFormaDeEntregaDto>>(almacenservice.getFormasDeEntrega(almacen_id), HttpStatus.OK);
    }

    @PostMapping("/formaentrega/registrar")
    public @ResponseBody
    ResponseEntity<?> registrarDetalleFormaEntrega(@RequestBody DetalleFormaDeEntrega dfe) {
        if (dfe.getDetalle_formaentrega_id() >= 10000 && dfe.getDetalle_formaentrega_id() != null) {
            almacenservice.registrarDetalleFormaEntrega(dfe);
        } else {
            almacenservice.updateFormaEntrega(dfe);
        }
        return new ResponseEntity<DetalleFormaDeEntrega>(dfe, HttpStatus.OK);
    }

    @DeleteMapping("/formaentrega/delete/{detalle_formaentrega_id}")
    public @ResponseBody
    ResponseEntity<?> deleteDetalleFormaEntrega(@PathVariable("detalle_formaentrega_id") int detalle_formaentrega_id) {
        almacenservice.deleteFormaEntrega(detalle_formaentrega_id);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}
