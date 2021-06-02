package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detalle_complemento {

	Integer detalle_complemento_id;
	Integer producto_id;
	Integer complemento_id;
	Double detalle_complemento_precio;

}
