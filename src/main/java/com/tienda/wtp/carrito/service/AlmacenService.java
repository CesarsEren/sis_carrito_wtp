package com.tienda.wtp.carrito.service;

import java.util.List;

import com.tienda.wtp.carrito.domain.DetalleFormaDeEntrega;
import com.tienda.wtp.carrito.domain.dto.DetalleFormaDeEntregaDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.domain.Almacen;
import com.tienda.wtp.carrito.domain.FormaEntrega;
import com.tienda.wtp.carrito.domain.dto.Combobox;


public interface AlmacenService {

	public List<Almacen> getalmacenes();
	public Almacen getalmacen(int almacen_id); 
	public void cambiarestado(int almacen_id,boolean almacen_estado);
	public void registrar(Almacen alm);
	public List<Combobox> getComboAlmacenesActivos();
	public List<DetalleFormaDeEntregaDto>getFormasDeEntrega(int almacen_id);

	public void registrarDetalleFormaEntrega(DetalleFormaDeEntrega alm);
	public void updateFormaEntrega(DetalleFormaDeEntrega alm);
	public void deleteFormaEntrega(int detalle_formaentrega_id);
}
