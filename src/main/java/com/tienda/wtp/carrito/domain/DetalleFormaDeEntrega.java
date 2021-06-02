package com.tienda.wtp.carrito.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetalleFormaDeEntrega {

    Integer detalle_formaentrega_id;
    Integer formaentrega_id;
    String formaentrega_nombre;
    Integer almacen_id;
    Double formaentrega_precio;
    
}
