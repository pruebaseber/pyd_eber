/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad MedioPago -> Medio de Pago
   [Delfin API/Delfin Api Datos]
*/

import 'package:pyd_eber/all-exports.dart';


class RegMedioPago {
  RegMedioPago({
    this.key = '',
    this.codigoMedioPago,
    this.nombre,
    this.imagen,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String codigoMedioPago;  // .Text [Memo: String]
  String nombre;  // .Text [Memo: String]
  String imagen;  // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoMedioPago = value[MEDIOPAGO.CODIGOMEDIOPAGO];
    this.nombre = value[MEDIOPAGO.NOMBRE];
    this.imagen = value[MEDIOPAGO.IMAGEN];
    if (this.imagen == null) {
      this.imagen = '';
    }
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      MEDIOPAGO.CODIGOMEDIOPAGO: this.codigoMedioPago,
      MEDIOPAGO.NOMBRE: this.nombre,
      MEDIOPAGO.IMAGEN: this.imagen,
    };
  }

  assign(RegMedioPago regMedioPago) {

    if (regMedioPago == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoMedioPago = null; //"";
      this.nombre = null; //"";
      this.imagen = null; //"";
    } else {
      this.key = regMedioPago.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoMedioPago = regMedioPago.codigoMedioPago;
      this.nombre = regMedioPago.nombre;
      this.imagen = regMedioPago.imagen;
    }
  }

  Map toMap() {
    Map map = {
      MEDIOPAGO.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      MEDIOPAGO.CODIGOMEDIOPAGO: this.codigoMedioPago,
      MEDIOPAGO.NOMBRE: this.nombre,
      MEDIOPAGO.IMAGEN: this.imagen,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[MEDIOPAGO.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoMedioPago = map[MEDIOPAGO.CODIGOMEDIOPAGO];
    this.nombre = map[MEDIOPAGO.NOMBRE];
    this.imagen = map[MEDIOPAGO.IMAGEN];
    if (this.imagen == null) {
      this.imagen = '';
    }
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegMedioPago typedOther = other;
    return
        codigoMedioPago == typedOther.codigoMedioPago &&
        nombre == typedOther.nombre &&
        imagen == typedOther.imagen;
  }

  @override
  int get hashCode => hashObjects([
      codigoMedioPago.hashCode,
      nombre.hashCode,
      imagen.hashCode,
  ]);

}

//==============================================================================
class MEDIOPAGO {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Medios de Pago';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Medio de Pago';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CODIGOMEDIOPAGO = 'CodigoMedioPago';
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_IMAGEN = 'Imagen';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'MedioPago';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegMedioPago';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CODIGOMEDIOPAGO = 'CodigoMedioPago';
  static const String NOMBRE = 'Nombre';
  static const String IMAGEN = 'Imagen';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, CODIGOMEDIOPAGO, NOMBRE, IMAGEN,];
  static const List CAMPOS_DETALLE = [
 KEY, CODIGOMEDIOPAGO, NOMBRE, IMAGEN,];

}

//==============================================================================
class MedioPagoFB {

  static DatabaseReference drMedioPago =
      FirebaseDatabase.instance.reference().child(DELFIN).child( MEDIOPAGO.ENTIDAD );

  static Future guardarRegMedioPago({RegMedioPago regMedioPago}) async {
    final _analytics = FirebaseAnalytics();

    if (regMedioPago.key == '') {
      regMedioPago.key = drMedioPago.push().key;
    }
    await drMedioPago.child(regMedioPago.key).update(regMedioPago.toJson());
    _analytics.logEvent(name:  MEDIOPAGO.ENTIDAD , parameters: regMedioPago.toJson());
  }

  static Future borrarRegMedioPago({RegMedioPago regMedioPago}) async {
    final _analytics = FirebaseAnalytics();
    await drMedioPago.child(regMedioPago.key).remove();
    _analytics.logEvent(name:  MEDIOPAGO.ENTIDAD + '_Borrado', parameters: regMedioPago.toJson());
  }

  static init() async {
    await drMedioPago.remove();
//    await InicializarMedioPago.init();
  }

  static todos(List<RegMedioPago> lista) async {
    // Lista de Medios de Pago
    lista.clear();
    drMedioPago.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = RegMedioPago();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

