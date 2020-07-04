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


class Despachadores {
  Despachadores({
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
    this.nombreCompleto = value[DESPACHADORES.NOMBRECOMPLETO];
    this.tipoIdent = value[DESPACHADORES.TIPOIDENT];
    this.numeroIdent = value[DESPACHADORES.NUMEROIDENT];
    this.correoElectronico = value[DESPACHADORES.CORREOELECTRONICO];
    this.celular = value[DESPACHADORES.CELULAR];
    this.telefono = value[DESPACHADORES.TELEFONO];
    this.direccionPrincipal = value[DESPACHADORES.DIRECCIONPRINCIPAL];
    this.calificacion = double.parse(value[DESPACHADORES.CALIFICACION].toString());
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      DESPACHADORES.NOMBRECOMPLETO: this.nombreCompleto,
      DESPACHADORES.TIPOIDENT: this.tipoIdent,
      DESPACHADORES.NUMEROIDENT: this.numeroIdent,
      DESPACHADORES.CORREOELECTRONICO: this.correoElectronico,
      DESPACHADORES.CELULAR: this.celular,
      DESPACHADORES.TELEFONO: this.telefono,
      DESPACHADORES.DIRECCIONPRINCIPAL: this.direccionPrincipal,
      DESPACHADORES.CALIFICACION: this.calificacion,
    };
  }

  assign(Despachadores despachador) {

    if (despachador == null) {
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
      this.key = despachador.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombreCompleto = despachador.nombreCompleto;
      this.tipoIdent = despachador.tipoIdent;
      this.numeroIdent = despachador.numeroIdent;
      this.correoElectronico = despachador.correoElectronico;
      this.celular = despachador.celular;
      this.telefono = despachador.telefono;
      this.direccionPrincipal = despachador.direccionPrincipal;
      this.calificacion = despachador.calificacion;
    }
  }

  Map toMap() {
    Map map = {
      DESPACHADORES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      DESPACHADORES.NOMBRECOMPLETO: this.nombreCompleto,
      DESPACHADORES.TIPOIDENT: this.tipoIdent,
      DESPACHADORES.NUMEROIDENT: this.numeroIdent,
      DESPACHADORES.CORREOELECTRONICO: this.correoElectronico,
      DESPACHADORES.CELULAR: this.celular,
      DESPACHADORES.TELEFONO: this.telefono,
      DESPACHADORES.DIRECCIONPRINCIPAL: this.direccionPrincipal,
      DESPACHADORES.CALIFICACION: this.calificacion,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[DESPACHADORES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombreCompleto = map[DESPACHADORES.NOMBRECOMPLETO];
    this.tipoIdent = map[DESPACHADORES.TIPOIDENT];
    this.numeroIdent = map[DESPACHADORES.NUMEROIDENT];
    this.correoElectronico = map[DESPACHADORES.CORREOELECTRONICO];
    this.celular = map[DESPACHADORES.CELULAR];
    this.telefono = map[DESPACHADORES.TELEFONO];
    this.direccionPrincipal = map[DESPACHADORES.DIRECCIONPRINCIPAL];
    this.calificacion = map[DESPACHADORES.CALIFICACION];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Despachadores typedOther = other;
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
class DESPACHADORES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Despachadores';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Despachador';

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
  static const String ENTIDAD = 'Despachadores';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Despachador';

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
class DespachadoresFB {

  static DatabaseReference drDespachadores =
  FirebaseDatabase.instance.reference().child( DESPACHADORES.ENTIDAD );

  static fb_web.DatabaseReference drDespachadoresWeb =
  fb_web.database().ref( DESPACHADORES.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drDespachadoresWeb.onValue;
    } else {
      return drDespachadores.onValue;
    }
  }

  static Future guardarDespachadores({Despachadores despachador}) async {
    final _analytics = FirebaseAnalytics();

    if (despachador.key == '') {
      despachador.key = drDespachadores.push().key;
    }
    await drDespachadores.child(despachador.key).update(despachador.toJson());
    _analytics.logEvent(name:  DESPACHADORES.ENTIDAD , parameters: despachador.toJson());
  }

  static Future borrarDespachadores({Despachadores despachador}) async {
    final _analytics = FirebaseAnalytics();
    await drDespachadores.child(despachador.key).remove();
    _analytics.logEvent(name:  DESPACHADORES.ENTIDAD + '_Borrado', parameters: despachador.toJson());
  }

  static init() async {
    await drDespachadores.remove();
    // await InicializarClientes.init();
  }

  static todos(List<Despachadores> lista) async {
    // Lista de Clientes
    lista.clear();
    drDespachadores.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Despachadores();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

