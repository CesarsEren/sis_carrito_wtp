package com.tienda.wtp.carrito.service;

import java.util.List;

import com.tienda.wtp.carrito.domain.Detalle_atributo;
import com.tienda.wtp.carrito.domain.Detalle_complemento;
import com.tienda.wtp.carrito.domain.Producto;
import com.tienda.wtp.carrito.domain.dto.Detalle_atributoDTO;
import com.tienda.wtp.carrito.domain.dto.Detalle_complementoDTO;
import com.tienda.wtp.carrito.domain.dto.ProductoDTO;

public interface ProductoService {

	public List<ProductoDTO> getproductos(int almacen_id);

	public ProductoDTO getproducto(int id_producto);

	public void CambiarEstado(int id_producto, boolean atributo_estado);

	public Producto Insertproducto(Producto prd);

	public void registrar(Producto p);

	public void actualizar(Producto p);

	public void actualizarSinImagen(Producto p);

	public List<Detalle_complementoDTO> getproductosComplementos(int producto_id,int almacen_id);

	public void registroComplemento(Detalle_complemento dc);

	public void deleteComplemento(int producto_id);

	public void updateComplemento(Detalle_complemento dc);

	public List<Detalle_atributoDTO> getproductosAtributos(int producto_id,int almacen_id);

	public void registroAtributo(Detalle_atributo dc);

	public void deleteAtributo(int producto_id);

	public void updateAtributo(Detalle_atributo dc);

}
