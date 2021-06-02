package com.tienda.wtp.carrito.service;

import java.util.List;
 

import com.tienda.wtp.carrito.domain.Complemento;

public interface ComplementoService {

	public List<Complemento> getComplementos(int almacen_id);

	public Complemento getComplemento(int Complemento_id);

	public void CambiarEstado(int Complemento_id, boolean Complemento_estado);

	public void InsertComplemento(Complemento comp);

	public void UpdateComplemento(Complemento comp);

}
