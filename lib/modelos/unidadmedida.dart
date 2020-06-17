/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad UnidadMedida -> Unidad de Medida
   [Delfin API/Delfin Api Datos]
*/

import 'package:pyd_eber/all-exports.dart';


class RegUnidadMedida {
  RegUnidadMedida({
    this.key = '',
    this.codigoUnidadMedida,
    this.nombre,
    this.factor,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String codigoUnidadMedida;  // .Text [Memo: String]
  String nombre;  // .Text [Memo: String]
  String factor;  // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoUnidadMedida = value[UNIDADMEDIDA.CODIGOUNIDADMEDIDA];
    this.nombre = value[UNIDADMEDIDA.NOMBRE];
    this.factor = value[UNIDADMEDIDA.FACTOR];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      UNIDADMEDIDA.CODIGOUNIDADMEDIDA: this.codigoUnidadMedida,
      UNIDADMEDIDA.NOMBRE: this.nombre,
      UNIDADMEDIDA.FACTOR: this.factor,
    };
  }

  assign(RegUnidadMedida regUnidadMedida) {

    if (regUnidadMedida == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoUnidadMedida = null; //"";
      this.nombre = null; //"";
      this.factor = null; //"";
    } else {
      this.key = regUnidadMedida.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoUnidadMedida = regUnidadMedida.codigoUnidadMedida;
      this.nombre = regUnidadMedida.nombre;
      this.factor = regUnidadMedida.factor;
    }
  }

  Map toMap() {
    Map map = {
      UNIDADMEDIDA.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      UNIDADMEDIDA.CODIGOUNIDADMEDIDA: this.codigoUnidadMedida,
      UNIDADMEDIDA.NOMBRE: this.nombre,
      UNIDADMEDIDA.FACTOR: this.factor,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[UNIDADMEDIDA.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoUnidadMedida = map[UNIDADMEDIDA.CODIGOUNIDADMEDIDA];
    this.nombre = map[UNIDADMEDIDA.NOMBRE];
    this.factor = map[UNIDADMEDIDA.FACTOR];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegUnidadMedida typedOther = other;
    return
        codigoUnidadMedida == typedOther.codigoUnidadMedida &&
        nombre == typedOther.nombre &&
        factor == typedOther.factor;
  }

  @override
  int get hashCode => hashObjects([
      codigoUnidadMedida.hashCode,
      nombre.hashCode,
      factor.hashCode,
  ]);

}

//==============================================================================
class UNIDADMEDIDA {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Unidades de Medidas';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Unidad de Medida';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CODIGOUNIDADMEDIDA = 'CodigoUnidadMedida';
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_FACTOR = 'Factor';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'UnidadMedida';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegUnidadMedida';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CODIGOUNIDADMEDIDA = 'CodigoUnidadMedida';
  static const String NOMBRE = 'Nombre';
  static const String FACTOR = 'Factor';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, CODIGOUNIDADMEDIDA, NOMBRE, FACTOR,];
  static const List CAMPOS_DETALLE = [
 KEY, CODIGOUNIDADMEDIDA, NOMBRE, FACTOR,];

}

//==============================================================================
class UnidadMedidaFB {

  static DatabaseReference drUnidadMedida =
      FirebaseDatabase.instance.reference().child(DELFIN).child( UNIDADMEDIDA.ENTIDAD );

  static Future guardarRegUnidadMedida({RegUnidadMedida regUnidadMedida}) async {
    final _analytics = FirebaseAnalytics();

    if (regUnidadMedida.key == '') {
      regUnidadMedida.key = drUnidadMedida.push().key;
    }
    await drUnidadMedida.child(regUnidadMedida.key).update(regUnidadMedida.toJson());
    _analytics.logEvent(name:  UNIDADMEDIDA.ENTIDAD , parameters: regUnidadMedida.toJson());
  }

  static Future borrarRegUnidadMedida({RegUnidadMedida regUnidadMedida}) async {
    final _analytics = FirebaseAnalytics();
    await drUnidadMedida.child(regUnidadMedida.key).remove();
    _analytics.logEvent(name:  UNIDADMEDIDA.ENTIDAD + '_Borrado', parameters: regUnidadMedida.toJson());
  }

  static init() async {
    await drUnidadMedida.remove();
//    await InicializarUnidadMedida.init();
  }

  static todos(List<RegUnidadMedida> lista) async {
    // Lista de Unidades de Medidas
    lista.clear();
    drUnidadMedida.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = RegUnidadMedida();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

