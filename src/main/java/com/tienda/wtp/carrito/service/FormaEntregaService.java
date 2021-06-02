package com.tienda.wtp.carrito.service;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.tienda.wtp.carrito.domain.Atributo;
import com.tienda.wtp.carrito.domain.FormaEntrega;

public interface FormaEntregaService {

	public List<FormaEntrega> getFormasEntrega();

	public FormaEntrega getFormaEntrega(int id_formaentrega);

	public void CambiarEstado(int id_formaentrega, boolean formaentrega_estado);

	public void InsertFormaEntrega(FormaEntrega frm);
	
	public void UpdateFormaEntrega(FormaEntrega frm);
	

}
