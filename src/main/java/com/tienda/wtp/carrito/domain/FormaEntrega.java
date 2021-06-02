package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FormaEntrega {
	
	public Integer detalle_formaentrega_id;
	public Integer id_formaentrega;
	public String nombre_formaentrega;
	public Double precio_formaentrega;
	public Boolean formaentrega_estado;

}
