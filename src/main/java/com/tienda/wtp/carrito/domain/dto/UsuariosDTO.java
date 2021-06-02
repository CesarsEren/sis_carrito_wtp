package com.tienda.wtp.carrito.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UsuariosDTO {
	
	Integer usuario_id;
	String usuario_nombre;
	String usuario_paterno;
	String usuario_materno;
	String usuario_usuario;
	String usuario_password;
	String usuario_nivel;
	Boolean usuario_estado;
}
