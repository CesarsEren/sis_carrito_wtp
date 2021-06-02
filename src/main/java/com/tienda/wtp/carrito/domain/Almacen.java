package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Almacen {

	public Integer almacen_id;
	public String almacen_nombre;
	public String almacen_direccion;
	public String almacen_url_pdf;
	public String almacen_whatsaap;
	public String almacen_logo;
	public String almacen_texto_horario;
	public String almacen_url_page_facebook;
	public String almacen_url_page_instagram;
	public String almacen_url_page_tiktok;
	public String almacen_mensaje;
	public Boolean almacen_estado;
	public String almacen_rubro;

}
