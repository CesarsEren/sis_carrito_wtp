package com.tienda.wtp.carrito.domain.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsuariosEdit {


	
	Integer usuario_id;
	String usuario_nombre;
	String usuario_paterno;
	String usuario_materno;
	String usuario_usuario;
	String usuario_password;
	String usuario_nivel;
	Boolean usuario_estado;
	List<Combobox> usuario_almacen;

}
