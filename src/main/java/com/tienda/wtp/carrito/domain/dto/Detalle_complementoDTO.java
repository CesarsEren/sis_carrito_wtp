package com.tienda.wtp.carrito.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detalle_complementoDTO {

	Integer detalle_complemento_id;
	Integer complemento_id;
	Double precio;
	String estado;
	String complemento_nombre;
	String complemento_precio;
	Integer detalle_complemento_precio;

}
