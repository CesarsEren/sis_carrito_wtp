package com.tienda.wtp.carrito.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface EmpresaRepository {

	@Select("select empresa_footer from empresa")
	public String getEmpresaFooter();

	@Delete("delete from empresa")
	public void deleteEmpresaFooter();
	
	@Insert("insert into empresa(empresa_footer) values(#{empresa_footer})")
	public void registrarEmpresaFooter(String empresa_footer);
}
