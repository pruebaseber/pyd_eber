/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad DetPedidos -> Detalle de Pedido
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class DetPedido {
  DetPedido({
    this.key = '',
    this.pedido,
    this.producto,
    this.precio,
    this.cantidad,
    this.monto,
    this.sabor,
    this.color,
    this.fragancia,
    this.talla,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String pedido;  // Id/Key [Texto Variable: String]
  String producto;  // Id/Key [Texto Variable: String]
  double precio;  // Precio [Decimal: double]
  double cantidad;  // Cantidad [Decimal: double]
  double monto;  // Moneda [Decimal: double]
  String sabor;  // Sabor [Texto Variable: String]
  int color;  // Color [Entero: int]
  String fragancia;  // Fragancia [Texto Variable: String]
  String talla;  // Talla [Texto Variable: String]
  String nombreProducto;
  String imagen;
  String unidad;

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.pedido = value[DETPEDIDOS.PEDIDO];
    this.producto = value[DETPEDIDOS.PRODUCTO];
    this.precio = double.parse(value[DETPEDIDOS.PRECIO].toString());
    this.cantidad = double.parse(value[DETPEDIDOS.CANTIDAD].toString());
    this.monto = double.parse(value[DETPEDIDOS.MONTO].toString());
    this.sabor = value[DETPEDIDOS.SABOR];
    this.color = value[DETPEDIDOS.COLOR];
    this.fragancia = value[DETPEDIDOS.FRAGANCIA];
    this.talla = value[DETPEDIDOS.TALLA];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      DETPEDIDOS.PEDIDO: this.pedido,
      DETPEDIDOS.PRODUCTO: this.producto,
      DETPEDIDOS.PRECIO: this.precio,
      DETPEDIDOS.CANTIDAD: this.cantidad,
      DETPEDIDOS.MONTO: this.monto,
      DETPEDIDOS.SABOR: this.sabor,
      DETPEDIDOS.COLOR: this.color,
      DETPEDIDOS.FRAGANCIA: this.fragancia,
      DETPEDIDOS.TALLA: this.talla,
    };
  }

  assign(DetPedido detPedido) {

    if (detPedido == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.pedido = null; //"";
      this.producto = null; //"";
      this.precio = null; //0.00;
      this.cantidad = null; //0.00;
      this.monto = null; //0.00;
      this.sabor = null; //"";
      this.color = null; //0;
      this.fragancia = null; //"";
      this.talla = null; //"";
    } else {
      this.key = detPedido.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.pedido = detPedido.pedido;
      this.producto = detPedido.producto;
      this.precio = detPedido.precio;
      this.cantidad = detPedido.cantidad;
      this.monto = detPedido.monto;
      this.sabor = detPedido.sabor;
      this.color = detPedido.color;
      this.fragancia = detPedido.fragancia;
      this.talla = detPedido.talla;
    }
  }

  Map toMap() {
    Map map = {
      DETPEDIDOS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      DETPEDIDOS.PEDIDO: this.pedido,
      DETPEDIDOS.PRODUCTO: this.producto,
      DETPEDIDOS.PRECIO: this.precio,
      DETPEDIDOS.CANTIDAD: this.cantidad,
      DETPEDIDOS.MONTO: this.monto,
      DETPEDIDOS.SABOR: this.sabor,
      DETPEDIDOS.COLOR: this.color,
      DETPEDIDOS.FRAGANCIA: this.fragancia,
      DETPEDIDOS.TALLA: this.talla,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[DETPEDIDOS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.pedido = map[DETPEDIDOS.PEDIDO];
    this.producto = map[DETPEDIDOS.PRODUCTO];
    this.precio = map[DETPEDIDOS.PRECIO];
    this.cantidad = map[DETPEDIDOS.CANTIDAD];
    this.monto = map[DETPEDIDOS.MONTO];
    this.sabor = map[DETPEDIDOS.SABOR];
    this.color = map[DETPEDIDOS.COLOR];
    this.fragancia = map[DETPEDIDOS.FRAGANCIA];
    this.talla = map[DETPEDIDOS.TALLA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final DetPedido typedOther = other;
    return
        pedido == typedOther.pedido &&
        producto == typedOther.producto &&
        precio == typedOther.precio &&
        cantidad == typedOther.cantidad &&
        monto == typedOther.monto &&
        sabor == typedOther.sabor &&
        color == typedOther.color &&
        fragancia == typedOther.fragancia &&
        talla == typedOther.talla;
  }

  @override
  int get hashCode => hashObjects([
      pedido.hashCode,
      producto.hashCode,
      precio.hashCode,
      cantidad.hashCode,
      monto.hashCode,
      sabor.hashCode,
      color.hashCode,
      fragancia.hashCode,
      talla.hashCode,
  ]);

}

//==============================================================================
class DETPEDIDOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Detalles de Pedidos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Detalle de Pedido';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_PEDIDO = 'Pedido';
  static const String ETIQUETA_PRODUCTO = 'Producto';
  static const String ETIQUETA_PRECIO = 'Precio';
  static const String ETIQUETA_CANTIDAD = 'Cantidad';
  static const String ETIQUETA_MONTO = 'Monto';
  static const String ETIQUETA_SABOR = 'Sabor';
  static const String ETIQUETA_COLOR = 'Color';
  static const String ETIQUETA_FRAGANCIA = 'Fragancia';
  static const String ETIQUETA_TALLA = 'Talla';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'DetPedidos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'DetPedido';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String PEDIDO = 'pedido';
  static const String PRODUCTO = 'producto';
  static const String PRECIO = 'precio';
  static const String CANTIDAD = 'cantidad';
  static const String MONTO = 'monto';
  static const String SABOR = 'sabor';
  static const String COLOR = 'color';
  static const String FRAGANCIA = 'fragancia';
  static const String TALLA = 'talla';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, PEDIDO, PRODUCTO, PRECIO, CANTIDAD, MONTO, SABOR, COLOR, FRAGANCIA, TALLA,];
  static const List CAMPOS_DETALLE = [
 KEY, PEDIDO, PRODUCTO, PRECIO, CANTIDAD, MONTO, SABOR, COLOR, FRAGANCIA, TALLA,];

}

//==============================================================================
class DetPedidosFB {

  static DatabaseReference drDetPedidos =
      FirebaseDatabase.instance.reference().child( DETPEDIDOS.ENTIDAD );

  static fb_web.DatabaseReference drDetPedidosWeb =
      fb_web.database().ref( DETPEDIDOS.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drDetPedidosWeb.onValue;
    } else {
      return drDetPedidos.onValue;
    }
  }

  static Future guardarDetPedido({DetPedido detPedido}) async {
    final _analytics = FirebaseAnalytics();

    if (detPedido.key == '') {
      detPedido.key = drDetPedidos.push().key;
    }
    await drDetPedidos.child(detPedido.key).update(detPedido.toJson());
    _analytics.logEvent(name:  DETPEDIDOS.ENTIDAD , parameters: detPedido.toJson());
  }

  static Future borrarDetPedido({DetPedido detPedido}) async {
    final _analytics = FirebaseAnalytics();
    await drDetPedidos.child(detPedido.key).remove();
    _analytics.logEvent(name:  DETPEDIDOS.ENTIDAD + '_Borrado', parameters: detPedido.toJson());
  }

  static init() async {
    await drDetPedidos.remove();
    // await InicializarDetPedidos.init();
  }

  static todos(List<DetPedido> lista) async {
    // Lista de Detalles de Pedidos
    lista.clear();
    drDetPedidos.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = DetPedido();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

