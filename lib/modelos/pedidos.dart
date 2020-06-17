/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Pedidos -> Pedido
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Pedido {
  Pedido({
    this.key = '',
    this.dispositivo,
    this.cliente,
    this.usuario,
    this.fechaInicio,
    this.horaInicio,
    this.subTotalPedido = 0,
    this.recargos = 0,
    this.descuentos = 0,
    this.totalPedido = 0,
    this.notaCliente,
    this.calificacion,
    this.notaTienda,
    this.calificacionTienda,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String dispositivo;  // Id/Key [Texto Variable: String]
  String cliente;  // Id/Key [Texto Variable: String]
  String usuario;  // Id/Key [Texto Variable: String]
  DateTime fechaInicio;  // Fecha [Fecha: DateTime]
  TimeOfDay horaInicio;  // Hora [Hora: TimeOfDay]
  double subTotalPedido;  // Moneda [Decimal: double]
  double recargos;  // Moneda [Decimal: double]
  double descuentos;  // Moneda [Decimal: double]
  double totalPedido;  // Moneda [Decimal: double]
  String notaCliente;  // Nota [Texto Variable: String]
  double calificacion;  // Calificación [Decimal: double]
  String notaTienda;  // Notas [Texto Variable: String]
  double calificacionTienda;  // Calificación [Decimal: double]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.dispositivo = value[PEDIDOS.DISPOSITIVO];
    this.cliente = value[PEDIDOS.CLIENTE];
    this.usuario = value[PEDIDOS.USUARIO];
    this.fechaInicio = LeerFecha(value[PEDIDOS.FECHAINICIO]);
    this.horaInicio = LeerHora(value[PEDIDOS.HORAINICIO]);
    this.subTotalPedido = double.parse(value[PEDIDOS.SUBTOTALPEDIDO].toString());
    this.recargos = double.parse(value[PEDIDOS.RECARGOS].toString());
    this.descuentos = double.parse(value[PEDIDOS.DESCUENTOS].toString());
    this.totalPedido = double.parse(value[PEDIDOS.TOTALPEDIDO].toString());
    this.notaCliente = value[PEDIDOS.NOTACLIENTE];
    this.calificacion = double.parse(value[PEDIDOS.CALIFICACION].toString());
    this.notaTienda = value[PEDIDOS.NOTATIENDA];
    this.calificacionTienda = double.parse(value[PEDIDOS.CALIFICACIONTIENDA].toString());
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      PEDIDOS.DISPOSITIVO: this.dispositivo,
      PEDIDOS.CLIENTE: this.cliente,
      PEDIDOS.USUARIO: this.usuario,
      PEDIDOS.FECHAINICIO: this.fechaInicio == null ? null : GuardarFecha(this.fechaInicio),
      PEDIDOS.HORAINICIO: this.horaInicio == null ? null : GuardarHora(this.horaInicio),
      PEDIDOS.SUBTOTALPEDIDO: this.subTotalPedido,
      PEDIDOS.RECARGOS: this.recargos,
      PEDIDOS.DESCUENTOS: this.descuentos,
      PEDIDOS.TOTALPEDIDO: this.totalPedido,
      PEDIDOS.NOTACLIENTE: this.notaCliente,
      PEDIDOS.CALIFICACION: this.calificacion,
      PEDIDOS.NOTATIENDA: this.notaTienda,
      PEDIDOS.CALIFICACIONTIENDA: this.calificacionTienda,
    };
  }

  assign(Pedido pedido) {

    if (pedido == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.dispositivo = null; //"";
      this.cliente = null; //"";
      this.usuario = null; //"";
      this.fechaInicio = null; //DateTime.now();
      this.horaInicio = null; //DateTime.now();
      this.subTotalPedido = null; //0.00;
      this.recargos = null; //0.00;
      this.descuentos = null; //0.00;
      this.totalPedido = null; //0.00;
      this.notaCliente = null; //"";
      this.calificacion = null; //0.00;
      this.notaTienda = null; //"";
      this.calificacionTienda = null; //0.00;
    } else {
      this.key = pedido.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.dispositivo = pedido.dispositivo;
      this.cliente = pedido.cliente;
      this.usuario = pedido.usuario;
      this.fechaInicio = pedido.fechaInicio;
      this.horaInicio = pedido.horaInicio;
      this.subTotalPedido = pedido.subTotalPedido;
      this.recargos = pedido.recargos;
      this.descuentos = pedido.descuentos;
      this.totalPedido = pedido.totalPedido;
      this.notaCliente = pedido.notaCliente;
      this.calificacion = pedido.calificacion;
      this.notaTienda = pedido.notaTienda;
      this.calificacionTienda = pedido.calificacionTienda;
    }
  }

  Map toMap() {
    Map map = {
      PEDIDOS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      PEDIDOS.DISPOSITIVO: this.dispositivo,
      PEDIDOS.CLIENTE: this.cliente,
      PEDIDOS.USUARIO: this.usuario,
      PEDIDOS.FECHAINICIO: this.fechaInicio == null ? null : GuardarFecha(this.fechaInicio),
      PEDIDOS.HORAINICIO: this.horaInicio == null ? null : GuardarHora(this.horaInicio),
      PEDIDOS.SUBTOTALPEDIDO: this.subTotalPedido,
      PEDIDOS.RECARGOS: this.recargos,
      PEDIDOS.DESCUENTOS: this.descuentos,
      PEDIDOS.TOTALPEDIDO: this.totalPedido,
      PEDIDOS.NOTACLIENTE: this.notaCliente,
      PEDIDOS.CALIFICACION: this.calificacion,
      PEDIDOS.NOTATIENDA: this.notaTienda,
      PEDIDOS.CALIFICACIONTIENDA: this.calificacionTienda,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[PEDIDOS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.dispositivo = map[PEDIDOS.DISPOSITIVO];
    this.cliente = map[PEDIDOS.CLIENTE];
    this.usuario = map[PEDIDOS.USUARIO];
    this.fechaInicio = map[PEDIDOS.FECHAINICIO] == null ? null : LeerFecha(map[PEDIDOS.FECHAINICIO]);
    this.horaInicio = map[PEDIDOS.HORAINICIO] == null ? null : LeerHora(map[PEDIDOS.HORAINICIO]);
    this.subTotalPedido = map[PEDIDOS.SUBTOTALPEDIDO];
    this.recargos = map[PEDIDOS.RECARGOS];
    this.descuentos = map[PEDIDOS.DESCUENTOS];
    this.totalPedido = map[PEDIDOS.TOTALPEDIDO];
    this.notaCliente = map[PEDIDOS.NOTACLIENTE];
    this.calificacion = map[PEDIDOS.CALIFICACION];
    this.notaTienda = map[PEDIDOS.NOTATIENDA];
    this.calificacionTienda = map[PEDIDOS.CALIFICACIONTIENDA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Pedido typedOther = other;
    return
        dispositivo == typedOther.dispositivo &&
        cliente == typedOther.cliente &&
        usuario == typedOther.usuario &&
        fechaInicio == typedOther.fechaInicio &&
        horaInicio == typedOther.horaInicio &&
        subTotalPedido == typedOther.subTotalPedido &&
        recargos == typedOther.recargos &&
        descuentos == typedOther.descuentos &&
        totalPedido == typedOther.totalPedido &&
        notaCliente == typedOther.notaCliente &&
        calificacion == typedOther.calificacion &&
        notaTienda == typedOther.notaTienda &&
        calificacionTienda == typedOther.calificacionTienda;
  }

  @override
  int get hashCode => hashObjects([
      dispositivo.hashCode,
      cliente.hashCode,
      usuario.hashCode,
      fechaInicio.hashCode,
      horaInicio.hashCode,
      subTotalPedido.hashCode,
      recargos.hashCode,
      descuentos.hashCode,
      totalPedido.hashCode,
      notaCliente.hashCode,
      calificacion.hashCode,
      notaTienda.hashCode,
      calificacionTienda.hashCode,
  ]);

}

//==============================================================================
class PEDIDOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Pedidos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Pedido';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_DISPOSITIVO = 'Dispositivo';
  static const String ETIQUETA_CLIENTE = 'Cliente';
  static const String ETIQUETA_USUARIO = 'Usuario';
  static const String ETIQUETA_FECHAINICIO = 'Fecha de Inicio';
  static const String ETIQUETA_HORAINICIO = 'Hora de Inicio';
  static const String ETIQUETA_SUBTOTALPEDIDO = 'Sub Total Pedido';
  static const String ETIQUETA_RECARGOS = 'Recargos';
  static const String ETIQUETA_DESCUENTOS = 'Descuentos';
  static const String ETIQUETA_TOTALPEDIDO = 'Total Pedido';
  static const String ETIQUETA_NOTACLIENTE = 'Nota del Cliente';
  static const String ETIQUETA_CALIFICACION = 'Calificación';
  static const String ETIQUETA_NOTATIENDA = 'Nota de la Tienda';
  static const String ETIQUETA_CALIFICACIONTIENDA = 'Calificación de la Tienda';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Pedidos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Pedido';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String DISPOSITIVO = 'dispositivo';
  static const String CLIENTE = 'cliente';
  static const String USUARIO = 'usuario';
  static const String FECHAINICIO = 'fechaInicio';
  static const String HORAINICIO = 'horaInicio';
  static const String SUBTOTALPEDIDO = 'subTotalPedido';
  static const String RECARGOS = 'recargos';
  static const String DESCUENTOS = 'descuentos';
  static const String TOTALPEDIDO = 'totalPedido';
  static const String NOTACLIENTE = 'notaCliente';
  static const String CALIFICACION = 'calificacion';
  static const String NOTATIENDA = 'notaTienda';
  static const String CALIFICACIONTIENDA = 'calificacionTienda';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, DISPOSITIVO, CLIENTE, USUARIO, FECHAINICIO, HORAINICIO, SUBTOTALPEDIDO, RECARGOS, DESCUENTOS, TOTALPEDIDO, NOTACLIENTE, CALIFICACION, NOTATIENDA, CALIFICACIONTIENDA,];
  static const List CAMPOS_DETALLE = [
 KEY, DISPOSITIVO, CLIENTE, USUARIO, FECHAINICIO, HORAINICIO, SUBTOTALPEDIDO, RECARGOS, DESCUENTOS, TOTALPEDIDO, NOTACLIENTE, CALIFICACION, NOTATIENDA, CALIFICACIONTIENDA,];

}

//==============================================================================
class PedidosFB {

  static DatabaseReference drPedidos =
      FirebaseDatabase.instance.reference().child( PEDIDOS.ENTIDAD );

  static fb_web.DatabaseReference drPedidosWeb =
      fb_web.database().ref( PEDIDOS.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drPedidosWeb.onValue;
    } else {
      return drPedidos.onValue;
    }
  }

  static Future guardarPedido({Pedido pedido}) async {
    final _analytics = FirebaseAnalytics();

    if (pedido.key == '') {
      pedido.key = drPedidos.push().key;
    }
    await drPedidos.child(pedido.key).update(pedido.toJson());
    _analytics.logEvent(name:  PEDIDOS.ENTIDAD , parameters: pedido.toJson());
  }

  static Future borrarPedido({Pedido pedido}) async {
    final _analytics = FirebaseAnalytics();
    await drPedidos.child(pedido.key).remove();
    _analytics.logEvent(name:  PEDIDOS.ENTIDAD + '_Borrado', parameters: pedido.toJson());
  }

  static init() async {
    await drPedidos.remove();
    // await InicializarPedidos.init();
  }

  static todos(List<Pedido> lista) async {
    // Lista de Pedidos
    lista.clear();
    drPedidos.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Pedido();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

