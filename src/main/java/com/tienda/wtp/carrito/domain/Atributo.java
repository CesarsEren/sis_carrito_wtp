package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Atributo {

	public Integer atributo_almacen_id;
	public Integer atributo_id;
	public String atributo_nombre;
	public Boolean atributo_estado;

}
