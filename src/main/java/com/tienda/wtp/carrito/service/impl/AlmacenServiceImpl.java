package com.tienda.wtp.carrito.service.impl;

import java.util.List;

import com.tienda.wtp.carrito.domain.DetalleFormaDeEntrega;
import com.tienda.wtp.carrito.domain.dto.DetalleFormaDeEntregaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.domain.Almacen;
import com.tienda.wtp.carrito.domain.FormaEntrega;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.repository.AlmacenRepository;
import com.tienda.wtp.carrito.service.AlmacenService;
@Service
public class AlmacenServiceImpl implements AlmacenService {

	@Autowired
	AlmacenRepository almacenrepo;
	
	@Override
	public List<Almacen> getalmacenes() {
		// TODO Auto-generated method stub
		return almacenrepo.getalmacenes();
	}

	@Override
	public void cambiarestado(int almacen_id, boolean almacen_estado) {
		// TODO Auto-generated method stub
		almacenrepo.cambiarestado(almacen_id,almacen_estado);
	}

	@Override
	public Almacen getalmacen(int almacen_id) {
		// TODO Auto-generated method stub
		return almacenrepo.getalmacen(almacen_id);
	}

	@Override
	public List<Combobox> getComboAlmacenesActivos() {
		// TODO Auto-generated method stub
		return almacenrepo.getComboboxAlmacenesActivos();
	}

	@Override
	public void registrar(Almacen alm) {
		// TODO Auto-generated method stub
		almacenrepo.registrar(alm);
	}

	@Override
	public List<DetalleFormaDeEntregaDto> getFormasDeEntrega(int almacen_id) {
		// TODO Auto-generated method stub
		return almacenrepo.getFormasDeEntrega(almacen_id);
	}

	@Override
	public void registrarDetalleFormaEntrega(DetalleFormaDeEntrega alm) {
		almacenrepo.registrarDetalleFormaEntrega(alm);
	}

	@Override
	public void updateFormaEntrega(DetalleFormaDeEntrega alm) {
		almacenrepo.updateFormaEntrega(alm);
	}

	@Override
	public void deleteFormaEntrega(int detalle_formaentrega_id) {
		almacenrepo.deleteFormaEntrega(detalle_formaentrega_id);
	}

}
