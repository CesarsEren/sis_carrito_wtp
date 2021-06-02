package com.tienda.wtp.carrito.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.domain.Atributo;
import com.tienda.wtp.carrito.repository.AtributoRepository;
import com.tienda.wtp.carrito.service.AtributoService;

@Service
public class AtributoServiceImpl implements AtributoService {

	@Autowired
	AtributoRepository atributorepo;

	@Override
	public List<Atributo> getAtributos(int almacen_id) {
		// TODO Auto-generated method stub
		return atributorepo.getAtributos(almacen_id);
	}

	@Override
	public Atributo getAtributo(int atributo_id) {
		// TODO Auto-generated method stub
		return atributorepo.getAtributo(atributo_id);
	}

	@Override
	public void CambiarEstado(int atributo_id, boolean atributo_estado) {
		// TODO Auto-generated method stub
		  atributorepo.CambiarEstado(atributo_id, atributo_estado);
	}

	@Override
	public void InsertAtributo(Atributo attr) {
		// TODO Auto-generated method stub
		  atributorepo.InsertAtributo(attr);
	}

	@Override
	public void UpdateAtributo(Atributo attr) {
		// TODO Auto-generated method stub
		atributorepo.UpdateAtributo(attr);		
	}

}
