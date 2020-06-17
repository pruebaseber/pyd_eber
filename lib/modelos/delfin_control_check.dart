/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Delfin_Control_check -> Delfin Control Check
   [Delfin API/Delfin Control]
*/

import 'package:pyd_eber/all-exports.dart';


class RegDelfinControlCheck {
  RegDelfinControlCheck({
    this.key = '',
    this.onLine,
    this.recibido,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String onLine;  // .Text [Memo: String]
  String recibido;  // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.onLine = value[DelfinControlCheck.ONLINE];
    this.recibido = value[DelfinControlCheck.RECIBIDO];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      DelfinControlCheck.ONLINE: this.onLine,
      DelfinControlCheck.RECIBIDO: this.recibido,
    };
  }

  assign(RegDelfinControlCheck regDelfinControlCheck) {

    if (regDelfinControlCheck == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.onLine = null; //"";
      this.recibido = null; //"";
    } else {
      this.key = regDelfinControlCheck.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.onLine = regDelfinControlCheck.onLine;
      this.recibido = regDelfinControlCheck.recibido;
    }
  }

  Map toMap() {
    Map map = {
      DelfinControlCheck.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      DelfinControlCheck.ONLINE: this.onLine,
      DelfinControlCheck.RECIBIDO: this.recibido,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[DelfinControlCheck.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.onLine = map[DelfinControlCheck.ONLINE];
    this.recibido = map[DelfinControlCheck.RECIBIDO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegDelfinControlCheck typedOther = other;
    return
        onLine == typedOther.onLine &&
        recibido == typedOther.recibido;
  }

  @override
  int get hashCode => hashObjects([
      onLine.hashCode,
      recibido.hashCode,
  ]);

}

//==============================================================================
class DelfinControlCheck {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Delfin Control Check';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Delfin Control Check';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_ONLINE = 'OnLine';
  static const String ETIQUETA_RECIBIDO = 'Recibido';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Delfin_Control_check';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegDelfinControlCheck';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ONLINE = 'OnLine';
  static const String RECIBIDO = 'Recibido';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, ONLINE, RECIBIDO,];
  static const List CAMPOS_DETALLE = [
 KEY, ONLINE, RECIBIDO,];

}

//==============================================================================
class DelfinControlCheckFB {

  static DatabaseReference drDelfinControlCheck =
      FirebaseDatabase.instance.reference().child( DelfinControlCheck.ENTIDAD );

  static Future guardarRegDelfinControlCheck({RegDelfinControlCheck regDelfinControlCheck}) async {
    final _analytics = FirebaseAnalytics();

    if (regDelfinControlCheck.key == '') {
      regDelfinControlCheck.key = drDelfinControlCheck.push().key;
    }
    await drDelfinControlCheck.child(regDelfinControlCheck.key).update(regDelfinControlCheck.toJson());
    _analytics.logEvent(name:  DelfinControlCheck.ENTIDAD , parameters: regDelfinControlCheck.toJson());
  }

  static Future borrarRegDelfinControlCheck({RegDelfinControlCheck regDelfinControlCheck}) async {
    final _analytics = FirebaseAnalytics();
    await drDelfinControlCheck.child(regDelfinControlCheck.key).remove();
    _analytics.logEvent(name:  DelfinControlCheck.ENTIDAD + '_Borrado', parameters: regDelfinControlCheck.toJson());
  }

  static init() async {
    await drDelfinControlCheck.remove();
//    await InicializarDelfin_Control_check.init();
  }

  static todos(List<RegDelfinControlCheck> lista) async {
    // Lista de Delfin Control Check
    lista.clear();
    drDelfinControlCheck.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = RegDelfinControlCheck();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

