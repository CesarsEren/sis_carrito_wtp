package com.tienda.wtp.carrito.domain.dto;
 
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class ProductoDTO {

	public Integer id_producto;
	public Integer almacen_id;
	public String nombre_producto;
	public String imagen_producto;	
	public Double precio_producto;
	public String almacen_detalle;
	public String url;
	public Boolean producto_estado;
	
}
