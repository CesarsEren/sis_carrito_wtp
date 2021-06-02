package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class Producto {

	public Integer id_producto;
	public Integer almacen_id;
	public String nombre_producto;
	public Double precio_producto;
	public String imagen_producto;
	public Boolean producto_estado;
	
}
