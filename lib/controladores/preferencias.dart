import 'package:shared_preferences/shared_preferences.dart';
//if (dart.library.html) 'package:shared_preferences_web/shared_preferences_web.dart';
//import 'package:shared_preferences_web/shared_preferences_web.dart';

class PreferenciasInternas {
  SharedPreferences prefs;

  inicializar() async {
    prefs = await SharedPreferences.getInstance();
  }

}
