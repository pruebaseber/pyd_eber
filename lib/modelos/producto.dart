/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Producto -> Producto
   [Delfin API/Delfin Api Datos]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
    if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;

class RegProducto {
  RegProducto({
    this.key = '',
    this.codigoProducto,
    this.nombre,
    this.porcentajeIva,
    this.costo,
    this.venta1,
    this.manejaInventario,
    this.codigoLargo,
    this.codigoInventario,
    this.factor,
    this.sugerido,
    this.costoPromedio,
    this.codigoUnidadMedida,
    this.fechaIngreso,
    this.activo,
    this.categoria,
    this.imagen,
    this.existencia,
  });

  String key = ''; // Incluido por usar Firebase Database, pero no en Dendrita
  String codigoProducto; // .Text [Memo: String]
  String nombre; // .Text [Memo: String]
  double existencia;
  String porcentajeIva; // .Text [Memo: String]
  String costo; // .Text [Memo: String]
  String venta1; // .Text [Memo: String]
  bool manejaInventario; // Lógico [Lógico: bool]
  String codigoLargo; // .Text [Memo: String]
  String codigoInventario; // .Text [Memo: String]
  String factor; // .Text [Memo: String]
  String sugerido; // .Text [Memo: String]
  String costoPromedio; // .Text [Memo: String]
  String codigoUnidadMedida; // .Text [Memo: String]
  String fechaIngreso; // .Text [Memo: String]
  bool activo; // Lógico [Lógico: bool]
  String categoria; // .Text [Memo: String]
  String imagen; // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoProducto = value[PRODUCTO.CODIGOPRODUCTO];
    this.nombre = value[PRODUCTO.NOMBRE];
    this.existencia =  value[PRODUCTO.EXISTENCIA] == null ? 0 : double.parse(value[PRODUCTO.EXISTENCIA].toString());
    this.porcentajeIva = value[PRODUCTO.PORCENTAJEIVA];
    this.costo = value[PRODUCTO.COSTO];
    this.venta1 = value[PRODUCTO.VENTA1];
    this.manejaInventario = value[PRODUCTO.MANEJAINVENTARIO];
    this.codigoLargo = value[PRODUCTO.CODIGOLARGO];
    this.codigoInventario = value[PRODUCTO.CODIGOINVENTARIO];
    this.factor = value[PRODUCTO.FACTOR];
    this.sugerido = value[PRODUCTO.SUGERIDO];
    this.costoPromedio = value[PRODUCTO.COSTOPROMEDIO];
    this.codigoUnidadMedida = value[PRODUCTO.CODIGOUNIDADMEDIDA];
    this.fechaIngreso = value[PRODUCTO.FECHAINGRESO];
    this.activo = value[PRODUCTO.ACTIVO];
    this.categoria = value[PRODUCTO.CATEGORIA];
    this.imagen = value[PRODUCTO.IMAGEN];
    if (this.imagen == null) {
      this.imagen = '';
    }
  }

  toJson() {
    return {
      'key': this.key,
      // Incluido por usar Firebase Database, pero no en Dendrita
      PRODUCTO.CODIGOPRODUCTO: this.codigoProducto,
      PRODUCTO.NOMBRE: this.nombre,
      PRODUCTO.EXISTENCIA: this.existencia,
      PRODUCTO.PORCENTAJEIVA: this.porcentajeIva,
      PRODUCTO.COSTO: this.costo,
      PRODUCTO.VENTA1: this.venta1,
      PRODUCTO.MANEJAINVENTARIO: this.manejaInventario,
      PRODUCTO.CODIGOLARGO: this.codigoLargo,
      PRODUCTO.CODIGOINVENTARIO: this.codigoInventario,
      PRODUCTO.FACTOR: this.factor,
      PRODUCTO.SUGERIDO: this.sugerido,
      PRODUCTO.COSTOPROMEDIO: this.costoPromedio,
      PRODUCTO.CODIGOUNIDADMEDIDA: this.codigoUnidadMedida,
      PRODUCTO.FECHAINGRESO: this.fechaIngreso,
      PRODUCTO.ACTIVO: this.activo,
      PRODUCTO.CATEGORIA: this.categoria,
      PRODUCTO.IMAGEN: this.imagen,
    };
  }

  assign(RegProducto regProducto) {
    if (regProducto == null) {
      this.key = ''; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoProducto = null; //"";
      this.nombre = null; //"";
      this.existencia = null;
      this.porcentajeIva = null; //"";
      this.costo = null; //"";
      this.venta1 = null; //"";
      this.manejaInventario = null; //false;
      this.codigoLargo = null; //"";
      this.codigoInventario = null; //"";
      this.factor = null; //"";
      this.sugerido = null; //"";
      this.costoPromedio = null; //"";
      this.codigoUnidadMedida = null; //"";
      this.fechaIngreso = null; //"";
      this.activo = null; //false;
      this.categoria = null; //"";
      this.imagen = null; //"";
    } else {
      this.key = regProducto
          .key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoProducto = regProducto.codigoProducto;
      this.nombre = regProducto.nombre;
      this.existencia = regProducto.existencia;
      this.porcentajeIva = regProducto.porcentajeIva;
      this.costo = regProducto.costo;
      this.venta1 = regProducto.venta1;
      this.manejaInventario = regProducto.manejaInventario;
      this.codigoLargo = regProducto.codigoLargo;
      this.codigoInventario = regProducto.codigoInventario;
      this.factor = regProducto.factor;
      this.sugerido = regProducto.sugerido;
      this.costoPromedio = regProducto.costoPromedio;
      this.codigoUnidadMedida = regProducto.codigoUnidadMedida;
      this.fechaIngreso = regProducto.fechaIngreso;
      this.activo = regProducto.activo;
      this.categoria = regProducto.categoria;
      this.imagen = regProducto.imagen;
    }
  }

  Map toMap() {
    Map map = {
      PRODUCTO.KEY: this.key,
      // Incluido por usar Firebase Database, pero no en Dendrita
      PRODUCTO.CODIGOPRODUCTO: this.codigoProducto,
      PRODUCTO.NOMBRE: this.nombre,
      PRODUCTO.EXISTENCIA: this.existencia,
      PRODUCTO.PORCENTAJEIVA: this.porcentajeIva,
      PRODUCTO.COSTO: this.costo,
      PRODUCTO.VENTA1: this.venta1,
      PRODUCTO.MANEJAINVENTARIO: this.manejaInventario,
      PRODUCTO.CODIGOLARGO: this.codigoLargo,
      PRODUCTO.CODIGOINVENTARIO: this.codigoInventario,
      PRODUCTO.FACTOR: this.factor,
      PRODUCTO.SUGERIDO: this.sugerido,
      PRODUCTO.COSTOPROMEDIO: this.costoPromedio,
      PRODUCTO.CODIGOUNIDADMEDIDA: this.codigoUnidadMedida,
      PRODUCTO.FECHAINGRESO: this.fechaIngreso,
      PRODUCTO.ACTIVO: this.activo,
      PRODUCTO.CATEGORIA: this.categoria,
      PRODUCTO.IMAGEN: this.imagen,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[PRODUCTO
        .KEY]; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoProducto = map[PRODUCTO.CODIGOPRODUCTO];
    this.nombre = map[PRODUCTO.NOMBRE];
    this.existencia = map[PRODUCTO.EXISTENCIA] == null ? 0 : double.parse(map[PRODUCTO.EXISTENCIA].toString());
    this.porcentajeIva = map[PRODUCTO.PORCENTAJEIVA];
    this.costo = map[PRODUCTO.COSTO];
    this.venta1 = map[PRODUCTO.VENTA1];
    this.manejaInventario = map[PRODUCTO.MANEJAINVENTARIO];
    this.codigoLargo = map[PRODUCTO.CODIGOLARGO];
    this.codigoInventario = map[PRODUCTO.CODIGOINVENTARIO];
    this.factor = map[PRODUCTO.FACTOR];
    this.sugerido = map[PRODUCTO.SUGERIDO];
    this.costoPromedio = map[PRODUCTO.COSTOPROMEDIO];
    this.codigoUnidadMedida = map[PRODUCTO.CODIGOUNIDADMEDIDA];
    this.fechaIngreso = map[PRODUCTO.FECHAINGRESO];
    this.activo = map[PRODUCTO.ACTIVO];
    this.categoria = map[PRODUCTO.CATEGORIA];
    this.imagen = map[PRODUCTO.IMAGEN];
    if (this.imagen == null) {
      this.imagen = '';
    }
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegProducto typedOther = other;
    return codigoProducto == typedOther.codigoProducto &&
        nombre == typedOther.nombre &&
        existencia == typedOther.existencia &&
        porcentajeIva == typedOther.porcentajeIva &&
        costo == typedOther.costo &&
        venta1 == typedOther.venta1 &&
        manejaInventario == typedOther.manejaInventario &&
        codigoLargo == typedOther.codigoLargo &&
        codigoInventario == typedOther.codigoInventario &&
        factor == typedOther.factor &&
        sugerido == typedOther.sugerido &&
        costoPromedio == typedOther.costoPromedio &&
        codigoUnidadMedida == typedOther.codigoUnidadMedida &&
        fechaIngreso == typedOther.fechaIngreso &&
        activo == typedOther.activo &&
        categoria == typedOther.categoria &&
        imagen == typedOther.imagen;
  }

  @override
  int get hashCode => hashObjects([
        codigoProducto.hashCode,
        nombre.hashCode,
        existencia.hashCode,
        porcentajeIva.hashCode,
        costo.hashCode,
        venta1.hashCode,
        manejaInventario.hashCode,
        codigoLargo.hashCode,
        codigoInventario.hashCode,
        factor.hashCode,
        sugerido.hashCode,
        costoPromedio.hashCode,
        codigoUnidadMedida.hashCode,
        fechaIngreso.hashCode,
        activo.hashCode,
        categoria.hashCode,
        imagen.hashCode,
      ]);
}

//==============================================================================
class PRODUCTO {
  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Productos';

  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Producto';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY =
      'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CODIGOPRODUCTO = 'CodigoProducto';
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_EXISTENCIA = 'Existencia';
  static const String ETIQUETA_PORCENTAJEIVA = 'PorcentajeIva';
  static const String ETIQUETA_COSTO = 'Costo';
  static const String ETIQUETA_VENTA1 = 'Venta1';
  static const String ETIQUETA_MANEJAINVENTARIO = 'ManejaInventario';
  static const String ETIQUETA_CODIGOLARGO = 'CodigoLargo';
  static const String ETIQUETA_CODIGOINVENTARIO = 'CodigoInventario';
  static const String ETIQUETA_FACTOR = 'Factor';
  static const String ETIQUETA_SUGERIDO = 'Sugerido';
  static const String ETIQUETA_COSTOPROMEDIO = 'CostoPromedio';
  static const String ETIQUETA_CODIGOUNIDADMEDIDA = 'CodigoUnidadMedida';
  static const String ETIQUETA_FECHAINGRESO = 'FechaIngreso';
  static const String ETIQUETA_ACTIVO = 'Activo';
  static const String ETIQUETA_CATEGORIA = 'Categoria';
  static const String ETIQUETA_IMAGEN = 'Imagen';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Producto';

  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegProducto';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY =
      'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CODIGOPRODUCTO = 'CodigoProducto';
  static const String NOMBRE = 'Nombre';
  static const String EXISTENCIA = 'Existencia';
  static const String PORCENTAJEIVA = 'PorcentajeIva';
  static const String COSTO = 'Costo';
  static const String VENTA1 = 'Venta1';
  static const String MANEJAINVENTARIO = 'ManejaInventario';
  static const String CODIGOLARGO = 'CodigoLargo';
  static const String CODIGOINVENTARIO = 'CodigoInventario';
  static const String FACTOR = 'Factor';
  static const String SUGERIDO = 'Sugerido';
  static const String COSTOPROMEDIO = 'CostoPromedio';
  static const String CODIGOUNIDADMEDIDA = 'CodigoUnidadMedida';
  static const String FECHAINGRESO = 'FechaIngreso';
  static const String ACTIVO = 'Activo';
  static const String CATEGORIA = 'Categoria';
  static const String IMAGEN = 'Imagen';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD + '/';
  static const String ENDPOINTLISTA = 'lista_' + ENTIDAD + '/';
  static const String ENDPOINTDET = 'det_' + ENTIDAD + '/';
  static const String RUTA = '/' + ENTIDAD;

  static const List CAMPOS_LISTADO = [
    KEY,
    CODIGOPRODUCTO,
    NOMBRE,
    EXISTENCIA,
    PORCENTAJEIVA,
    COSTO,
    VENTA1,
    MANEJAINVENTARIO,
    CODIGOLARGO,
    CODIGOINVENTARIO,
    FACTOR,
    SUGERIDO,
    COSTOPROMEDIO,
    CODIGOUNIDADMEDIDA,
    FECHAINGRESO,
    ACTIVO,
    CATEGORIA,
    IMAGEN,
  ];
  static const List CAMPOS_DETALLE = [
    KEY,
    CODIGOPRODUCTO,
    NOMBRE,
    EXISTENCIA,
    PORCENTAJEIVA,
    COSTO,
    VENTA1,
    MANEJAINVENTARIO,
    CODIGOLARGO,
    CODIGOINVENTARIO,
    FACTOR,
    SUGERIDO,
    COSTOPROMEDIO,
    CODIGOUNIDADMEDIDA,
    FECHAINGRESO,
    ACTIVO,
    CATEGORIA,
    IMAGEN,
  ];
}

//==============================================================================
class ProductoFB {
  static DatabaseReference drProducto = FirebaseDatabase.instance
      .reference()
      .child(DELFIN)
      .child(PRODUCTO.ENTIDAD);

  static fb_web.DatabaseReference drProductoWeb =
      fb_web.database().ref('/$DELFIN/${PRODUCTO.ENTIDAD}');

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drProductoWeb.onValue;
    } else {
      return drProducto.onValue;
    }
  }

  static filtrar(String subcategoria) {
    if (kIsWeb) {
      drProductoWeb = fb_web
          .database()
          .ref('/$DELFIN/${PRODUCTO.ENTIDAD}')
          .child(subcategoria);
    } else {
      drProducto = FirebaseDatabase.instance
          .reference()
          .child(DELFIN)
          .child(PRODUCTO.ENTIDAD)
          .child(subcategoria);
    }
  }

  static Future guardarRegProducto({RegProducto regProducto}) async {
    final _analytics = FirebaseAnalytics();

    if (regProducto.key == '') {
      regProducto.key = drProducto.push().key;
    }
    await drProducto.child(regProducto.key).update(regProducto.toJson());
    _analytics.logEvent(
        name: PRODUCTO.ENTIDAD, parameters: regProducto.toJson());
  }

  static Future borrarRegProducto({RegProducto regProducto}) async {
    final _analytics = FirebaseAnalytics();
    await drProducto.child(regProducto.key).remove();
    _analytics.logEvent(
        name: PRODUCTO.ENTIDAD + '_Borrado', parameters: regProducto.toJson());
  }

  static init() async {
    await drProducto.remove();
//    await InicializarProducto.init();
  }

  static todos(Map<String, List<RegProducto>> lista) async {
    lista.clear();
    onValue().listen((event) {
      print('Cargando lista de Productos en SubCategorias');
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
          List<RegProducto> _sublista = [];
          mapa.forEach((key2, value2) {
            final registro = RegProducto();
            registro.fromKeyValue(key2, value2);
            _sublista.add(registro);
          });
          _sublista.sort((a,b) => a.nombre.compareTo(b.nombre));
          lista.addAll({key: _sublista});
        });
      }
    });
  }

  static paraBusqueda(List<RegProducto> lista) async {
    // Lista de Productos
    lista.clear();
    if (kIsWeb) {
      fb_web
          .database()
          .ref(DELFIN)
          .child(PRODUCTO.ENTIDAD + 'Busqueda')
          .onValue
          .listen((event) {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.val() != null)) {
          Map<dynamic, dynamic> _lista = event.snapshot.val();
          _lista.forEach((key, value) {
            final registro = RegProducto();
            registro.fromKeyValue(key, value);
            lista.add(registro);
          });
          lista.sort((a, b) => a.nombre.compareTo(b.nombre));
        }
      });
    } else {
      FirebaseDatabase.instance
          .reference()
          .child(DELFIN)
          .child(PRODUCTO.ENTIDAD + 'Busqueda')
          .onValue
          .listen((event) {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.value != null)) {
          Map<dynamic, dynamic> _lista = event.snapshot.value;
          _lista.forEach((key, value) {
            final registro = RegProducto();
            registro.fromKeyValue(key, value);
            lista.add(registro);
          });
          lista.sort((a, b) => a.nombre.compareTo(b.nombre));
        }
      });
    }
  }

  static imagenesProductos(List<CodigoImagen> lista) {
    // Lista de Imágenes por Código de Producto
    lista.clear();
    if (kIsWeb) {
      fb_web
          .database()
          .ref('ImagenCodigoProducto')
          .once('value')
          .then((event) async {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.val() != null)) {
//        if ((snapshot != null) && (snapshot.val() != null)) {
          Map<dynamic, dynamic> _map = event.snapshot.val();
          _map.forEach((k, v) => lista.add(CodigoImagen(k, v)));
          lista.sort((a, b) => a.codigo.compareTo(b.codigo));
          print('Imagenes por Código de Producto cargada...${lista.length}');
        }
      });
    } else {
      print('ImagenCodigoProducto, leer de FirebaseDatabase');
      FirebaseDatabase.instance
          .reference()
          .child('ImagenCodigoProducto')
          .once()
          .then((snapshot) async {
        if ((snapshot != null) && (snapshot.value != null)) {
          Map<dynamic, dynamic> _map = snapshot.value;
          _map.forEach((k, v) => lista.add(CodigoImagen(k, v)));
          lista.sort((a, b) => a.codigo.compareTo(b.codigo));
          print('Imagenes por Código de Producto cargada...${lista.length}');
        }
      });
    }
  }
}

class CodigoImagen {
  CodigoImagen(this.codigo, this.imagen);

  String codigo;
  String imagen;
}
