/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Clientes -> Cliente
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Cliente {
  Cliente({
    this.key = '',
    this.nombreCompleto,
    this.tipoIdent,
    this.numeroIdent,
    this.correoElectronico,
    this.celular,
    this.telefono,
    this.direccionPrincipal,
    this.calificacion,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String nombreCompleto;  // Nombre Completo [Texto Variable: String]
  String tipoIdent;  // Tipo de Identificación [Texto Variable: String]
  String numeroIdent;  // Número de Identificación [Texto Variable: String]
  String correoElectronico;  // Correo Electrónico [Texto Variable: String]
  String celular;  // Celular [Texto Variable: String]
  String telefono;  // Teléfono [Texto Variable: String]
  String direccionPrincipal;  // Id/Key [Texto Variable: String]
  double calificacion;  // Calificación [Decimal: double]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombreCompleto = value[CLIENTES.NOMBRECOMPLETO];
    this.tipoIdent = value[CLIENTES.TIPOIDENT];
    this.numeroIdent = value[CLIENTES.NUMEROIDENT];
    this.correoElectronico = value[CLIENTES.CORREOELECTRONICO];
    this.celular = value[CLIENTES.CELULAR];
    this.telefono = value[CLIENTES.TELEFONO];
    this.direccionPrincipal = value[CLIENTES.DIRECCIONPRINCIPAL];
    this.calificacion = double.parse(value[CLIENTES.CALIFICACION].toString());
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      CLIENTES.NOMBRECOMPLETO: this.nombreCompleto,
      CLIENTES.TIPOIDENT: this.tipoIdent,
      CLIENTES.NUMEROIDENT: this.numeroIdent,
      CLIENTES.CORREOELECTRONICO: this.correoElectronico,
      CLIENTES.CELULAR: this.celular,
      CLIENTES.TELEFONO: this.telefono,
      CLIENTES.DIRECCIONPRINCIPAL: this.direccionPrincipal,
      CLIENTES.CALIFICACION: this.calificacion,
    };
  }

  assign(Cliente cliente) {

    if (cliente == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombreCompleto = null; //"";
      this.tipoIdent = null; //"";
      this.numeroIdent = null; //"";
      this.correoElectronico = null; //"";
      this.celular = null; //"";
      this.telefono = null; //"";
      this.direccionPrincipal = null; //"";
      this.calificacion = null; //0.00;
    } else {
      this.key = cliente.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombreCompleto = cliente.nombreCompleto;
      this.tipoIdent = cliente.tipoIdent;
      this.numeroIdent = cliente.numeroIdent;
      this.correoElectronico = cliente.correoElectronico;
      this.celular = cliente.celular;
      this.telefono = cliente.telefono;
      this.direccionPrincipal = cliente.direccionPrincipal;
      this.calificacion = cliente.calificacion;
    }
  }

  Map toMap() {
    Map map = {
      CLIENTES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      CLIENTES.NOMBRECOMPLETO: this.nombreCompleto,
      CLIENTES.TIPOIDENT: this.tipoIdent,
      CLIENTES.NUMEROIDENT: this.numeroIdent,
      CLIENTES.CORREOELECTRONICO: this.correoElectronico,
      CLIENTES.CELULAR: this.celular,
      CLIENTES.TELEFONO: this.telefono,
      CLIENTES.DIRECCIONPRINCIPAL: this.direccionPrincipal,
      CLIENTES.CALIFICACION: this.calificacion,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[CLIENTES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombreCompleto = map[CLIENTES.NOMBRECOMPLETO];
    this.tipoIdent = map[CLIENTES.TIPOIDENT];
    this.numeroIdent = map[CLIENTES.NUMEROIDENT];
    this.correoElectronico = map[CLIENTES.CORREOELECTRONICO];
    this.celular = map[CLIENTES.CELULAR];
    this.telefono = map[CLIENTES.TELEFONO];
    this.direccionPrincipal = map[CLIENTES.DIRECCIONPRINCIPAL];
    this.calificacion = map[CLIENTES.CALIFICACION];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Cliente typedOther = other;
    return
        nombreCompleto == typedOther.nombreCompleto &&
        tipoIdent == typedOther.tipoIdent &&
        numeroIdent == typedOther.numeroIdent &&
        correoElectronico == typedOther.correoElectronico &&
        celular == typedOther.celular &&
        telefono == typedOther.telefono &&
        direccionPrincipal == typedOther.direccionPrincipal &&
        calificacion == typedOther.calificacion;
  }

  @override
  int get hashCode => hashObjects([
      nombreCompleto.hashCode,
      tipoIdent.hashCode,
      numeroIdent.hashCode,
      correoElectronico.hashCode,
      celular.hashCode,
      telefono.hashCode,
      direccionPrincipal.hashCode,
      calificacion.hashCode,
  ]);

}

//==============================================================================
class CLIENTES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Clientes';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Cliente';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_NOMBRECOMPLETO = 'Nombre Completo';
  static const String ETIQUETA_TIPOIDENT = 'Tipo de Identificación';
  static const String ETIQUETA_NUMEROIDENT = 'Número de Identificación';
  static const String ETIQUETA_CORREOELECTRONICO = 'Correo Electrónico';
  static const String ETIQUETA_CELULAR = 'Celular';
  static const String ETIQUETA_TELEFONO = 'Teléfono';
  static const String ETIQUETA_DIRECCIONPRINCIPAL = 'Dirección Principal';
  static const String ETIQUETA_CALIFICACION = 'Calificación';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Clientes';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Cliente';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String NOMBRECOMPLETO = 'nombreCompleto';
  static const String TIPOIDENT = 'tipoIdent';
  static const String NUMEROIDENT = 'numeroIdent';
  static const String CORREOELECTRONICO = 'correoElectronico';
  static const String CELULAR = 'celular';
  static const String TELEFONO = 'telefono';
  static const String DIRECCIONPRINCIPAL = 'direccionPrincipal';
  static const String CALIFICACION = 'calificacion';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, NOMBRECOMPLETO, TIPOIDENT, NUMEROIDENT, CORREOELECTRONICO, CELULAR, TELEFONO, DIRECCIONPRINCIPAL, CALIFICACION,];
  static const List CAMPOS_DETALLE = [
 KEY, NOMBRECOMPLETO, TIPOIDENT, NUMEROIDENT, CORREOELECTRONICO, CELULAR, TELEFONO, DIRECCIONPRINCIPAL, CALIFICACION,];

}

//==============================================================================
class ClientesFB {

  static DatabaseReference drClientes =
      FirebaseDatabase.instance.reference().child( CLIENTES.ENTIDAD );

  static fb_web.DatabaseReference drClientesWeb =
      fb_web.database().ref( CLIENTES.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drClientesWeb.onValue;
    } else {
      return drClientes.onValue;
    }
  }

  static Future guardarCliente({Cliente cliente}) async {
    final _analytics = FirebaseAnalytics();

    if (cliente.key == '') {
      cliente.key = drClientes.push().key;
    }
    await drClientes.child(cliente.key).update(cliente.toJson());
    _analytics.logEvent(name:  CLIENTES.ENTIDAD , parameters: cliente.toJson());
  }

  static Future borrarCliente({Cliente cliente}) async {
    final _analytics = FirebaseAnalytics();
    await drClientes.child(cliente.key).remove();
    _analytics.logEvent(name:  CLIENTES.ENTIDAD + '_Borrado', parameters: cliente.toJson());
  }

  static init() async {
    await drClientes.remove();
    // await InicializarClientes.init();
  }

  static todos(List<Cliente> lista) async {
    // Lista de Clientes
    lista.clear();
    drClientes.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Cliente();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

