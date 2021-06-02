package com.tienda.wtp.carrito.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tienda.wtp.carrito.domain.Usuarios;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.controller.AtributosController;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.domain.dto.UsuariosDTO2;
import com.tienda.wtp.carrito.domain.dto.UsuariosEdit;
import com.tienda.wtp.carrito.domain.dto.UsuariosRQ;
import com.tienda.wtp.carrito.repository.AlmacenRepository;
import com.tienda.wtp.carrito.repository.UsuarioRepository;
import com.tienda.wtp.carrito.service.UsuarioService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	private UsuarioRepository usuariorepo;

	@Autowired
	private AlmacenRepository almacenrepository;

	@Override
	public List<UsuariosDTO2> getUsuarios() {

		List<UsuariosDTO2> res = new ArrayList<>();
		Set<UsuariosDTO2> listaResponse = new HashSet<UsuariosDTO2>();
		List<UsuariosDTO2> listaUsuarios = usuariorepo.getUsuarios();
		listaResponse.addAll(listaUsuarios);
		for (UsuariosDTO2 objset : listaResponse) {
			String arrayalm = "";
			for(Combobox cbo : usuariorepo.almacenPorUsuarioId(objset.getUsuario_id())){
				arrayalm += cbo.getText()+",";
			}
			objset.setUsuario_almacen(arrayalm.substring(0,arrayalm.length()-1));
		}
		res.addAll(listaResponse);
		return res;
	}

	@Override
	public List<Combobox> getComboAlmacenesActivos() {
		// TODO Auto-generated method stub
		return almacenrepository.getComboboxAlmacenesActivos();
	}

	@Override
	public void registrar(UsuariosRQ us) {
		// TODO Auto-generated method stub 
		usuariorepo.registrar(us);
		us.getUsuario_almacen().stream().forEach((p) -> {
			usuariorepo.registrarDetalleAlmacen(us.getUsuario_id(), p.getId());
		});
	}

	@Override
	public void CambiarEstado(int usuario_id, boolean usuario_estado) {
		// TODO Auto-generated method stub
		usuariorepo.CambiarEstado(usuario_id, usuario_estado);
	}

	@Override
	public Usuarios login(String usuario, String password) {
		return usuariorepo.login(usuario,password);
	}

	@Override
	public UsuariosEdit getUsuario(int usuario_id) {
		// TODO Auto-generated method stub
		UsuariosEdit us_get = usuariorepo.getUsuario(usuario_id);
		us_get.setUsuario_almacen(usuariorepo.almacenPorUsuarioId(usuario_id));
		return us_get;
	}

	@Override
	public void actualizar(UsuariosRQ us) {
		// TODO Auto-generated method stub
		usuariorepo.actualizar(us);
		
		usuariorepo.eliminarDetalleAlmacen(us.getUsuario_id());
		us.getUsuario_almacen().stream().forEach((p) -> {
			usuariorepo.registrarDetalleAlmacen(us.getUsuario_id(), p.getId());
		});
		
	}

}
