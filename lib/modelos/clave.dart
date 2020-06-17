/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Clave -> Clave
   [Delfin API/Delfin Api Datos]
*/

import 'package:pyd_eber/all-exports.dart';


class RegClave {
  RegClave({
    this.key = '',
    this.codigoUsuario,
    this.contrasenia,
    this.acceso,
    this.puedeCambiarla,
    this.bloquear,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String codigoUsuario;  // .Text [Memo: String]
  String contrasenia;  // .Text [Memo: String]
  String acceso;  // .Text [Memo: String]
  bool puedeCambiarla;  // Lógico [Lógico: bool]
  bool bloquear;  // Lógico [Lógico: bool]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoUsuario = value[CLAVE.CODIGOUSUARIO];
    this.contrasenia = value[CLAVE.CONTRASENIA];
    this.acceso = value[CLAVE.ACCESO];
    this.puedeCambiarla = value[CLAVE.PUEDECAMBIARLA];
    this.bloquear = value[CLAVE.BLOQUEAR];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      CLAVE.CODIGOUSUARIO: this.codigoUsuario,
      CLAVE.CONTRASENIA: this.contrasenia,
      CLAVE.ACCESO: this.acceso,
      CLAVE.PUEDECAMBIARLA: this.puedeCambiarla,
      CLAVE.BLOQUEAR: this.bloquear,
    };
  }

  assign(RegClave regClave) {

    if (regClave == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoUsuario = null; //"";
      this.contrasenia = null; //"";
      this.acceso = null; //"";
      this.puedeCambiarla = null; //false;
      this.bloquear = null; //false;
    } else {
      this.key = regClave.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoUsuario = regClave.codigoUsuario;
      this.contrasenia = regClave.contrasenia;
      this.acceso = regClave.acceso;
      this.puedeCambiarla = regClave.puedeCambiarla;
      this.bloquear = regClave.bloquear;
    }
  }

  Map toMap() {
    Map map = {
      CLAVE.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      CLAVE.CODIGOUSUARIO: this.codigoUsuario,
      CLAVE.CONTRASENIA: this.contrasenia,
      CLAVE.ACCESO: this.acceso,
      CLAVE.PUEDECAMBIARLA: this.puedeCambiarla,
      CLAVE.BLOQUEAR: this.bloquear,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[CLAVE.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoUsuario = map[CLAVE.CODIGOUSUARIO];
    this.contrasenia = map[CLAVE.CONTRASENIA];
    this.acceso = map[CLAVE.ACCESO];
    this.puedeCambiarla = map[CLAVE.PUEDECAMBIARLA];
    this.bloquear = map[CLAVE.BLOQUEAR];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegClave typedOther = other;
    return
        codigoUsuario == typedOther.codigoUsuario &&
        contrasenia == typedOther.contrasenia &&
        acceso == typedOther.acceso &&
        puedeCambiarla == typedOther.puedeCambiarla &&
        bloquear == typedOther.bloquear;
  }

  @override
  int get hashCode => hashObjects([
      codigoUsuario.hashCode,
      contrasenia.hashCode,
      acceso.hashCode,
      puedeCambiarla.hashCode,
      bloquear.hashCode,
  ]);

}

//==============================================================================
class CLAVE {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Claves';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Clave';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CODIGOUSUARIO = 'CodigoUsuario';
  static const String ETIQUETA_CONTRASENIA = 'Contrasenia';
  static const String ETIQUETA_ACCESO = 'Acceso';
  static const String ETIQUETA_PUEDECAMBIARLA = 'PuedeCambiarla';
  static const String ETIQUETA_BLOQUEAR = 'Bloquear';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Clave';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegClave';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CODIGOUSUARIO = 'CodigoUsuario';
  static const String CONTRASENIA = 'Contrasenia';
  static const String ACCESO = 'Acceso';
  static const String PUEDECAMBIARLA = 'PuedeCambiarla';
  static const String BLOQUEAR = 'Bloquear';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, CODIGOUSUARIO, CONTRASENIA, ACCESO, PUEDECAMBIARLA, BLOQUEAR,];
  static const List CAMPOS_DETALLE = [
 KEY, CODIGOUSUARIO, CONTRASENIA, ACCESO, PUEDECAMBIARLA, BLOQUEAR,];

}

//==============================================================================
class ClaveFB {

  static DatabaseReference drClave =
      FirebaseDatabase.instance.reference().child(DELFIN).child( CLAVE.ENTIDAD );

  static Future guardarRegClave({RegClave regClave}) async {
    final _analytics = FirebaseAnalytics();

    if (regClave.key == '') {
      regClave.key = drClave.push().key;
    }
    await drClave.child(regClave.key).update(regClave.toJson());
    _analytics.logEvent(name:  CLAVE.ENTIDAD , parameters: regClave.toJson());
  }

  static Future borrarRegClave({RegClave regClave}) async {
    final _analytics = FirebaseAnalytics();
    await drClave.child(regClave.key).remove();
    _analytics.logEvent(name:  CLAVE.ENTIDAD + '_Borrado', parameters: regClave.toJson());
  }

  static init() async {
    await drClave.remove();
//    await InicializarClave.init();
  }

  static todos(List<RegClave> lista) async {
    // Lista de Claves
    lista.clear();
    drClave.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = RegClave();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

