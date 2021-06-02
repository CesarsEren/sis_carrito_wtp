package com.tienda.wtp.carrito.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.domain.FormaEntrega;
import com.tienda.wtp.carrito.repository.FormaEntregaRepository;
import com.tienda.wtp.carrito.service.FormaEntregaService;

@Service
public class FormaEntregaServiceImpl implements FormaEntregaService {

	@Autowired
	FormaEntregaRepository formaentregarepo;

	@Override
	public List<FormaEntrega> getFormasEntrega() {
		// TODO Auto-generated method stub
		return formaentregarepo.getFormasEntrega();
	}

	@Override
	public FormaEntrega getFormaEntrega(int id_formaentrega) {
		// TODO Auto-generated method stub
		return formaentregarepo.getFormaEntrega(id_formaentrega);
	}

	@Override
	public void CambiarEstado(int id_formaentrega, boolean formaentrega_estado) {
		// TODO Auto-generated method stub
		formaentregarepo.CambiarEstado(id_formaentrega, formaentrega_estado);
	}

	@Override
	public void InsertFormaEntrega(FormaEntrega frm) {
		// TODO Auto-generated method stub
		formaentregarepo.InsertFormaEntrega(frm);
	}

	@Override
	public void UpdateFormaEntrega(FormaEntrega frm) {
		// TODO Auto-generated method stub
		formaentregarepo.UpdateFormaEntrega(frm);
	}

}
