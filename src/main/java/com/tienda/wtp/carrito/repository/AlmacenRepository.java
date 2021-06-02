package com.tienda.wtp.carrito.repository;

import java.util.List;

import com.tienda.wtp.carrito.domain.DetalleFormaDeEntrega;
import com.tienda.wtp.carrito.domain.dto.DetalleFormaDeEntregaDto;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.tienda.wtp.carrito.domain.Almacen;
import com.tienda.wtp.carrito.domain.FormaEntrega;
import com.tienda.wtp.carrito.domain.dto.Combobox;

@Repository
@Mapper
public interface AlmacenRepository {

	@Select("select * from almacen")
	public List<Almacen> getalmacenes();

	@Select("select * from almacen where almacen_id = #{almacen_id}")
	public Almacen getalmacen(int almacen_id);

	@Update("update almacen set almacen_estado = #{almacen_estado} where almacen_id = #{almacen_id}")
	public void cambiarestado(int almacen_id, boolean almacen_estado);
	
	@Insert("insert into almacen(almacen_nombre,almacen_direccion,almacen_url_pdf,almacen_whatsaap,almacen_logo,almacen_texto_horario,almacen_url_page_facebook,almacen_url_page_instagram,almacen_url_page_tiktok,almacen_mensaje,almacen_rubro) values(#{almacen_nombre},#{almacen_direccion},#{almacen_url_pdf},#{almacen_whatsaap},#{almacen_logo},#{almacen_texto_horario},#{almacen_url_page_facebook},#{almacen_url_page_instagram},#{almacen_url_page_tiktok},#{almacen_mensaje},#{almacen_rubro})")
	public void registrar(Almacen alm);

	/*UTILS*/
	@Select("select almacen_id as id,almacen_nombre as text from almacen where almacen_estado = 1")
	public List<Combobox> getComboboxAlmacenesActivos();

	@Select("CALL usp_get_allformasentregaByAlmacen (#{almacen_id})")
	public List<DetalleFormaDeEntregaDto> getFormasDeEntrega(int almacen_id);

	@Insert("insert into detalle_formaentrega(formaentrega_id,almacen_id,formaentrega_precio) values(#{formaentrega_id},#{almacen_id},#{formaentrega_precio})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()", keyColumn = "detalle_formaentrega_id", keyProperty = "detalle_formaentrega_id", before = false, resultType = Integer.class)
	public void registrarDetalleFormaEntrega(DetalleFormaDeEntrega alm);
	
	@Update("update detalle_formaentrega set formaentrega_id=#{formaentrega_id},almacen_id=#{almacen_id},formaentrega_precio=#{formaentrega_precio} where detalle_formaentrega_id = #{detalle_formaentrega_id}")
	public void updateFormaEntrega(DetalleFormaDeEntrega alm);
	
	@Delete("delete from detalle_formaentrega where detalle_formaentrega_id = #{detalle_formaentrega_id}")
	public void deleteFormaEntrega(int detalle_formaentrega_id);
}
