/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Usuario -> Usuario
   [Delfin API/Delfin Api Datos]
*/

import 'package:pyd_eber/all-exports.dart';


class RegUsuario {
  RegUsuario({
    this.key = '',
    this.codigoUsuario,
    this.nombre,
    this.direccion,
    this.telefonoPrincipal,
    this.telefonoSecundario,
    this.correoElectronico,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String codigoUsuario;  // .Text [Memo: String]
  String nombre;  // .Text [Memo: String]
  String direccion;  // .Text [Memo: String]
  String telefonoPrincipal;  // .Text [Memo: String]
  String telefonoSecundario;  // .Text [Memo: String]
  String correoElectronico;  // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoUsuario = value[USUARIO.CODIGOUSUARIO];
    this.nombre = value[USUARIO.NOMBRE];
    this.direccion = value[USUARIO.DIRECCION];
    this.telefonoPrincipal = value[USUARIO.TELEFONOPRINCIPAL];
    this.telefonoSecundario = value[USUARIO.TELEFONOSECUNDARIO];
    this.correoElectronico = value[USUARIO.CORREOELECTRONICO];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      USUARIO.CODIGOUSUARIO: this.codigoUsuario,
      USUARIO.NOMBRE: this.nombre,
      USUARIO.DIRECCION: this.direccion,
      USUARIO.TELEFONOPRINCIPAL: this.telefonoPrincipal,
      USUARIO.TELEFONOSECUNDARIO: this.telefonoSecundario,
      USUARIO.CORREOELECTRONICO: this.correoElectronico,
    };
  }

  assign(RegUsuario regUsuario) {

    if (regUsuario == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoUsuario = null; //"";
      this.nombre = null; //"";
      this.direccion = null; //"";
      this.telefonoPrincipal = null; //"";
      this.telefonoSecundario = null; //"";
      this.correoElectronico = null; //"";
    } else {
      this.key = regUsuario.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.codigoUsuario = regUsuario.codigoUsuario;
      this.nombre = regUsuario.nombre;
      this.direccion = regUsuario.direccion;
      this.telefonoPrincipal = regUsuario.telefonoPrincipal;
      this.telefonoSecundario = regUsuario.telefonoSecundario;
      this.correoElectronico = regUsuario.correoElectronico;
    }
  }

  Map toMap() {
    Map map = {
      USUARIO.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      USUARIO.CODIGOUSUARIO: this.codigoUsuario,
      USUARIO.NOMBRE: this.nombre,
      USUARIO.DIRECCION: this.direccion,
      USUARIO.TELEFONOPRINCIPAL: this.telefonoPrincipal,
      USUARIO.TELEFONOSECUNDARIO: this.telefonoSecundario,
      USUARIO.CORREOELECTRONICO: this.correoElectronico,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[USUARIO.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.codigoUsuario = map[USUARIO.CODIGOUSUARIO];
    this.nombre = map[USUARIO.NOMBRE];
    this.direccion = map[USUARIO.DIRECCION];
    this.telefonoPrincipal = map[USUARIO.TELEFONOPRINCIPAL];
    this.telefonoSecundario = map[USUARIO.TELEFONOSECUNDARIO];
    this.correoElectronico = map[USUARIO.CORREOELECTRONICO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegUsuario typedOther = other;
    return
        codigoUsuario == typedOther.codigoUsuario &&
        nombre == typedOther.nombre &&
        direccion == typedOther.direccion &&
        telefonoPrincipal == typedOther.telefonoPrincipal &&
        telefonoSecundario == typedOther.telefonoSecundario &&
        correoElectronico == typedOther.correoElectronico;
  }

  @override
  int get hashCode => hashObjects([
      codigoUsuario.hashCode,
      nombre.hashCode,
      direccion.hashCode,
      telefonoPrincipal.hashCode,
      telefonoSecundario.hashCode,
      correoElectronico.hashCode,
  ]);

}

//==============================================================================
class USUARIO {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Usuarios';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Usuario';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_CODIGOUSUARIO = 'CodigoUsuario';
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_DIRECCION = 'Direccion';
  static const String ETIQUETA_TELEFONOPRINCIPAL = 'TelefonoPrincipal';
  static const String ETIQUETA_TELEFONOSECUNDARIO = 'TelefonoSecundario';
  static const String ETIQUETA_CORREOELECTRONICO = 'CorreoElectronico';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Usuario';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegUsuario';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String CODIGOUSUARIO = 'CodigoUsuario';
  static const String NOMBRE = 'Nombre';
  static const String DIRECCION = 'Direccion';
  static const String TELEFONOPRINCIPAL = 'TelefonoPrincipal';
  static const String TELEFONOSECUNDARIO = 'TelefonoSecundario';
  static const String CORREOELECTRONICO = 'CorreoElectronico';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, CODIGOUSUARIO, NOMBRE, DIRECCION, TELEFONOPRINCIPAL, TELEFONOSECUNDARIO, CORREOELECTRONICO,];
  static const List CAMPOS_DETALLE = [
 KEY, CODIGOUSUARIO, NOMBRE, DIRECCION, TELEFONOPRINCIPAL, TELEFONOSECUNDARIO, CORREOELECTRONICO,];

}

//==============================================================================
class UsuarioFB {

  static DatabaseReference drUsuario =
      FirebaseDatabase.instance.reference().child(DELFIN).child( USUARIO.ENTIDAD );

  static Future guardarRegUsuario({RegUsuario regUsuario}) async {
    final _analytics = FirebaseAnalytics();

    if (regUsuario.key == '') {
      regUsuario.key = drUsuario.push().key;
    }
    await drUsuario.child(regUsuario.key).update(regUsuario.toJson());
    _analytics.logEvent(name:  USUARIO.ENTIDAD , parameters: regUsuario.toJson());
  }

  static Future borrarRegUsuario({RegUsuario regUsuario}) async {
    final _analytics = FirebaseAnalytics();
    await drUsuario.child(regUsuario.key).remove();
    _analytics.logEvent(name:  USUARIO.ENTIDAD + '_Borrado', parameters: regUsuario.toJson());
  }

  static init() async {
    await drUsuario.remove();
//    await InicializarUsuario.init();
  }

  static todos(List<RegUsuario> lista) async {
    // Lista de Usuarios
    lista.clear();
    drUsuario.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = RegUsuario();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

