/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Categoria -> Categoría
   [Delfin API/Delfin Api Datos]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
    if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;

class RegCategoria {
  RegCategoria({
    this.key = '',
    this.codigoCategoria,
    this.nombre,
    this.imagen,
  });

  String key = ''; // Incluido por usar Firebase Database, pero no en Dendrita
  String codigoCategoria; // .Text [Memo: String]
  String nombre; // .Text [Memo: String]
  String imagen; // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoCategoria = value[CATEGORIA.CODIGOCATEGORIA];
    this.nombre = value[CATEGORIA.NOMBRE];
    this.imagen = value[CATEGORIA.IMAGEN];
    if (this.imagen == null) {
      this.imagen = '';
    }
  }

  toJson() {
    return {
      'key': this.key,
      // Incluido por usar Firebase Database, pero no en Dendrita
      CATEGORIA.CODIGOCATEGORIA: this.codigoCategoria,
      CATEGORIA.NOMBRE: this.nombre,
      CATEGORIA.IMAGEN: this.imagen,
    };
  }

  assign(RegCategoria regCategoria) {
    if (regCategoria == null) {
      this.key = ''; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoCategoria = null; //"";
      this.nombre = null; //"";
      this.imagen = null; //"";
    } else {
      this.key = regCategoria
          .key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoCategoria = regCategoria.codigoCategoria;
      this.nombre = regCategoria.nombre;
      this.imagen = regCategoria.imagen;
    }
  }

  Map toMap() {
    Map map = {
      CATEGORIA.KEY: this.key,
      // Incluido por usar Firebase Database, pero no en Dendrita
      CATEGORIA.CODIGOCATEGORIA: this.codigoCategoria,
      CATEGORIA.NOMBRE: this.nombre,
      CATEGORIA.IMAGEN: this.imagen,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[CATEGORIA
        .KEY]; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoCategoria = map[CATEGORIA.CODIGOCATEGORIA];
    this.nombre = map[CATEGORIA.NOMBRE];
    this.imagen = map[CATEGORIA.IMAGEN];
  }

//  @override
//  List<Object> get props => [key, codigoCategoria, nombre, imagen];

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegCategoria typedOther = other;
    return codigoCategoria == typedOther.codigoCategoria &&
        nombre == typedOther.nombre &&
        imagen == typedOther.imagen;
  }

  @override
  int get hashCode => hashObjects([
        codigoCategoria.hashCode,
        nombre.hashCode,
        imagen.hashCode,
      ]);
}

//==============================================================================
class CATEGORIA {
  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Categorías';

  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Categoría';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY =
      'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CODIGOCATEGORIA = 'CodigoCategoria';
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_IMAGEN = 'Imagen';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Categoria';

  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegCategoria';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY =
      'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CODIGOCATEGORIA = 'CodigoCategoria';
  static const String NOMBRE = 'Nombre';
  static const String IMAGEN = 'Imagen';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD + '/';
  static const String ENDPOINTLISTA = 'lista_' + ENTIDAD + '/';
  static const String ENDPOINTDET = 'det_' + ENTIDAD + '/';
  static const String RUTA = '/' + ENTIDAD;

  static const List CAMPOS_LISTADO = [
    KEY,
    CODIGOCATEGORIA,
    NOMBRE,
    IMAGEN,
  ];
  static const List CAMPOS_DETALLE = [
    KEY,
    CODIGOCATEGORIA,
    NOMBRE,
    IMAGEN,
  ];
}

//==============================================================================
class CategoriaFB {
  static DatabaseReference drCategoria = FirebaseDatabase.instance
      .reference()
      .child(DELFIN)
      .child(CATEGORIA.ENTIDAD);

  static fb_web.DatabaseReference drCategoriaWeb =
      fb_web.database().ref('/Delfin/Categoria');

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return CategoriaFB.drCategoriaWeb.onValue;
    } else {
      return CategoriaFB.drCategoria.onValue;
    }
  }

  static Future guardarRegCategoria({RegCategoria regCategoria}) async {
    final _analytics = FirebaseAnalytics();

    if (regCategoria.key == '') {
      regCategoria.key = drCategoria.push().key;
    }
    await drCategoria.child(regCategoria.key).update(regCategoria.toJson());
    _analytics.logEvent(
        name: CATEGORIA.ENTIDAD, parameters: regCategoria.toJson());
  }

  static Future borrarRegCategoria({RegCategoria regCategoria}) async {
    final _analytics = FirebaseAnalytics();
    await drCategoria.child(regCategoria.key).remove();
    _analytics.logEvent(
        name: CATEGORIA.ENTIDAD + '_Borrado',
        parameters: regCategoria.toJson());
  }

  static init() async {
    await drCategoria.remove();
//    await InicializarCategoria.init();
  }

  static todos(List<RegCategoria> lista) async {
    // Lista de Categorías
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
          final registro = RegCategoria();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a, b) => a.key.compareTo(b.key));
      }
    });
  }
}
