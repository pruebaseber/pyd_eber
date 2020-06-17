/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Ingredientes -> Ingrediente
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Ingrediente {
  Ingrediente({
    this.key = '',
    this.receta,
    this.cantidad,
    this.unidad,
    this.producto,
    this.nota,
    this.productoTienda,
    this.imagen,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String receta;  // Id/Key [Texto Variable: String]
  double cantidad;  // Cantidad [Decimal: double]
  String unidad;  // Nombre Componente [Texto Variable: String]
  String producto;  // Denominación 200 No Nulo [Texto Variable: String]
  String nota;  // Nota [Texto Variable: String]
  String productoTienda;  // Id/Key [Texto Variable: String]
  String imagen;  // URI Imagen [Texto Variable: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.receta = value[INGREDIENTES.RECETA];
    this.cantidad = double.parse(value[INGREDIENTES.CANTIDAD].toString());
    this.unidad = value[INGREDIENTES.UNIDAD];
    this.producto = value[INGREDIENTES.PRODUCTO];
    this.nota = value[INGREDIENTES.NOTA];
    this.productoTienda = value[INGREDIENTES.PRODUCTOTIENDA];
    this.imagen = value[INGREDIENTES.IMAGEN];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      INGREDIENTES.RECETA: this.receta,
      INGREDIENTES.CANTIDAD: this.cantidad,
      INGREDIENTES.UNIDAD: this.unidad,
      INGREDIENTES.PRODUCTO: this.producto,
      INGREDIENTES.NOTA: this.nota,
      INGREDIENTES.PRODUCTOTIENDA: this.productoTienda,
      INGREDIENTES.IMAGEN: this.imagen,
    };
  }

  assign(Ingrediente ingrediente) {

    if (ingrediente == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.receta = null; //"";
      this.cantidad = null; //0.00;
      this.unidad = null; //"";
      this.producto = null; //"";
      this.nota = null; //"";
      this.productoTienda = null; //"";
      this.imagen = null; //"";
    } else {
      this.key = ingrediente.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.receta = ingrediente.receta;
      this.cantidad = ingrediente.cantidad;
      this.unidad = ingrediente.unidad;
      this.producto = ingrediente.producto;
      this.nota = ingrediente.nota;
      this.productoTienda = ingrediente.productoTienda;
      this.imagen = ingrediente.imagen;
    }
  }

  Map toMap() {
    Map map = {
      INGREDIENTES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      INGREDIENTES.RECETA: this.receta,
      INGREDIENTES.CANTIDAD: this.cantidad,
      INGREDIENTES.UNIDAD: this.unidad,
      INGREDIENTES.PRODUCTO: this.producto,
      INGREDIENTES.NOTA: this.nota,
      INGREDIENTES.PRODUCTOTIENDA: this.productoTienda,
      INGREDIENTES.IMAGEN: this.imagen,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[INGREDIENTES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.receta = map[INGREDIENTES.RECETA];
    this.cantidad = map[INGREDIENTES.CANTIDAD];
    this.unidad = map[INGREDIENTES.UNIDAD];
    this.producto = map[INGREDIENTES.PRODUCTO];
    this.nota = map[INGREDIENTES.NOTA];
    this.productoTienda = map[INGREDIENTES.PRODUCTOTIENDA];
    this.imagen = map[INGREDIENTES.IMAGEN];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Ingrediente typedOther = other;
    return
        receta == typedOther.receta &&
        cantidad == typedOther.cantidad &&
        unidad == typedOther.unidad &&
        producto == typedOther.producto &&
        nota == typedOther.nota &&
        productoTienda == typedOther.productoTienda &&
        imagen == typedOther.imagen;
  }

  @override
  int get hashCode => hashObjects([
      receta.hashCode,
      cantidad.hashCode,
      unidad.hashCode,
      producto.hashCode,
      nota.hashCode,
      productoTienda.hashCode,
      imagen.hashCode,
  ]);

}

//==============================================================================
class INGREDIENTES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Ingredientes';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Ingrediente';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_RECETA = 'Receta';
  static const String ETIQUETA_CANTIDAD = 'Cantidad';
  static const String ETIQUETA_UNIDAD = 'Unidad';
  static const String ETIQUETA_PRODUCTO = 'Producto';
  static const String ETIQUETA_NOTA = 'Nota';
  static const String ETIQUETA_PRODUCTOTIENDA = 'Producto en Tienda';
  static const String ETIQUETA_IMAGEN = 'Imagen';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Ingredientes';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Ingrediente';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String RECETA = 'receta';
  static const String CANTIDAD = 'cantidad';
  static const String UNIDAD = 'unidad';
  static const String PRODUCTO = 'producto';
  static const String NOTA = 'nota';
  static const String PRODUCTOTIENDA = 'productoTienda';
  static const String IMAGEN = 'imagen';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, RECETA, CANTIDAD, UNIDAD, PRODUCTO, NOTA, PRODUCTOTIENDA, IMAGEN,];
  static const List CAMPOS_DETALLE = [
 KEY, RECETA, CANTIDAD, UNIDAD, PRODUCTO, NOTA, PRODUCTOTIENDA, IMAGEN,];

}

//==============================================================================
class IngredientesFB {

  static DatabaseReference drIngredientes =
      FirebaseDatabase.instance.reference().child( INGREDIENTES.ENTIDAD );

  static fb_web.DatabaseReference drIngredientesWeb =
      fb_web.database().ref( INGREDIENTES.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drIngredientesWeb.onValue;
    } else {
      return drIngredientes.onValue;
    }
  }

  static Future guardarIngrediente({Ingrediente ingrediente}) async {
    final _analytics = FirebaseAnalytics();

    if (ingrediente.key == '') {
      ingrediente.key = drIngredientes.push().key;
    }
    await drIngredientes.child(ingrediente.key).update(ingrediente.toJson());
    _analytics.logEvent(name:  INGREDIENTES.ENTIDAD , parameters: ingrediente.toJson());
  }

  static Future borrarIngrediente({Ingrediente ingrediente}) async {
    final _analytics = FirebaseAnalytics();
    await drIngredientes.child(ingrediente.key).remove();
    _analytics.logEvent(name:  INGREDIENTES.ENTIDAD + '_Borrado', parameters: ingrediente.toJson());
  }

  static init() async {
    await drIngredientes.remove();
    // await InicializarIngredientes.init();
  }

  static todos(List<Ingrediente> lista) async {
    // Lista de Ingredientes
    lista.clear();
    drIngredientes.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Ingrediente();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

