package com.tienda.wtp.carrito.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.tienda.wtp.carrito.domain.Atributo;
import com.tienda.wtp.carrito.domain.FormaEntrega;

@Repository
@Mapper
public interface FormaEntregaRepository {
	
	@Select("select * from formaentrega")
	public List<FormaEntrega> getFormasEntrega();
	
	@Select("select * from formaentrega where id_formaentrega = ${id_formaentrega}")
	public FormaEntrega getFormaEntrega(int id_formaentrega);
	
	@Update("update formaentrega set formaentrega_estado = #{formaentrega_estado} where id_formaentrega = #{id_formaentrega}")
	public void CambiarEstado(int id_formaentrega,boolean formaentrega_estado);
	
	@Insert("insert into formaentrega(nombre_formaentrega,precio_formaentrega) values (#{nombre_formaentrega},#{precio_formaentrega})" )
	public void InsertFormaEntrega(FormaEntrega attr);

	@Update("update formaentrega set nombre_formaentrega = #{nombre_formaentrega},precio_formaentrega = #{precio_formaentrega} where id_formaentrega = #{id_formaentrega}")
	public void UpdateFormaEntrega(FormaEntrega frm);
	
}
