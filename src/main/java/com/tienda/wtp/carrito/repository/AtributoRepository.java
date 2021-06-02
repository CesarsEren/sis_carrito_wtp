package com.tienda.wtp.carrito.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.tienda.wtp.carrito.domain.Atributo;

@Repository
@Mapper
public interface AtributoRepository {

	@Select("select * from atributos where atributo_almacen_id = #{almacen_id}")
	public List<Atributo> getAtributos(int almacen_id);
	
	@Select("select * from atributos where atributo_id = ${atributo_id}")
	public Atributo getAtributo(int atributo_id);
	
	@Update("update atributos set atributo_estado = #{atributo_estado} where atributo_id = #{atributo_id}")
	public void CambiarEstado(int atributo_id,boolean atributo_estado);
	
	@Insert("insert into atributos(atributo_almacen_id,atributo_nombre) values (#{atributo_almacen_id},#{atributo_nombre})" )
	public void InsertAtributo(Atributo attr);

	@Update("update atributos set atributo_almacen_id = #{atributo_almacen_id},atributo_nombre = #{atributo_nombre} where atributo_id = #{atributo_id}")
	public void UpdateAtributo(Atributo attr);
}
