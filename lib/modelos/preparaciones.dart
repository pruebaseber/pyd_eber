/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Preparaciones -> Preparación
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Preparacion {
  Preparacion({
    this.key = '',
    this.receta,
    this.paso,
    this.tiempo,
    this.instrucciones,
    this.utencilios,
    this.productoTienda,
    this.imagen,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String receta;  // Id/Key [Texto Variable: String]
  int paso;  // Orden [Entero Pequeño: int]
  String tiempo;  // Denominación 200 No Nulo [Texto Variable: String]
  String instrucciones;  // Memo [Texto Variable: String]
  String utencilios;  // Memo [Texto Variable: String]
  String productoTienda;  // Id/Key [Texto Variable: String]
  String imagen;  // URI Imagen [Texto Variable: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.receta = value[PREPARACIONES.RECETA];
    this.paso = value[PREPARACIONES.PASO];
    this.tiempo = value[PREPARACIONES.TIEMPO];
    this.instrucciones = value[PREPARACIONES.INSTRUCCIONES];
    this.utencilios = value[PREPARACIONES.UTENCILIOS];
    this.productoTienda = value[PREPARACIONES.PRODUCTOTIENDA];
    this.imagen = value[PREPARACIONES.IMAGEN];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      PREPARACIONES.RECETA: this.receta,
      PREPARACIONES.PASO: this.paso,
      PREPARACIONES.TIEMPO: this.tiempo,
      PREPARACIONES.INSTRUCCIONES: this.instrucciones,
      PREPARACIONES.UTENCILIOS: this.utencilios,
      PREPARACIONES.PRODUCTOTIENDA: this.productoTienda,
      PREPARACIONES.IMAGEN: this.imagen,
    };
  }

  assign(Preparacion preparacion) {

    if (preparacion == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.receta = null; //"";
      this.paso = null; //0;
      this.tiempo = null; //"";
      this.instrucciones = null; //"";
      this.utencilios = null; //"";
      this.productoTienda = null; //"";
      this.imagen = null; //"";
    } else {
      this.key = preparacion.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.receta = preparacion.receta;
      this.paso = preparacion.paso;
      this.tiempo = preparacion.tiempo;
      this.instrucciones = preparacion.instrucciones;
      this.utencilios = preparacion.utencilios;
      this.productoTienda = preparacion.productoTienda;
      this.imagen = preparacion.imagen;
    }
  }

  Map toMap() {
    Map map = {
      PREPARACIONES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      PREPARACIONES.RECETA: this.receta,
      PREPARACIONES.PASO: this.paso,
      PREPARACIONES.TIEMPO: this.tiempo,
      PREPARACIONES.INSTRUCCIONES: this.instrucciones,
      PREPARACIONES.UTENCILIOS: this.utencilios,
      PREPARACIONES.PRODUCTOTIENDA: this.productoTienda,
      PREPARACIONES.IMAGEN: this.imagen,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[PREPARACIONES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.receta = map[PREPARACIONES.RECETA];
    this.paso = map[PREPARACIONES.PASO];
    this.tiempo = map[PREPARACIONES.TIEMPO];
    this.instrucciones = map[PREPARACIONES.INSTRUCCIONES];
    this.utencilios = map[PREPARACIONES.UTENCILIOS];
    this.productoTienda = map[PREPARACIONES.PRODUCTOTIENDA];
    this.imagen = map[PREPARACIONES.IMAGEN];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Preparacion typedOther = other;
    return
        receta == typedOther.receta &&
        paso == typedOther.paso &&
        tiempo == typedOther.tiempo &&
        instrucciones == typedOther.instrucciones &&
        utencilios == typedOther.utencilios &&
        productoTienda == typedOther.productoTienda &&
        imagen == typedOther.imagen;
  }

  @override
  int get hashCode => hashObjects([
      receta.hashCode,
      paso.hashCode,
      tiempo.hashCode,
      instrucciones.hashCode,
      utencilios.hashCode,
      productoTienda.hashCode,
      imagen.hashCode,
  ]);

}

//==============================================================================
class PREPARACIONES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Preparaciones';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Preparación';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_RECETA = 'Receta';
  static const String ETIQUETA_PASO = 'Paso';
  static const String ETIQUETA_TIEMPO = 'Tiempo';
  static const String ETIQUETA_INSTRUCCIONES = 'Instrucciones';
  static const String ETIQUETA_UTENCILIOS = 'Utencilios';
  static const String ETIQUETA_PRODUCTOTIENDA = 'Producto en Tienda';
  static const String ETIQUETA_IMAGEN = 'Imagen';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Preparaciones';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Preparacion';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String RECETA = 'receta';
  static const String PASO = 'paso';
  static const String TIEMPO = 'tiempo';
  static const String INSTRUCCIONES = 'instrucciones';
  static const String UTENCILIOS = 'utencilios';
  static const String PRODUCTOTIENDA = 'productoTienda';
  static const String IMAGEN = 'imagen';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, RECETA, PASO, TIEMPO, INSTRUCCIONES, UTENCILIOS, PRODUCTOTIENDA, IMAGEN,];
  static const List CAMPOS_DETALLE = [
 KEY, RECETA, PASO, TIEMPO, INSTRUCCIONES, UTENCILIOS, PRODUCTOTIENDA, IMAGEN,];

}

//==============================================================================
class PreparacionesFB {

  static DatabaseReference drPreparaciones =
      FirebaseDatabase.instance.reference().child( PREPARACIONES.ENTIDAD );

  static fb_web.DatabaseReference drPreparacionesWeb =
      fb_web.database().ref( PREPARACIONES.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drPreparacionesWeb.onValue;
    } else {
      return drPreparaciones.onValue;
    }
  }

  static Future guardarPreparacion({Preparacion preparacion}) async {
    final _analytics = FirebaseAnalytics();

    if (preparacion.key == '') {
      preparacion.key = drPreparaciones.push().key;
    }
    await drPreparaciones.child(preparacion.key).update(preparacion.toJson());
    _analytics.logEvent(name:  PREPARACIONES.ENTIDAD , parameters: preparacion.toJson());
  }

  static Future borrarPreparacion({Preparacion preparacion}) async {
    final _analytics = FirebaseAnalytics();
    await drPreparaciones.child(preparacion.key).remove();
    _analytics.logEvent(name:  PREPARACIONES.ENTIDAD + '_Borrado', parameters: preparacion.toJson());
  }

  static init() async {
    await drPreparaciones.remove();
    // await InicializarPreparaciones.init();
  }

  static todos(List<Preparacion> lista) async {
    // Lista de Preparaciones
    lista.clear();
    drPreparaciones.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Preparacion();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

