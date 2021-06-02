package com.tienda.wtp.carrito.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UsuariosDTO2 {

	Integer usuario_id;
	String usuario_datos;// nombres y apellidos
	String usuario_usuario;
	String usuario_almacen;
	String usuario_password;
	String usuario_nivel;
	Boolean usuario_estado;

}
