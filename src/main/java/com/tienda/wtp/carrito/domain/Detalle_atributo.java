package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detalle_atributo {

	Integer detalle_atributo_id;
	Integer atributo_id;
	Integer producto_id;
	String atributo_nombre;
	Double atributo_precio;
}
