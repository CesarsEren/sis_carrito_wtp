package com.tienda.wtp.carrito.service;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.tienda.wtp.carrito.domain.Atributo;

public interface AtributoService {

	public List<Atributo> getAtributos(int almacen_id);

	public Atributo getAtributo(int atributo_id);

	public void CambiarEstado(int atributo_id, boolean atributo_estado);

	public void InsertAtributo(Atributo attr);

	public void UpdateAtributo(Atributo attr);
}
