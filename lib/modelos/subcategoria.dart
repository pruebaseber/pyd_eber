/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad SubCategoria -> Sub Categoría
   [Delfin API/Delfin Api Datos]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class RegSubCategoria {
  RegSubCategoria({
    this.key = '',
    this.codigoSubCategoria,
    this.nombre,
    this.imagen,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String codigoSubCategoria;  // .Text [Memo: String]
  String nombre;  // .Text [Memo: String]
  String imagen;  // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoSubCategoria = value[SUBCATEGORIA.CODIGOSUBCATEGORIA];
    this.nombre = value[SUBCATEGORIA.NOMBRE];
    this.imagen = value[SUBCATEGORIA.IMAGEN];
    if (this.imagen == null) {
      this.imagen = '';
    }
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      SUBCATEGORIA.CODIGOSUBCATEGORIA: this.codigoSubCategoria,
      SUBCATEGORIA.NOMBRE: this.nombre,
      SUBCATEGORIA.IMAGEN: this.imagen,
    };
  }

  assign(RegSubCategoria regSubCategoria) {

    if (regSubCategoria == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoSubCategoria = null; //"";
      this.nombre = null; //"";
      this.imagen = null; //"";
    } else {
      this.key = regSubCategoria.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoSubCategoria = regSubCategoria.codigoSubCategoria;
      this.nombre = regSubCategoria.nombre;
      this.imagen = regSubCategoria.imagen;
    }
  }

  Map toMap() {
    Map map = {
      SUBCATEGORIA.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      SUBCATEGORIA.CODIGOSUBCATEGORIA: this.codigoSubCategoria,
      SUBCATEGORIA.NOMBRE: this.nombre,
      SUBCATEGORIA.IMAGEN: this.imagen,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[SUBCATEGORIA.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoSubCategoria = map[SUBCATEGORIA.CODIGOSUBCATEGORIA];
    this.nombre = map[SUBCATEGORIA.NOMBRE];
    this.imagen = map[SUBCATEGORIA.IMAGEN];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegSubCategoria typedOther = other;
    return
        codigoSubCategoria == typedOther.codigoSubCategoria &&
        nombre == typedOther.nombre &&
        imagen == typedOther.imagen;
  }

  @override
  int get hashCode => hashObjects([
      codigoSubCategoria.hashCode,
      nombre.hashCode,
      imagen.hashCode,
  ]);

}

//==============================================================================
class SUBCATEGORIA {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Sub Categorías';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Sub Categoría';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CODIGOSUBCATEGORIA = 'CodigoSubCategoria';
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_IMAGEN = 'Imagen';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'SubCategoria';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegSubCategoria';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CODIGOSUBCATEGORIA = 'CodigoSubCategoria';
  static const String NOMBRE = 'Nombre';
  static const String IMAGEN = 'Imagen';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, CODIGOSUBCATEGORIA, NOMBRE, IMAGEN,];
  static const List CAMPOS_DETALLE = [
 KEY, CODIGOSUBCATEGORIA, NOMBRE, IMAGEN,];

}

//==============================================================================
class SubCategoriaFB {

  static DatabaseReference drSubCategoria =
    FirebaseDatabase.instance.reference().child(DELFIN).child( SUBCATEGORIA.ENTIDAD );

  static fb_web.DatabaseReference drSubCategoriaWeb = fb_web.database().ref('/$DELFIN/${SUBCATEGORIA.ENTIDAD}');

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drSubCategoriaWeb.onValue;
    } else {
      return drSubCategoria.onValue;
    }
  }

  static filtrar(String categoria) {
    if (kIsWeb) {
      drSubCategoriaWeb = fb_web.database().ref('/$DELFIN/${SUBCATEGORIA.ENTIDAD}').child(categoria);
    } else {
      drSubCategoria =
          FirebaseDatabase.instance.reference().child(DELFIN).child(
              SUBCATEGORIA.ENTIDAD).child(categoria);
    }
  }

  static Future guardarRegSubCategoria({RegSubCategoria regSubCategoria}) async {
    final _analytics = FirebaseAnalytics();

    if (regSubCategoria.key == '') {
      regSubCategoria.key = drSubCategoria.push().key;
    }
    await drSubCategoria.child(regSubCategoria.key).update(regSubCategoria.toJson());
    _analytics.logEvent(name:  SUBCATEGORIA.ENTIDAD , parameters: regSubCategoria.toJson());
  }

  static Future borrarRegSubCategoria({RegSubCategoria regSubCategoria}) async {
    final _analytics = FirebaseAnalytics();
    await drSubCategoria.child(regSubCategoria.key).remove();
    _analytics.logEvent(name:  SUBCATEGORIA.ENTIDAD + '_Borrado', parameters: regSubCategoria.toJson());
  }

  static init() async {
    await drSubCategoria.remove();
//    await InicializarSubCategoria.init();
  }

  static todos(Map<String, List<RegSubCategoria>> lista) async {
    // Lista de Sub Categorías
    lista.clear();
    onValue().listen((event) {
      Map<dynamic, dynamic> _lista;
      if (kIsWeb) {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.val() != null)) _lista = event.snapshot.val();
      } else {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.value != null)) _lista = event.snapshot.value;
      }
      if (_lista != null) {
        _lista.forEach((key, value) {
          Map mapa = value;
          List<RegSubCategoria> _sublista = [];
          mapa.forEach((key2, value2) {
            final registro = RegSubCategoria();
            registro.fromKeyValue(key2, value2);
            _sublista.add(registro);
          });
        _sublista.sort((a,b) => a.nombre.compareTo(b.nombre));
          lista.addAll({key: _sublista});
        });

      }
    });
  }
}

