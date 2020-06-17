/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Direcciones -> Dirección
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Direccion {
  Direccion({
    this.key = '',
    this.cliente,
    this.direccion,
    this.nota,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String cliente;  // Id/Key [Texto Variable: String]
  String direccion;  // Dirección [Texto Variable: String]
  String nota;  // Nota [Texto Variable: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.cliente = value[DIRECCIONES.CLIENTE];
    this.direccion = value[DIRECCIONES.DIRECCION];
    this.nota = value[DIRECCIONES.NOTA];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      DIRECCIONES.CLIENTE: this.cliente,
      DIRECCIONES.DIRECCION: this.direccion,
      DIRECCIONES.NOTA: this.nota,
    };
  }

  assign(Direccion direccion) {

    if (direccion == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.cliente = null; //"";
      this.direccion = null; //"";
      this.nota = null; //"";
    } else {
      this.key = direccion.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.cliente = direccion.cliente;
      this.direccion = direccion.direccion;
      this.nota = direccion.nota;
    }
  }

  Map toMap() {
    Map map = {
      DIRECCIONES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      DIRECCIONES.CLIENTE: this.cliente,
      DIRECCIONES.DIRECCION: this.direccion,
      DIRECCIONES.NOTA: this.nota,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[DIRECCIONES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.cliente = map[DIRECCIONES.CLIENTE];
    this.direccion = map[DIRECCIONES.DIRECCION];
    this.nota = map[DIRECCIONES.NOTA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Direccion typedOther = other;
    return
        cliente == typedOther.cliente &&
        direccion == typedOther.direccion &&
        nota == typedOther.nota;
  }

  @override
  int get hashCode => hashObjects([
      cliente.hashCode,
      direccion.hashCode,
      nota.hashCode,
  ]);

}

//==============================================================================
class DIRECCIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Direcciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Dirección';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CLIENTE = 'Cliente';
  static const String ETIQUETA_DIRECCION = 'Dirección';
  static const String ETIQUETA_NOTA = 'Nota';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Direcciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Direccion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CLIENTE = 'cliente';
  static const String DIRECCION = 'direccion';
  static const String NOTA = 'nota';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, CLIENTE, DIRECCION, NOTA,];
  static const List CAMPOS_DETALLE = [
 KEY, CLIENTE, DIRECCION, NOTA,];

}

//==============================================================================
class DireccionesFB {

  static DatabaseReference drDirecciones =
      FirebaseDatabase.instance.reference().child( DIRECCIONES.ENTIDAD );

  static fb_web.DatabaseReference drDireccionesWeb =
      fb_web.database().ref( DIRECCIONES.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drDireccionesWeb.onValue;
    } else {
      return drDirecciones.onValue;
    }
  }

  static Future guardarDireccion({Direccion direccion}) async {
    final _analytics = FirebaseAnalytics();

    if (direccion.key == '') {
      direccion.key = drDirecciones.push().key;
    }
    await drDirecciones.child(direccion.key).update(direccion.toJson());
    _analytics.logEvent(name:  DIRECCIONES.ENTIDAD , parameters: direccion.toJson());
  }

  static Future borrarDireccion({Direccion direccion}) async {
    final _analytics = FirebaseAnalytics();
    await drDirecciones.child(direccion.key).remove();
    _analytics.logEvent(name:  DIRECCIONES.ENTIDAD + '_Borrado', parameters: direccion.toJson());
  }

  static init() async {
    await drDirecciones.remove();
    // await InicializarDirecciones.init();
  }

  static todos(List<Direccion> lista) async {
    // Lista de Direcciones
    lista.clear();
    drDirecciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Direccion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

