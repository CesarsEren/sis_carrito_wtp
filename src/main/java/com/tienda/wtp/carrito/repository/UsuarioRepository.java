package com.tienda.wtp.carrito.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.tienda.wtp.carrito.domain.Producto;
import com.tienda.wtp.carrito.domain.Usuarios;
import com.tienda.wtp.carrito.domain.dto.Combobox;
import com.tienda.wtp.carrito.domain.dto.ProductoDTO;
import com.tienda.wtp.carrito.domain.dto.UsuariosDTO;
import com.tienda.wtp.carrito.domain.dto.UsuariosDTO2;
import com.tienda.wtp.carrito.domain.dto.UsuariosEdit;
import com.tienda.wtp.carrito.domain.dto.UsuariosRQ;

@Repository
@Mapper
public interface UsuarioRepository {

	@Select("SELECT us.usuario_id,concat(us.usuario_nombre,', ',us.usuario_paterno,' ',us.usuario_materno) usuario_datos,us.usuario_usuario,us.usuario_password,us.usuario_estado,us.usuario_nivel FROM usuarios us")
	public List<UsuariosDTO2> getUsuarios();

	@Select("select * from usuarios where usuario_id = #{usuario_id}")
	public UsuariosEdit getUsuario(int usuario_id);

	@Select("SELECT alm.almacen_id id,alm.almacen_nombre text FROM almacen alm INNER JOIN detalle_usuarios_almacen dualm ON alm.almacen_id = dualm.almacen_id WHERE dualm.usuario_id = #{usuario_id}")
	public List<Combobox> almacenPorUsuarioId(int usuario_id);

	@Insert("insert into usuarios(usuario_nombre,usuario_paterno,usuario_materno,usuario_usuario,usuario_password,usuario_nivel) values (#{usuario_nombre},#{usuario_paterno},#{usuario_materno},#{usuario_usuario},#{usuario_password},#{usuario_nivel})")
	@SelectKey(statement = "SELECT LAST_INSERT_ID()",keyColumn = "usuario_id", keyProperty = "usuario_id", before = false, resultType = Integer.class)
	public void registrar(UsuariosRQ us);

	@Insert("insert into detalle_usuarios_almacen(usuario_id,almacen_id) values(#{usuario_id},#{almacen_id})")
	public void registrarDetalleAlmacen(int usuario_id, int almacen_id);

	@Update("update usuarios set usuario_estado=#{usuario_estado} where usuario_id = #{usuario_id}")
	public void CambiarEstado(int usuario_id,boolean usuario_estado);

	@Update("update usuarios set usuario_nombre=#{usuario_nombre},usuario_paterno=#{usuario_paterno},usuario_materno=#{usuario_materno},usuario_usuario=#{usuario_usuario},usuario_password=#{usuario_password},usuario_nivel=#{usuario_nivel}  where usuario_id = #{usuario_id}")
	public void actualizar(UsuariosRQ us);

	@Delete("delete from detalle_usuarios_almacen where usuario_id = #{usuario_id}")
	public void eliminarDetalleAlmacen(int usuario_id);
	
	//Login
	 @Select("select * from usuarios where usuario_usuario =#{usuario} and usuario_password = #{password}")
	public Usuarios login(String usuario,String password);
	
}
