/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Recetas -> Receta
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Receta {
  Receta({
    this.key = '',
    this.nombre,
    this.pais,
    this.imagen,
    this.enlace,
    this.dificultad,
    this.tiempo,
    this.origen,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String nombre;  // Nombre [Texto Variable: String]
  String pais;  // País [Texto Variable: String]
  String imagen;  // URI Imagen [Texto Variable: String]
  String enlace;  // Enlace [Texto Variable: String]
  String dificultad;  // Dificultad [Texto Variable: String]
  String tiempo;  // Tiempo en minutos [Texto Variable: String]
  String origen;  // Texto RTF [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombre = value[RECETAS.NOMBRE];
    this.pais = value[RECETAS.PAIS];
    this.imagen = value[RECETAS.IMAGEN];
    this.enlace = value[RECETAS.ENLACE];
    this.dificultad = value[RECETAS.DIFICULTAD];
    this.tiempo = value[RECETAS.TIEMPO];
    this.origen = value[RECETAS.ORIGEN];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      RECETAS.NOMBRE: this.nombre,
      RECETAS.PAIS: this.pais,
      RECETAS.IMAGEN: this.imagen,
      RECETAS.ENLACE: this.enlace,
      RECETAS.DIFICULTAD: this.dificultad,
      RECETAS.TIEMPO: this.tiempo,
      RECETAS.ORIGEN: this.origen,
    };
  }

  assign(Receta receta) {

    if (receta == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombre = null; //"";
      this.pais = null; //"";
      this.imagen = null; //"";
      this.enlace = null; //"";
      this.dificultad = null; //"";
      this.tiempo = null; //"";
      this.origen = null; //"";
    } else {
      this.key = receta.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombre = receta.nombre;
      this.pais = receta.pais;
      this.imagen = receta.imagen;
      this.enlace = receta.enlace;
      this.dificultad = receta.dificultad;
      this.tiempo = receta.tiempo;
      this.origen = receta.origen;
    }
  }

  Map toMap() {
    Map map = {
      RECETAS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      RECETAS.NOMBRE: this.nombre,
      RECETAS.PAIS: this.pais,
      RECETAS.IMAGEN: this.imagen,
      RECETAS.ENLACE: this.enlace,
      RECETAS.DIFICULTAD: this.dificultad,
      RECETAS.TIEMPO: this.tiempo,
      RECETAS.ORIGEN: this.origen,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[RECETAS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombre = map[RECETAS.NOMBRE];
    this.pais = map[RECETAS.PAIS];
    this.imagen = map[RECETAS.IMAGEN];
    this.enlace = map[RECETAS.ENLACE];
    this.dificultad = map[RECETAS.DIFICULTAD];
    this.tiempo = map[RECETAS.TIEMPO];
    this.origen = map[RECETAS.ORIGEN];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Receta typedOther = other;
    return
        nombre == typedOther.nombre &&
        pais == typedOther.pais &&
        imagen == typedOther.imagen &&
        enlace == typedOther.enlace &&
        dificultad == typedOther.dificultad &&
        tiempo == typedOther.tiempo &&
        origen == typedOther.origen;
  }

  @override
  int get hashCode => hashObjects([
      nombre.hashCode,
      pais.hashCode,
      imagen.hashCode,
      enlace.hashCode,
      dificultad.hashCode,
      tiempo.hashCode,
      origen.hashCode,
  ]);

}

//==============================================================================
class RECETAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Recetas';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Receta';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_PAIS = 'Pais';
  static const String ETIQUETA_IMAGEN = 'Imagen';
  static const String ETIQUETA_ENLACE = 'Enlace';
  static const String ETIQUETA_DIFICULTAD = 'Dificultad';
  static const String ETIQUETA_TIEMPO = 'Tiempo';
  static const String ETIQUETA_ORIGEN = 'Origen';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Recetas';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Receta';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String NOMBRE = 'nombre';
  static const String PAIS = 'pais';
  static const String IMAGEN = 'imagen';
  static const String ENLACE = 'enlace';
  static const String DIFICULTAD = 'dificultad';
  static const String TIEMPO = 'tiempo';
  static const String ORIGEN = 'origen';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, NOMBRE, PAIS, IMAGEN, ENLACE, DIFICULTAD, TIEMPO, ORIGEN,];
  static const List CAMPOS_DETALLE = [
 KEY, NOMBRE, PAIS, IMAGEN, ENLACE, DIFICULTAD, TIEMPO, ORIGEN,];

}

//==============================================================================
class RecetasFB {

  static DatabaseReference drRecetas =
      FirebaseDatabase.instance.reference().child( RECETAS.ENTIDAD );

  static fb_web.DatabaseReference drRecetasWeb =
      fb_web.database().ref( RECETAS.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drRecetasWeb.onValue;
    } else {
      return drRecetas.onValue;
    }
  }

  static Future guardarReceta({Receta receta}) async {
    final _analytics = FirebaseAnalytics();

    if (receta.key == '') {
      receta.key = drRecetas.push().key;
    }
    await drRecetas.child(receta.key).update(receta.toJson());
    _analytics.logEvent(name:  RECETAS.ENTIDAD , parameters: receta.toJson());
  }

  static Future borrarReceta({Receta receta}) async {
    final _analytics = FirebaseAnalytics();
    await drRecetas.child(receta.key).remove();
    _analytics.logEvent(name:  RECETAS.ENTIDAD + '_Borrado', parameters: receta.toJson());
  }

  static init() async {
    await drRecetas.remove();
    // await InicializarRecetas.init();
  }

  static todos(List<Receta> lista) async {
    // Lista de Recetas
    lista.clear();
    drRecetas.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Receta();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

