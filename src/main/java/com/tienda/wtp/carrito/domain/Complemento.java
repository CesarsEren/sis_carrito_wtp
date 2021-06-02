package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Complemento {

	public Integer complemento_almacen_id;
	public Integer complemento_id;
	public String complemento_nombre;
	public Double complemento_precio;
	public Boolean complemento_estado;
}
