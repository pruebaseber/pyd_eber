/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Dispositivos -> Dispositivo
   [P & D/Pedidos & Domicilios]
*/

import 'package:device_info/device_info.dart';
import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Dispositivo {
  Dispositivo({
    this.key = '',
    this.nombre,
    this.identificador,
    this.marca,
    this.modelo,
    this.clase,
    this.tipo,
    this.sistemaOperativo,
    this.versionSO,
    this.version,
    this.fechaCreacion,
    this.fechaUltimaConexion,
    this.conexiones,
    this.datos,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String nombre;  // Nombre [Texto Variable: String]
  String identificador;  // Nombre Componente [Texto Variable: String]
  String marca;  // Denominación 200 No Nulo [Texto Variable: String]
  String modelo;  // Denominación 200 No Nulo [Texto Variable: String]
  String clase;  // Denominación 200 No Nulo [Texto Variable: String]
  String tipo;  // Denominación 200 No Nulo [Texto Variable: String]
  String sistemaOperativo;  // Denominación 200 No Nulo [Texto Variable: String]
  String versionSO;  // Versión [Texto Variable: String]
  String version;  // Versión [Texto Variable: String]
  DateTime fechaCreacion;  // Fecha [Fecha: DateTime]
  DateTime fechaUltimaConexion;  // Fecha [Fecha: DateTime]
  int conexiones;
  Map<String, dynamic> datos;

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombre = value[DISPOSITIVOS.NOMBRE];
    this.identificador = value[DISPOSITIVOS.IDENTIFICADOR];
    this.marca = value[DISPOSITIVOS.MARCA];
    this.modelo = value[DISPOSITIVOS.MODELO];
    this.clase = value[DISPOSITIVOS.CLASE];
    this.tipo = value[DISPOSITIVOS.TIPO];
    this.sistemaOperativo = value[DISPOSITIVOS.SISTEMAOPERATIVO];
    this.versionSO = value[DISPOSITIVOS.VERSIONSO];
    this.version = value[DISPOSITIVOS.VERSION];
    this.fechaCreacion = LeerFecha(value[DISPOSITIVOS.FECHACREACION]);
    this.fechaUltimaConexion = LeerFecha(value[DISPOSITIVOS.FECHAULTIMACONEXION]);
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      DISPOSITIVOS.NOMBRE: this.nombre,
      DISPOSITIVOS.IDENTIFICADOR: this.identificador,
      DISPOSITIVOS.MARCA: this.marca,
      DISPOSITIVOS.MODELO: this.modelo,
      DISPOSITIVOS.CLASE: this.clase,
      DISPOSITIVOS.TIPO: this.tipo,
      DISPOSITIVOS.SISTEMAOPERATIVO: this.sistemaOperativo,
      DISPOSITIVOS.VERSIONSO: this.versionSO,
      DISPOSITIVOS.VERSION: this.version,
      DISPOSITIVOS.FECHACREACION: this.fechaCreacion == null ? null : GuardarFecha(this.fechaCreacion),
      DISPOSITIVOS.FECHAULTIMACONEXION: this.fechaUltimaConexion == null ? null : GuardarFecha(this.fechaUltimaConexion),
      'datos': json.encode(datos),
    };
  }

  assign(Dispositivo dispositivo) {

    if (dispositivo == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombre = null; //"";
      this.identificador = null; //"";
      this.marca = null; //"";
      this.modelo = null; //"";
      this.clase = null; //"";
      this.tipo = null; //"";
      this.sistemaOperativo = null; //"";
      this.versionSO = null; //"";
      this.version = null; //"";
      this.fechaCreacion = null; //DateTime.now();
      this.fechaUltimaConexion = null; //DateTime.now();
    } else {
      this.key = dispositivo.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombre = dispositivo.nombre;
      this.identificador = dispositivo.identificador;
      this.marca = dispositivo.marca;
      this.modelo = dispositivo.modelo;
      this.clase = dispositivo.clase;
      this.tipo = dispositivo.tipo;
      this.sistemaOperativo = dispositivo.sistemaOperativo;
      this.versionSO = dispositivo.versionSO;
      this.version = dispositivo.version;
      this.fechaCreacion = dispositivo.fechaCreacion;
      this.fechaUltimaConexion = dispositivo.fechaUltimaConexion;
    }
  }

  Map toMap() {
    Map map = {
      DISPOSITIVOS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      DISPOSITIVOS.NOMBRE: this.nombre,
      DISPOSITIVOS.IDENTIFICADOR: this.identificador,
      DISPOSITIVOS.MARCA: this.marca,
      DISPOSITIVOS.MODELO: this.modelo,
      DISPOSITIVOS.CLASE: this.clase,
      DISPOSITIVOS.TIPO: this.tipo,
      DISPOSITIVOS.SISTEMAOPERATIVO: this.sistemaOperativo,
      DISPOSITIVOS.VERSIONSO: this.versionSO,
      DISPOSITIVOS.VERSION: this.version,
      DISPOSITIVOS.FECHACREACION: this.fechaCreacion == null ? null : GuardarFecha(this.fechaCreacion),
      DISPOSITIVOS.FECHAULTIMACONEXION: this.fechaUltimaConexion == null ? null : GuardarFecha(this.fechaUltimaConexion),
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[DISPOSITIVOS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombre = map[DISPOSITIVOS.NOMBRE];
    this.identificador = map[DISPOSITIVOS.IDENTIFICADOR];
    this.marca = map[DISPOSITIVOS.MARCA];
    this.modelo = map[DISPOSITIVOS.MODELO];
    this.clase = map[DISPOSITIVOS.CLASE];
    this.tipo = map[DISPOSITIVOS.TIPO];
    this.sistemaOperativo = map[DISPOSITIVOS.SISTEMAOPERATIVO];
    this.versionSO = map[DISPOSITIVOS.VERSIONSO];
    this.version = map[DISPOSITIVOS.VERSION];
    this.fechaCreacion = map[DISPOSITIVOS.FECHACREACION] == null ? null : LeerFecha(map[DISPOSITIVOS.FECHACREACION]);
    this.fechaUltimaConexion = map[DISPOSITIVOS.FECHAULTIMACONEXION] == null ? null : LeerFecha(map[DISPOSITIVOS.FECHAULTIMACONEXION]);
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Dispositivo typedOther = other;
    return
        nombre == typedOther.nombre &&
        identificador == typedOther.identificador &&
        marca == typedOther.marca &&
        modelo == typedOther.modelo &&
        clase == typedOther.clase &&
        tipo == typedOther.tipo &&
        sistemaOperativo == typedOther.sistemaOperativo &&
        versionSO == typedOther.versionSO &&
        version == typedOther.version &&
        fechaCreacion == typedOther.fechaCreacion &&
        fechaUltimaConexion == typedOther.fechaUltimaConexion;
  }

  @override
  int get hashCode => hashObjects([
      nombre.hashCode,
      identificador.hashCode,
      marca.hashCode,
      modelo.hashCode,
      clase.hashCode,
      tipo.hashCode,
      sistemaOperativo.hashCode,
      versionSO.hashCode,
      version.hashCode,
      fechaCreacion.hashCode,
      fechaUltimaConexion.hashCode,
  ]);

  fromAndroidDeviceInfo(AndroidDeviceInfo adi) {
    if (adi == null) {
      this.assign(null);
      return;
    }
    this.key = adi.androidId;
    this.nombre = adi.device;
    this.identificador = adi.androidId;
    this.marca = adi.brand;
    this.modelo = adi.model;
    this.clase = adi.product;
    this.tipo = adi.type;
    this.sistemaOperativo = adi.version.codename;
    this.versionSO = adi.version.release;
    this.version = adi.version.incremental;
//    this.fechaCreacion = ;
//    this.fechaUltimaConexion = ;
  }
}

//==============================================================================
class DISPOSITIVOS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Dispositivos';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Dispositivo';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_NOMBRE = 'Nombre';
  static const String ETIQUETA_IDENTIFICADOR = 'Identificador';
  static const String ETIQUETA_MARCA = 'Marca';
  static const String ETIQUETA_MODELO = 'Modelo';
  static const String ETIQUETA_CLASE = 'Clase';
  static const String ETIQUETA_TIPO = 'Tipo';
  static const String ETIQUETA_SISTEMAOPERATIVO = 'Sistema Operativo';
  static const String ETIQUETA_VERSIONSO = 'Versión SO';
  static const String ETIQUETA_VERSION = 'Versión';
  static const String ETIQUETA_FECHACREACION = 'Fecha Creación';
  static const String ETIQUETA_FECHAULTIMACONEXION = 'Fecha Última Conexión';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Dispositivos';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Dispositivo';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String NOMBRE = 'nombre';
  static const String IDENTIFICADOR = 'identificador';
  static const String MARCA = 'marca';
  static const String MODELO = 'modelo';
  static const String CLASE = 'clase';
  static const String TIPO = 'tipo';
  static const String SISTEMAOPERATIVO = 'sistemaOperativo';
  static const String VERSIONSO = 'versionSO';
  static const String VERSION = 'version';
  static const String FECHACREACION = 'fechaCreacion';
  static const String FECHAULTIMACONEXION = 'fechaUltimaConexion';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, NOMBRE, IDENTIFICADOR, MARCA, MODELO, CLASE, TIPO, SISTEMAOPERATIVO, VERSIONSO, VERSION, FECHACREACION, FECHAULTIMACONEXION,];
  static const List CAMPOS_DETALLE = [
 KEY, NOMBRE, IDENTIFICADOR, MARCA, MODELO, CLASE, TIPO, SISTEMAOPERATIVO, VERSIONSO, VERSION, FECHACREACION, FECHAULTIMACONEXION,];

}

//==============================================================================
class DispositivosFB {

  static DatabaseReference drDispositivos =
      FirebaseDatabase.instance.reference().child( DISPOSITIVOS.ENTIDAD );

  static fb_web.DatabaseReference drDispositivosWeb =
      fb_web.database().ref( DISPOSITIVOS.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drDispositivosWeb.onValue;
    } else {
      return drDispositivos.onValue;
    }
  }

  static Future guardarDispositivo({Dispositivo dispositivo}) async {
    final _analytics = FirebaseAnalytics();

    if (dispositivo.key == '') {
      dispositivo.key = drDispositivos.push().key;
    }
    if (dispositivo.fechaCreacion == null) {
      dispositivo.fechaCreacion = DateTime.now();
    }
    dispositivo.fechaUltimaConexion = DateTime.now();
    await drDispositivos.child(dispositivo.key).update(dispositivo.toJson());
    _analytics.logEvent(name:  DISPOSITIVOS.ENTIDAD , parameters: dispositivo.toJson());
  }

  static Future borrarDispositivo({Dispositivo dispositivo}) async {
    final _analytics = FirebaseAnalytics();
    await drDispositivos.child(dispositivo.key).remove();
    _analytics.logEvent(name:  DISPOSITIVOS.ENTIDAD + '_Borrado', parameters: dispositivo.toJson());
  }

  static init() async {
    await drDispositivos.remove();
    // await InicializarDispositivos.init();
  }

  static todos(List<Dispositivo> lista) async {
    // Lista de Dispositivos
    lista.clear();
    drDispositivos.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Dispositivo();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

