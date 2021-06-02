package com.tienda.wtp.carrito.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.repository.EmpresaRepository;
import com.tienda.wtp.carrito.service.EmpresaService;

@Service
public class EmpresaServiceImpl implements EmpresaService{

	@Autowired
	EmpresaRepository empresarepo;
	@Override
	public String getEmpresaFooter() {
		// TODO Auto-generated method stub
		return empresarepo.getEmpresaFooter();
	}

	@Override
	public void registrarEmpresaFooter(String empresa_footer) {
		// TODO Auto-generated method stub
		empresarepo.deleteEmpresaFooter();
		empresarepo.registrarEmpresaFooter(empresa_footer);
	}

}
