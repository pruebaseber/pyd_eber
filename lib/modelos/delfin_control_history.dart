/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Delfin_Control_history -> Delfin Control History
   [Delfin API/Delfin Control]
*/

import 'package:pyd_eber/all-exports.dart';


class RegDelfinControlHistory {
  RegDelfinControlHistory({
    this.key = '',
    this.evento,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String evento;  // .Text [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.evento = value[DelfinControlHistory.EVENTO];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      DelfinControlHistory.EVENTO: this.evento,
    };
  }

  assign(RegDelfinControlHistory regDelfinControlHistory) {

    if (regDelfinControlHistory == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.evento = null; //"";
    } else {
      this.key = regDelfinControlHistory.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.evento = regDelfinControlHistory.evento;
    }
  }

  Map toMap() {
    Map map = {
      DelfinControlHistory.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      DelfinControlHistory.EVENTO: this.evento,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[DelfinControlHistory.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.evento = map[DelfinControlHistory.EVENTO];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final RegDelfinControlHistory typedOther = other;
    return
        evento == typedOther.evento;
  }

  @override
  int get hashCode => hashObjects([
      evento.hashCode,
  ]);

}

//==============================================================================
class DelfinControlHistory {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Delfin Control History';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Delfin Control History';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_EVENTO = 'Evento';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Delfin_Control_history';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'RegDelfinControlHistory';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String EVENTO = 'Evento';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, EVENTO,];
  static const List CAMPOS_DETALLE = [
 KEY, EVENTO,];

}

//==============================================================================
class DelfinControlHistoryFB {

  static DatabaseReference drDelfinControlHistory =
      FirebaseDatabase.instance.reference().child( DelfinControlHistory.ENTIDAD );

  static Future guardarRegDelfinControlHistory({RegDelfinControlHistory regDelfinControlHistory}) async {
    final _analytics = FirebaseAnalytics();

    if (regDelfinControlHistory.key == '') {
      regDelfinControlHistory.key = drDelfinControlHistory.push().key;
    }
    await drDelfinControlHistory.child(regDelfinControlHistory.key).update(regDelfinControlHistory.toJson());
    _analytics.logEvent(name:  DelfinControlHistory.ENTIDAD , parameters: regDelfinControlHistory.toJson());
  }

  static Future borrarRegDelfinControlHistory({RegDelfinControlHistory regDelfinControlHistory}) async {
    final _analytics = FirebaseAnalytics();
    await drDelfinControlHistory.child(regDelfinControlHistory.key).remove();
    _analytics.logEvent(name:  DelfinControlHistory.ENTIDAD + '_Borrado', parameters: regDelfinControlHistory.toJson());
  }

  static init() async {
    await drDelfinControlHistory.remove();
//    await InicializarDelfin_Control_history.init();
  }

  static todos(List<RegDelfinControlHistory> lista) async {
    // Lista de Delfin Control History
    lista.clear();
    drDelfinControlHistory.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = RegDelfinControlHistory();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

