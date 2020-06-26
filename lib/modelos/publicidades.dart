/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Publicidades -> Publicidad
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;

import 'enumeradores.dart';
//import 'package:firebase/firebase.dart' as fb_web;

class Publicidad {
  Publicidad({
    this.key = '',
    this.nombreEmpresaquepagaPublicidad = '',
    this.sitioweb = '',
    this.nombreinterno = '',
    this.fechaActivacion,
    this.fechaDesactivacion,
    this.repetir = RepetirPromocion.IntervaloDias,
    this.repetircada = 1,
    this.imagen = '',
    this.producto = '',
    this.nivelPrioridad = 1,
    this.nota = '',
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String nombreEmpresaquepagaPublicidad;  // Denominación 200 No Nulo [Texto Variable: String]
  String sitioweb;  // URI [Texto Variable: String]
  String nombreinterno;  // Denominación 200 No Nulo [Texto Variable: String]
  DateTime fechaActivacion;  // Fecha [Fecha: DateTime]
  DateTime fechaDesactivacion;  // Fecha [Fecha: DateTime]
  RepetirPromocion repetir;  // Repetir [Texto Variable: String]
  int repetircada;  // Entero Pequeño [Entero Pequeño: int]
  String imagen;  // URI Imagen [Texto Variable: String]
  String producto;  // Id/Key [Texto Variable: String]
  int nivelPrioridad;  // Entero Pequeño [Entero Pequeño: int]
  String nota;  // Nota [Texto Variable: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombreEmpresaquepagaPublicidad = value[PUBLICIDADES.NOMBREEMPRESAQUEPAGAPUBLICIDAD];
    this.sitioweb = value[PUBLICIDADES.SITIOWEB];
    this.nombreinterno = value[PUBLICIDADES.NOMBREINTERNO];
    this.fechaActivacion = LeerFecha(value[PUBLICIDADES.FECHAACTIVACION]);
    this.fechaDesactivacion = LeerFecha(value[PUBLICIDADES.FECHADESACTIVACION]);
    this.repetir = string2RepetirPromocion(value[PUBLICIDADES.REPETIR]);
    this.repetircada = value[PUBLICIDADES.REPETIRCADA];
    this.imagen = value[PUBLICIDADES.IMAGEN];
    this.producto = value[PUBLICIDADES.PRODUCTO];
    this.nivelPrioridad = value[PUBLICIDADES.NIVELPRIORIDAD];
    this.nota = value[PUBLICIDADES.NOTA];
  }

  Map<String, dynamic> toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      PUBLICIDADES.NOMBREEMPRESAQUEPAGAPUBLICIDAD: this.nombreEmpresaquepagaPublicidad,
      PUBLICIDADES.SITIOWEB: this.sitioweb,
      PUBLICIDADES.NOMBREINTERNO: this.nombreinterno,
      PUBLICIDADES.FECHAACTIVACION: this.fechaActivacion == null ? null : GuardarFecha(this.fechaActivacion),
      PUBLICIDADES.FECHADESACTIVACION: this.fechaDesactivacion == null ? null : GuardarFecha(this.fechaDesactivacion),
      PUBLICIDADES.REPETIR: repetirPromocion2String(this.repetir),
      PUBLICIDADES.REPETIRCADA: this.repetircada,
      PUBLICIDADES.IMAGEN: this.imagen,
      PUBLICIDADES.PRODUCTO: this.producto,
      PUBLICIDADES.NIVELPRIORIDAD: this.nivelPrioridad,
      PUBLICIDADES.NOTA: this.nota,
    };
  }

  assign(Publicidad publicidad) {
    if (publicidad == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombreEmpresaquepagaPublicidad = null; //"";
      this.sitioweb = null; //"";
      this.nombreinterno = null; //"";
      this.fechaActivacion = null; //DateTime.now();
      this.fechaDesactivacion = null; //DateTime.now();
      this.repetir = null; //"";
      this.repetircada = null; //0;
      this.imagen = null; //"";
      this.producto = null; //"";
      this.nivelPrioridad = null; //0;
      this.nota = null; //"";
    } else {
      this.key = publicidad.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.nombreEmpresaquepagaPublicidad = publicidad.nombreEmpresaquepagaPublicidad;
      this.sitioweb = publicidad.sitioweb;
      this.nombreinterno = publicidad.nombreinterno;
      this.fechaActivacion = publicidad.fechaActivacion;
      this.fechaDesactivacion = publicidad.fechaDesactivacion;
      this.repetir = publicidad.repetir;
      this.repetircada = publicidad.repetircada;
      this.imagen = publicidad.imagen;
      this.producto = publicidad.producto;
      this.nivelPrioridad = publicidad.nivelPrioridad;
      this.nota = publicidad.nota;
    }
  }

  Map toMap() {
    Map map = {
      PUBLICIDADES.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      PUBLICIDADES.NOMBREEMPRESAQUEPAGAPUBLICIDAD: this.nombreEmpresaquepagaPublicidad,
      PUBLICIDADES.SITIOWEB: this.sitioweb,
      PUBLICIDADES.NOMBREINTERNO: this.nombreinterno,
      PUBLICIDADES.FECHAACTIVACION: this.fechaActivacion == null ? null : GuardarFecha(this.fechaActivacion),
      PUBLICIDADES.FECHADESACTIVACION: this.fechaDesactivacion == null ? null : GuardarFecha(this.fechaDesactivacion),
      PUBLICIDADES.REPETIR: repetirPromocion2String(this.repetir),
      PUBLICIDADES.REPETIRCADA: this.repetircada,
      PUBLICIDADES.IMAGEN: this.imagen,
      PUBLICIDADES.PRODUCTO: this.producto,
      PUBLICIDADES.NIVELPRIORIDAD: this.nivelPrioridad,
      PUBLICIDADES.NOTA: this.nota,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[PUBLICIDADES.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.nombreEmpresaquepagaPublicidad = map[PUBLICIDADES.NOMBREEMPRESAQUEPAGAPUBLICIDAD];
    this.sitioweb = map[PUBLICIDADES.SITIOWEB];
    this.nombreinterno = map[PUBLICIDADES.NOMBREINTERNO];
    this.fechaActivacion = map[PUBLICIDADES.FECHAACTIVACION] == null ? null : LeerFecha(map[PUBLICIDADES.FECHAACTIVACION]);
    this.fechaDesactivacion = map[PUBLICIDADES.FECHADESACTIVACION] == null ? null : LeerFecha(map[PUBLICIDADES.FECHADESACTIVACION]);
    this.repetir = string2RepetirPromocion(map[PUBLICIDADES.REPETIR]);
    this.repetircada = map[PUBLICIDADES.REPETIRCADA];
    this.imagen = map[PUBLICIDADES.IMAGEN];
    this.producto = map[PUBLICIDADES.PRODUCTO];
    this.nivelPrioridad = map[PUBLICIDADES.NIVELPRIORIDAD];
    this.nota = map[PUBLICIDADES.NOTA];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Publicidad typedOther = other;
    return
        nombreEmpresaquepagaPublicidad == typedOther.nombreEmpresaquepagaPublicidad &&
        sitioweb == typedOther.sitioweb &&
        nombreinterno == typedOther.nombreinterno &&
        fechaActivacion == typedOther.fechaActivacion &&
        fechaDesactivacion == typedOther.fechaDesactivacion &&
        repetir == typedOther.repetir &&
        repetircada == typedOther.repetircada &&
        imagen == typedOther.imagen &&
        producto == typedOther.producto &&
        nivelPrioridad == typedOther.nivelPrioridad &&
        nota == typedOther.nota;
  }

  @override
  int get hashCode => hashObjects([
      nombreEmpresaquepagaPublicidad.hashCode,
      sitioweb.hashCode,
      nombreinterno.hashCode,
      fechaActivacion.hashCode,
      fechaDesactivacion.hashCode,
      repetir.hashCode,
      repetircada.hashCode,
      imagen.hashCode,
      producto.hashCode,
      nivelPrioridad.hashCode,
      nota.hashCode,
  ]);

}

//==============================================================================
class PUBLICIDADES {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Publicidades';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Publicidad';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_NOMBREEMPRESAQUEPAGAPUBLICIDAD = 'Nombre de Empresa que paga la Publicidad';
  static const String ETIQUETA_SITIOWEB = 'Sitio web';
  static const String ETIQUETA_NOMBREINTERNO = 'Nombre interno';
  static const String ETIQUETA_FECHAACTIVACION = 'Fecha de Activación';
  static const String ETIQUETA_FECHADESACTIVACION = 'Fecha de Desactivación';
  static const String ETIQUETA_REPETIR = 'Repetir';
  static const String ETIQUETA_REPETIRCADA = 'Repetir cada';
  static const String ETIQUETA_IMAGEN = 'Imagen';
  static const String ETIQUETA_PRODUCTO = 'Producto';
  static const String ETIQUETA_NIVELPRIORIDAD = 'Nivel de Prioridad';
  static const String ETIQUETA_NOTA = 'Nota';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Publicidades';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Publicidad';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String NOMBREEMPRESAQUEPAGAPUBLICIDAD = 'NombreEmpresaquepagaPublicidad';
  static const String SITIOWEB = 'SitioWeb';
  static const String NOMBREINTERNO = 'NombreInterno';
  static const String FECHAACTIVACION = 'FechaActivacion';
  static const String FECHADESACTIVACION = 'FechaDesactivacion';
  static const String REPETIR = 'Repetir';
  static const String REPETIRCADA = 'RepetirCada';
  static const String IMAGEN = 'Imagen';
  static const String PRODUCTO = 'Producto';
  static const String NIVELPRIORIDAD = 'NivelPrioridad';
  static const String NOTA = 'Nota';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, NOMBREEMPRESAQUEPAGAPUBLICIDAD, SITIOWEB, NOMBREINTERNO, FECHAACTIVACION, FECHADESACTIVACION, REPETIR, REPETIRCADA, IMAGEN, PRODUCTO, NIVELPRIORIDAD, NOTA,];
  static const List CAMPOS_DETALLE = [
 KEY, NOMBREEMPRESAQUEPAGAPUBLICIDAD, SITIOWEB, NOMBREINTERNO, FECHAACTIVACION, FECHADESACTIVACION, REPETIR, REPETIRCADA, IMAGEN, PRODUCTO, NIVELPRIORIDAD, NOTA,];

}

//==============================================================================
class PublicidadesFB {

  static DatabaseReference drPublicidades =
      FirebaseDatabase.instance.reference().child( PUBLICIDADES.ENTIDAD );

  static fb_web.DatabaseReference drPublicidadesWeb =
      fb_web.database().ref( PUBLICIDADES.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drPublicidadesWeb.onValue;
    } else {
      return drPublicidades.onValue;
    }
  }

  static Future guardarPublicidad({Publicidad publicidad}) async {
//    final _analytics = FirebaseAnalytics();
//    String logName = PUBLICIDADES.ENTIDAD;
//    Map<String, dynamic> logParameters;

    if (publicidad.key == '') {
//      logName = logName+'_Nuevo';
      if (kIsWeb) {
        publicidad.key = drPublicidadesWeb.push().key;
      } else {
        publicidad.key = drPublicidades.push().key;
      }
    } else {
//      logName = logName+'_Modificado';
    }
    if (kIsWeb) {
      await drPublicidadesWeb.child(publicidad.key).update(publicidad.toJson());
    } else {
      await drPublicidades.child(publicidad.key).update(publicidad.toJson());
    }
//    logParameters = publicidad.toJson();
//    _analytics.logEvent(name: logName, parameters: logParameters);
//    print('Sin ERROR _analytics.logEvent(name: logName, parameters: logParameters);');
  }

  static Future borrarPublicidad({Publicidad publicidad}) async {
    final _analytics = FirebaseAnalytics();

    if (kIsWeb) {
      await drPublicidadesWeb.child(publicidad.key).remove();
    } else {
      await drPublicidades.child(publicidad.key).remove();
    }
    _analytics.logEvent(name:  PUBLICIDADES.ENTIDAD + '_Borrado', parameters: publicidad.toMap());
  }

  static todos(List<Publicidad> lista) async {
    // Lista de Publicidades
    lista.clear();
    onValue().listen((event) {
      List _lista = dataWebMobile(event);
      if (_lista != null) {
        _lista.forEach((element) {
          final registro = Publicidad();
          registro.fromMap(element);
          lista.add(registro);
        });
        lista.sort((a,b) => a.nivelPrioridad.compareTo(b.nivelPrioridad));
      }
//      dataWebMobile()
//      drPublicidades.onValue.listen((event) {
//      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
//        Map<dynamic, dynamic> _lista = event.snapshot.value;
//        _lista.forEach((key, value) {
//          final registro = Publicidad();
//          registro.fromKeyValue(key, value);
//          lista.add(registro);
//        });
//        lista.sort((a,b) => a.key.compareTo(b.key));
//      }
    });
  }
}

