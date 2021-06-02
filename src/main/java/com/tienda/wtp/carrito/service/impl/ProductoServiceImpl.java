package com.tienda.wtp.carrito.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tienda.wtp.carrito.domain.Detalle_atributo;
import com.tienda.wtp.carrito.domain.Detalle_complemento;
import com.tienda.wtp.carrito.domain.Producto;
import com.tienda.wtp.carrito.domain.dto.Detalle_atributoDTO;
import com.tienda.wtp.carrito.domain.dto.Detalle_complementoDTO;
import com.tienda.wtp.carrito.domain.dto.ProductoDTO;
import com.tienda.wtp.carrito.repository.ProductoRepository;
import com.tienda.wtp.carrito.service.ProductoService;

@Service
public class ProductoServiceImpl implements ProductoService {

	@Autowired
	ProductoRepository productorepo;

	@Override
	public List<ProductoDTO> getproductos(int almacen_id) {
		// TODO Auto-generated method stub
		return productorepo.getproductos(almacen_id);
	}

	@Override
	public ProductoDTO getproducto(int id_producto) {
		// TODO Auto-generated method stub
		return productorepo.getproducto(id_producto);
	}

	@Override
	public void CambiarEstado(int id_producto, boolean atributo_estado) {
		// TODO Auto-generated method stub
		productorepo.CambiarEstado(id_producto, atributo_estado);
	}

	@Override
	public Producto Insertproducto(Producto prd) {
		// TODO Auto-generated method stub
		return productorepo.Insertproducto(prd);
	}

	@Override
	public void registrar(Producto p) {
		// TODO Auto-generated method stub
		productorepo.registrar(p);
	}

	@Override
	public void actualizar(Producto p) {
		// TODO Auto-generated method stub
		productorepo.actualizar(p);
	}

	@Override
	public void actualizarSinImagen(Producto p) {
		// TODO Auto-generated method stub
		productorepo.actualizarSinImagen(p);
	}

	@Override
	public List<Detalle_atributoDTO> getproductosAtributos(int producto_id, int almacen_id) {
		// TODO Auto-generated method stub
		return productorepo.usp_getallAtributos(producto_id, almacen_id);
	}

	@Override
	public List<Detalle_complementoDTO> getproductosComplementos(int producto_id, int almacen_id) {
		// TODO Auto-generated method stub
		return productorepo.usp_get_allcomplementos(producto_id, almacen_id);
	}

	@Override
	public void registroComplemento(Detalle_complemento dc) {
		// TODO Auto-generated method stub
		productorepo.insertComplemento(dc);
	}

	@Override
	public void deleteComplemento(int producto_id) {
		// TODO Auto-generated method stub
		productorepo.deleteComplemento(producto_id);
	}

	@Override
	public void updateComplemento(Detalle_complemento dc) {
		// TODO Auto-generated method stub
		productorepo.updateComplemento(dc);
	}

	@Override
	public void registroAtributo(Detalle_atributo dc) {
		// TODO Auto-generated method stub
		productorepo.insertAtributo(dc);
	}

	@Override
	public void deleteAtributo(int producto_id) {
		// TODO Auto-generated method stub
		productorepo.deleteAtributo(producto_id);
	}

	@Override
	public void updateAtributo(Detalle_atributo dc) {
		// TODO Auto-generated method stub
		productorepo.updateAtributo(dc);
	}

}
