/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Modelo (MVC) de Entidad Noticias -> Noticia
   [P & D/Pedidos & Domicilios]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;


class Noticia {
  Noticia({
    this.key = '',
    this.titular,
    this.imagen,
    this.det,
  });

  String key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
  String titular;  // Denominación 200 No Nulo [Texto Variable: String]
  String imagen;  // URI Imagen [Texto Variable: String]
  String det;  // Texto RTF [Memo: String]

  fromSnapshot(DataSnapshot data) {
    this.fromKeyValue(data.key, data.value);
  }

  fromKeyValue(String key, Map value) {
    this.key = key; // Incluido por usar Firebase Database, pero no en Dendrita
    this.titular = value[NOTICIAS.TITULAR];
    this.imagen = value[NOTICIAS.IMAGEN];
    this.det = value[NOTICIAS.DET];
  }

  toJson() {
    return {
      'key': this.key, // Incluido por usar Firebase Database, pero no en Dendrita
      NOTICIAS.TITULAR: this.titular,
      NOTICIAS.IMAGEN: this.imagen,
      NOTICIAS.DET: this.det,
    };
  }

  assign(Noticia noticia) {

    if (noticia == null) {
      this.key = '';  // Incluido por usar Firebase Database, pero no en Dendrita
      this.titular = null; //"";
      this.imagen = null; //"";
      this.det = null; //"";
    } else {
      this.key = noticia.key; // Incluido por usar Firebase Database, pero no en Dendrita
      this.titular = noticia.titular;
      this.imagen = noticia.imagen;
      this.det = noticia.det;
    }
  }

  Map toMap() {
    Map map = {
      NOTICIAS.KEY: this.key,  // Incluido por usar Firebase Database, pero no en Dendrita
      NOTICIAS.TITULAR: this.titular,
      NOTICIAS.IMAGEN: this.imagen,
      NOTICIAS.DET: this.det,
    };
    return map;
  }

  fromMap(Map map) {
    if (map == null) {
      this.assign(null);
      return;
    }
    this.key = map[NOTICIAS.KEY];  // Incluido por usar Firebase Database, pero no en Dendrita
    this.titular = map[NOTICIAS.TITULAR];
    this.imagen = map[NOTICIAS.IMAGEN];
    this.det = map[NOTICIAS.DET];
  }

  // Comparar si dos instancias de esta Clase son idénticas con el operador ==
  @override
  bool operator == (dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Noticia typedOther = other;
    return
        titular == typedOther.titular &&
        imagen == typedOther.imagen &&
        det == typedOther.det;
  }

  @override
  int get hashCode => hashObjects([
      titular.hashCode,
      imagen.hashCode,
      det.hashCode,
  ]);

}

//==============================================================================
class NOTICIAS {

  // Etiquetas de la Entidad
  static const String ETIQUETA_ENTIDAD = 'Noticias';
  // Etiqueta de un Registro de la Tabla
  static const String ETIQUETA_REGISTRO = 'Noticia';

  // Etiquetas de los Atributos

  static const String ETIQUETA_KEY = 'Key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String ETIQUETA_TITULAR = 'Titular';
  static const String ETIQUETA_IMAGEN = 'Imagen';
  static const String ETIQUETA_DET = 'Detalle';

  // Nombre Real de la Entidad en la Base de Datos
  static const String ENTIDAD = 'Noticias';
  // Nombre de un Registro de la Entidad
  static const String REGISTRO = 'Noticia';

  // Nombre de los Atributos (Campos) reales en la Base de Datos
  static const String KEY = 'key'; // Incluido por usar Firebase Database, pero no en Dendrita
  static const String TITULAR = 'titular';
  static const String IMAGEN = 'imagen';
  static const String DET = 'det';

  // Para la conexión con el API
  static const String ENDPOINT = ENTIDAD+'/';
  static const String ENDPOINTLISTA = 'lista_'+ENTIDAD+'/';
  static const String ENDPOINTDET = 'det_'+ENTIDAD+'/';
  static const String RUTA = '/'+ENTIDAD;

  static const List CAMPOS_LISTADO = [
 KEY, TITULAR, IMAGEN, DET,];
  static const List CAMPOS_DETALLE = [
 KEY, TITULAR, IMAGEN, DET,];

}

//==============================================================================
class NoticiasFB {

  static DatabaseReference drNoticias =
      FirebaseDatabase.instance.reference().child( NOTICIAS.ENTIDAD );

  static fb_web.DatabaseReference drNoticiasWeb =
      fb_web.database().ref( NOTICIAS.ENTIDAD );

  static Stream<dynamic> onValue() {
    if (kIsWeb) {
      return drNoticiasWeb.onValue;
    } else {
      return drNoticias.onValue;
    }
  }

  static Future guardarNoticia({Noticia noticia}) async {
    final _analytics = FirebaseAnalytics();

    if (noticia.key == '') {
      noticia.key = drNoticias.push().key;
    }
    await drNoticias.child(noticia.key).update(noticia.toJson());
    _analytics.logEvent(name:  NOTICIAS.ENTIDAD , parameters: noticia.toJson());
  }

  static Future borrarNoticia({Noticia noticia}) async {
    final _analytics = FirebaseAnalytics();
    await drNoticias.child(noticia.key).remove();
    _analytics.logEvent(name:  NOTICIAS.ENTIDAD + '_Borrado', parameters: noticia.toJson());
  }

  static init() async {
    await drNoticias.remove();
    // await InicializarNoticias.init();
  }

  static todos(List<Noticia> lista) async {
    // Lista de Noticias
    lista.clear();
    drNoticias.onValue.listen((event) {
      if ((event != null) && (event.snapshot != null) && (event.snapshot.value != null)) {
        Map<dynamic, dynamic> _lista = event.snapshot.value;
        _lista.forEach((key, value) {
          final registro = Noticia();
          registro.fromKeyValue(key, value);
          lista.add(registro);
        });
        lista.sort((a,b) => a.key.compareTo(b.key));
      }
    });
  }
}

