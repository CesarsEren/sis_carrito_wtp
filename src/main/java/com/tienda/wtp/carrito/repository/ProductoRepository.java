package com.tienda.wtp.carrito.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.tienda.wtp.carrito.domain.Atributo;
import com.tienda.wtp.carrito.domain.Detalle_atributo;
import com.tienda.wtp.carrito.domain.Detalle_complemento;
import com.tienda.wtp.carrito.domain.Producto;
import com.tienda.wtp.carrito.domain.dto.Detalle_atributoDTO;
import com.tienda.wtp.carrito.domain.dto.Detalle_complementoDTO;
import com.tienda.wtp.carrito.domain.dto.ProductoDTO;

@Repository
@Mapper
public interface ProductoRepository {

	@Select("select prd.*,alm.almacen_nombre from producto prd inner join almacen alm on prd.almacen_id = alm.almacen_id where prd.almacen_id = #{almacen_id}")
	public List<ProductoDTO> getproductos(int almacen_id);

	@Select("select prd.*,alm.almacen_nombre from producto prd inner join almacen alm on prd.almacen_id = alm.almacen_id where id_producto = ${id_producto}")
	public ProductoDTO getproducto(int id_producto);

	@Update("update producto set producto_estado = #{producto_estado} where id_producto = #{id_producto}")
	public void CambiarEstado(int id_producto, boolean producto_estado);

	@Insert("insert into producto(almacen_id,nombre_producto,precio_producto,imagen_producto) values (#{almacen_id},#{nombre_producto},#{precio_producto},#{imagen_producto,jdbcType=BLOB})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyColumn = "id_producto", keyProperty = "id_producto", before = false, resultType = Integer.class)
	public Producto Insertproducto(Producto prd);

	@Insert("insert into producto(almacen_id,nombre_producto,precio_producto,imagen_producto) values (#{almacen_id},#{nombre_producto},#{precio_producto},#{imagen_producto})")
	public void registrar(Producto p);

	@Update("update producto set almacen_id=#{almacen_id},nombre_producto=#{nombre_producto},precio_producto=#{precio_producto},imagen_producto=#{imagen_producto} where id_producto = #{id_producto}")
	public void actualizar(Producto p);

	@Update("update producto set almacen_id=#{almacen_id},nombre_producto=#{nombre_producto},precio_producto=#{precio_producto} where id_producto = #{id_producto}")
	public void actualizarSinImagen(Producto p);

	// DETALLE COMPLEMENTOS
	@Select("call usp_get_allcomplementos (#{producto_id},#{almacen_id})")
	public List<Detalle_complementoDTO> usp_get_allcomplementos(int producto_id,int almacen_id);

	@Insert("insert into detalle_complemento(producto_id,complemento_id,detalle_complemento_precio) values(#{producto_id},#{complemento_id},#{detalle_complemento_precio})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyColumn = "detalle_complemento_id", keyProperty = "detalle_complemento_id", before = false, resultType = Integer.class)
	public void insertComplemento(Detalle_complemento prd);

	@Update("update detalle_complemento set detalle_complemento_precio=#{detalle_complemento_precio} where detalle_complemento_id=#{detalle_complemento_id}")
	public void updateComplemento(Detalle_complemento prd);

	@Delete("delete from detalle_complemento where detalle_complemento_id = #{detalle_complemento_id}")
	public void deleteComplemento(int detalle_complemento_id);

	// DETALLE ATRIBUTOS

	@Select("call usp_get_allatributos (#{producto_id},#{almacen_id})")
	public List<Detalle_atributoDTO> usp_getallAtributos(int producto_id,int almacen_id);
 
	@Insert("insert into detalle_atributo(producto_id,atributo_id,atributo_precio) values(#{producto_id},#{atributo_id},#{atributo_precio})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyColumn = "detalle_atributo_id", keyProperty = "detalle_atributo_id", before = false, resultType = Integer.class)
	public void insertAtributo(Detalle_atributo dta);

	@Update("update detalle_atributo set atributo_precio=#{atributo_precio} where detalle_atributo_id=#{detalle_atributo_id}")
	public void updateAtributo(Detalle_atributo dta);

	@Delete("delete from detalle_atributo where detalle_atributo_id = #{detalle_atributo_id}")
	public void deleteAtributo(int detalle_atributo_id);

	
}
