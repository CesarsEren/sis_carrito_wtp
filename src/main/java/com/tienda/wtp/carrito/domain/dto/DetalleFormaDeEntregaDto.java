package com.tienda.wtp.carrito.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetalleFormaDeEntregaDto {

    Integer detalle_formaentrega_id;
    Integer formaentrega_id;
    Integer almacen_id;
    String formaentrega_nombre;
    Double formaentrega_precio;
}
