package com.tienda.wtp.carrito.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detalle_atributoDTO {

	Integer detalle_atributo_id;
	Integer atributo_id;
	String atributo_nombre;
	Double atributo_precio;
	
}
