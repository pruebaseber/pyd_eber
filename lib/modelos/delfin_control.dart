/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Delfin_Control -> Delfin Control
   [Delfin API/Delfin Control]
*/

import 'package:pyd_eber/all-exports.dart';


class RegDelfinControl {
  RegDelfinControl({
    this.key = '',
    this.ultimaActualizacion,
    this.duracionIntervaloActualizacion,
    this.ejecutarActualizacionAhora,
    this.mensaje,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String ultimaActualizacion;  // .Text [Memo: String]
  String duracionIntervaloActualizacion;  // .Text [Memo: String]
  bool ejecutarActualizacionAhora;  // Lógico [Lógico: bool]
  String mensaje;  // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.ultimaActualizacion = value[DelfinControl.ULTIMAACTUALIZACION];
    this.duracionIntervaloActualizacion = value[DelfinControl.DURACIONINTERVALOACTUALIZACION];
    this.ejecutarActualizacionAhora = value[DelfinControl.EJECUTARACTUALIZACIONAHORA];
    this.mensaje = value[DelfinControl.MENSAJE];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      DelfinControl.ULTIMAACTUALIZACION: this.ultimaActualizacion,
      DelfinControl.DURACIONINTERVALOACTUALIZACION: this.duracionIntervaloActualizacion,
      DelfinControl.EJECUTARACTUALIZACIONAHORA: this.ejecutarActualizacionAhora,
      DelfinControl.MENSAJE: this.mensaje,
    };
  }

  assign(RegDelfinControl regDelfinControl) {

    if (regDelfinControl == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.ultimaActualizacion = null; //"";
      this.duracionIntervaloActualizacion = null; //"";
      this.ejecutarActualizacionAhora = null; //false;
      this.mensaje = null; //"";
    } else {
      this.key = regDelfinControl.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.ultimaActualizacion = regDelfinControl.ultimaActualizacion;
      this.duracionIntervaloActualizacion = regDelfinControl.duracionIntervaloActualizacion;
      this.ejecutarActualizacionAhora = regDelfinControl.ejecutarActualizacionAhora;
      this.mensaje = regDelfinControl.mensaje;
    }
  }

  Map toMap() {
    Map map = {
      DelfinControl.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      DelfinControl.ULTIMAACTUALIZACION: this.ultimaActualizacion,
      DelfinControl.DURACIONINTERVALOACTUALIZACION: this.duracionIntervaloActualizacion,
      DelfinControl.EJECUTARACTUALIZACIONAHORA: this.ejecutarActualizacionAhora,
      DelfinControl.MENSAJE: this.mensaje,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[DelfinControl.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.ultimaActualizacion = map[DelfinControl.ULTIMAACTUALIZACION];
    this.duracionIntervaloActualizacion = map[DelfinControl.DURACIONINTERVALOACTUALIZACION];
    this.ejecutarActualizacionAhora = map[DelfinControl.EJECUTARACTUALIZACIONAHORA];
    this.mensaje = map[DelfinControl.MENSAJE];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegDelfinControl typedOther = other;
    return
        ultimaActualizacion == typedOther.ultimaActualizacion &&
        duracionIntervaloActualizacion == typedOther.duracionIntervaloActualizacion &&
        ejecutarActualizacionAhora == typedOther.ejecutarActualizacionAhora &&
        mensaje == typedOther.mensaje;
  }

  @override
  int get hashCode => hashObjects([
      ultimaActualizacion.hashCode,
      duracionIntervaloActualizacion.hashCode,
      ejecutarActualizacionAhora.hashCode,
      mensaje.hashCode,
  ]);

}

//==============================================================================
class DelfinControl {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Delfin Control';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Delfin Control';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ULTIMAACTUALIZACION = 'UltimaActualizacion';
  static const String ETIQUETA_DURACIONINTERVALOACTUALIZACION = 'DuracionIntervaloActualizacion';
  static const String ETIQUETA_EJECUTARACTUALIZACIONAHORA = 'EjecutarActualizacionAhora';
  static const String ETIQUETA_MENSAJE = 'Mensaje';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Delfin_Control';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegDelfinControl';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ULTIMAACTUALIZACION = 'UltimaActualizacion';
  static const String DURACIONINTERVALOACTUALIZACION = 'DuracionIntervaloActualizacion';
  static const String EJECUTARACTUALIZACIONAHORA = 'EjecutarActualizacionAhora';
  static const String MENSAJE = 'Mensaje';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ULTIMAACTUALIZACION, DURACIONINTERVALOACTUALIZACION, EJECUTARACTUALIZACIONAHORA, MENSAJE,];
  static const List CAMPOS_DETALLE = [
 KEY, ULTIMAACTUALIZACION, DURACIONINTERVALOACTUALIZACION, EJECUTARACTUALIZACIONAHORA, MENSAJE,];

}

//==============================================================================
class DelfinControlFB {

  static DatabaseReference drDelfinControl =
      FirebaseDatabase.instance.reference().child( DelfinControl.ENTIDAD );

  static Future guardarRegDelfinControl({RegDelfinControl regDelfinControl}) async {
    final _analytics = FirebaseAnalytics();

    if (regDelfinControl.key == '') {
      regDelfinControl.key = drDelfinControl.push().key;
    }
    await drDelfinControl.child(regDelfinControl.key).update(regDelfinControl.toJson());
    _analytics.logEvent(name:  DelfinControl.ENTIDAD , parameters: regDelfinControl.toJson());
  }

  static Future borrarRegDelfinControl({RegDelfinControl regDelfinControl}) async {
    final _analytics = FirebaseAnalytics();
    await drDelfinControl.child(regDelfinControl.key).remove();
    _analytics.logEvent(name:  DelfinControl.ENTIDAD + '_Borrado', parameters: regDelfinControl.toJson());
  }

  static init() async {
    await drDelfinControl.remove();
//    await InicializarDelfin_Control.init();
  }

  static todos(List<RegDelfinControl> lista) async {
    // Lista de Delfin Control
    lista.clear();
    drDelfinControl.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = RegDelfinControl();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

