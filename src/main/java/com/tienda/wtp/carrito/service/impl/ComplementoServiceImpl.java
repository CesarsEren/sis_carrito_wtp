package com.tienda.wtp.carrito.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.domain.Complemento;
import com.tienda.wtp.carrito.repository.ComplementoRepository;
import com.tienda.wtp.carrito.service.ComplementoService;

@Service
public class ComplementoServiceImpl implements ComplementoService {

	@Autowired
	ComplementoRepository complementorepo;
	
	@Override
	public List<Complemento> getComplementos(int almacen_id) {
		// TODO Auto-generated method stub
		return complementorepo.getComplementos(almacen_id);
	}

	@Override
	public Complemento getComplemento(int Complemento_id) {
		// TODO Auto-generated method stub
		return complementorepo.getComplemento(Complemento_id);
	}

	@Override
	public void CambiarEstado(int Complemento_id, boolean Complemento_estado) {
		// TODO Auto-generated method stub
		complementorepo.CambiarEstado(Complemento_id, Complemento_estado);
	}

	@Override
	public void InsertComplemento(Complemento comp) {
		// TODO Auto-generated method stub
		  complementorepo.InsertComplemento(comp);
	}

	@Override
	public void UpdateComplemento(Complemento comp) {
		// TODO Auto-generated method stub
		complementorepo.UpdateComplemento(comp);
	}

}
