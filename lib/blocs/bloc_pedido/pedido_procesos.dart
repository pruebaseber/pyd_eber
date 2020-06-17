// Delfin API
// Categorías

import 'package:pyd_eber/all-exports.dart';

class ProcesosPedidos extends ProcesosAbstractos {
  ProcesosPedidos(this.blocPedido);

  final BlocPedido blocPedido;

  sumar1Producto(RegProducto registro) {
    DEM.pedidoActivo.sumar1Producto(registro);
    blocPedido.add(EventoPedidoProductoSumado());
  }

  restar1Producto(RegProducto registro) {
    DEM.pedidoActivo.restar1Producto(registro);
    blocPedido.add(EventoPedidoProductoRestado());
  }

  eliminarProducto(RegProducto registro) {
    DEM.pedidoActivo.eliminarProducto(registro);
    blocPedido.add(EventoPedidoProductoEliminado());
  }

  borrarPedido() async {
    for (int i = DEM.pedidoActivo.detalles.length-1; i >= 0; i-- ) {
      final producto = RegProducto(codigoProducto:DEM.pedidoActivo.detalles[i].producto );
      eliminarProducto(producto);
      await esperar(200);
    }
  }

}