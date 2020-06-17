import 'package:pyd_eber/all-exports.dart';

class PedidoActivo {
  // TODO: Chequear si se ha iniciado sesión de usuario

  // TODO: Chequear si existe un pedido Activo por el Dispositivo o por el Usuario Activo
  // y cargarlo en memoria
  Pedido pedido = Pedido();
  List<DetPedido> detalles = List<DetPedido>();

  double cantidadEnPedido(codigo) {
//  print('Buscando producto por código en los detalles del Pedido Activo...');
    final resultado = detalles.where((x) => x.producto == codigo).toList();
    if (resultado.length > 0) {
      return resultado[0].cantidad;
    }
    return 0;
  }

  restar1Producto(RegProducto registro) {
//    print('Restando ${registro.nombre}, ${registro.codigoProducto}, ${registro.venta1}');
    final resultado = detalles
        .where((element) => element.producto == registro.codigoProducto)
        .toList();
    if (resultado.length > 0) {
      DetPedido detPedido = resultado[0];
      detPedido.cantidad -= 1;
      detPedido.monto = detPedido.cantidad * detPedido.precio;
      if (detPedido.cantidad == 0) {
        eliminarProducto(registro);
      }
    }
    actualizarTotalPedido();
    // TODO: Falta guardar definitivamente en la BD
  }

  sumar1Producto(RegProducto registro) {
//    print(registro.imagen);
    //print('Sumando ${registro.nombre}, ${registro.codigoProducto}, ${registro.venta1}');
    final resultado = detalles
        .where((element) => element.producto == registro.codigoProducto)
        .toList();
    if (resultado.length > 0) {
      DetPedido detPedido = resultado[0];
      detPedido.cantidad += 1;
      detPedido.monto = detPedido.cantidad * detPedido.precio;
    } else {
      // es la primera vez que se agrega este producto al pedido Activo
      DetPedido detPedido = DetPedido();
      detPedido.producto = registro.codigoProducto;
      detPedido.nombreProducto = registro.nombre.split('*')[0];
      detPedido.unidad = registro.nombre.split('*').length > 1
          ? registro.nombre.split('*')[1]
          : '';
      detPedido.imagen = imgUrlCodigo(registro.codigoProducto);
      detPedido.cantidad = 1;
      try {
        detPedido.precio = double.parse(registro.venta1);
      } catch (e) {
        detPedido.precio = 0;
      }
      detPedido.monto = detPedido.cantidad * detPedido.precio;
      detalles.add(detPedido);
    }
    actualizarTotalPedido();
    // TODO: Falta guardar definitivamente en la BD
  }

  eliminarProducto(RegProducto registro) {
//    print('Eliminando ${registro.nombre}, ${registro.codigoProducto}, ${registro.venta1}');
    final resultado = detalles
        .where((element) => element.producto == registro.codigoProducto)
        .toList();
    if (resultado.length > 0) {
      detalles.remove(resultado[0]);
    }
    actualizarTotalPedido();
    // TODO: Falta guardar definitivamente en la BD
  }

  actualizarTotalPedido({bool guardar = true}) {
    pedido.subTotalPedido = 0;
    pedido.totalPedido = 0;
    var items = detalles.length;
    detalles.forEach((detPedido) {
      pedido.subTotalPedido += detPedido.monto;
      pedido.totalPedido =
          pedido.subTotalPedido + pedido.recargos - pedido.descuentos;
      items -= 1;
      if (items == 0) {}
    });
    if (guardar) guardarEnPreferenciasLocales();
  }

  Future<bool> guardarEnPreferenciasLocales() async {
    bool lOk;

    Map sPedido = pedido.toJson();
    Map<String, Map> sDetalles = {};
    detalles.forEach((detPedido) {
      sDetalles.putIfAbsent(detPedido.producto, () => detPedido.toJson());
    });
    sPedido.putIfAbsent('detalles', () => sDetalles);
    String sData = json.encode(sPedido);
    lOk = await DEM.preferenciasInternas.prefs.setString('dataPedido', sData);
    return lOk;
  }

  leerDePreferenciasLocales() async {
    bool lOk = false;
    String sTest = await DEM.preferenciasInternas.prefs.getString('dataPedido');
    if (sTest == null) {
      return lOk;
    }
    Map map = json.decode(sTest);
    Pedido testPedido = Pedido();
    testPedido.fromMap(map);
    List<DetPedido> testListaDetallePedido = [];
    Map<String, dynamic> testDetalles = map['detalles'];
    testDetalles.forEach((key, value) {
      DetPedido detped = DetPedido();
      detped.fromKeyValue(key, value);
      testListaDetallePedido.add(detped);
    });
//    print(testPedido.toJson());
//    testListaDetallePedido.forEach((element) {
//      print(element.toJson());
//    });
    pedido.assign(testPedido);
    detalles.clear();
    detalles.addAll(testListaDetallePedido);

    return lOk;
  }

  actualizarDetalles() async {
    detalles.forEach((detPedido) {
      final lista = DEM.listaProductoBusqueda
          .where((element) => element.codigoProducto == detPedido.producto)
          .toList();
      if (lista.length > 0) {
        RegProducto producto = lista[0];
        detPedido.nombreProducto = producto.nombre.split('*')[0];
        detPedido.unidad = producto.nombre.split('*').length > 1
            ? producto.nombre.split('*')[1]
            : '';
        detPedido.imagen = imgUrlCodigo(producto.codigoProducto);
        detPedido.precio = double.parse(producto.venta1);
      } else {
        detPedido.nombreProducto =
            'PRODUCTO NO DISPONIBLE. ELIMINADO DE INVENTARIO.';
        detPedido.unidad = '';
        detPedido.imagen = '';
        detPedido.precio = 0;
        detPedido.monto = 0;
      }
    });
  }

  guardarWeb() async {
    if (DEM.dispositivo.key == null) {
      return;
    }
    bool lUsarUsuario = false;
    if ((DEM.regUsuario.key != null) && (DEM.regUsuario.key != '')) {
      lUsarUsuario = true;
    }
  }
}
