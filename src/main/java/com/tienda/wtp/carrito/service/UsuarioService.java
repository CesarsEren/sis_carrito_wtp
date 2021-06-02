package com.tienda.wtp.carrito.service;

import java.util.List;
import java.util.Set;

import com.tienda.wtp.carrito.domain.Usuarios;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.domain.dto.UsuariosDTO2;
import com.tienda.wtp.carrito.domain.dto.UsuariosEdit;
import com.tienda.wtp.carrito.domain.dto.UsuariosRQ;

public interface UsuarioService {
	
	public List<UsuariosDTO2> getUsuarios();
	public UsuariosEdit getUsuario(int usuario_id);
	public List<Combobox> getComboAlmacenesActivos();
	public void registrar(UsuariosRQ us);
	public void actualizar(UsuariosRQ us);	
	public void CambiarEstado(int usuario_id,boolean usuario_estado);
	public Usuarios login(String usuario,String password);
}
