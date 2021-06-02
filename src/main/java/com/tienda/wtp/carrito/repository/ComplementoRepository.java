package com.tienda.wtp.carrito.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.tienda.wtp.carrito.domain.Atributo;
import com.tienda.wtp.carrito.domain.Complemento;

@Repository
@Mapper
public interface ComplementoRepository {

	@Select("select * from complementos where complemento_almacen_id = #{almacen_id}")
	public List<Complemento> getComplementos(int almacen_id);
	
	@Select("select * from complementos where complemento_id = ${complemento_id}")
	public Complemento getComplemento(int complemento_id);
	
	@Update("update complementos set complemento_estado = #{complemento_estado} where complemento_id = #{complemento_id}")
	public void CambiarEstado(int complemento_id,boolean complemento_estado);
	
	@Insert("insert into complementos(complemento_almacen_id,complemento_nombre,complemento_precio) values (#{complemento_almacen_id},#{complemento_nombre},#{complemento_precio})" )
	public void InsertComplemento(Complemento attr);

	@Update("update complementos set complemento_almacen_id=#{complemento_almacen_id},complemento_nombre=#{complemento_nombre},complemento_precio=#{complemento_precio} where complemento_id = #{complemento_id}")
	public void UpdateComplemento(Complemento comp);
}
