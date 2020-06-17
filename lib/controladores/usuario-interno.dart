import 'package:pyd_eber/all-exports.dart';

class UsuarioInternoControlador {
  static const usuarioInterno = 'pruebas.appuno1@gmail.com';
  static const claveInterna = '12345678';
  static PlatformException platformException;

  static esperar(int milisecs) {
    final duration = Duration(milliseconds: milisecs);
    return Future.delayed(duration).then((value) => null);
  }

  static iniciarSesionUsuarioInterno() async {
    AuthResult authResult;
//    await esperar(3500);
    try {
      authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: usuarioInterno, password: claveInterna);
    } catch(e) {
      if (e is PlatformException) {
        print(e.code);
        print(e.message);
        if (e.code == 'ERROR_WRONG_PASSWORD') {
          platformException = PlatformException(code: e.code, message: 'Error de configuración interna (EWP)');
        }
        if (e.code == 'ERROR_USER_NOT_FOUND') {
          platformException = PlatformException(code: e.code, message: 'Error de configuración interna (EUNF)');
        }
        if (e.code == 'ERROR_NETWORK_REQUEST_FAILED') {
          platformException = PlatformException(code: e.code, message: 'Falla conexión a Internet');
          // TODO: Timer para chequeo recursivo hasta que haya conexión a internet y reintentar de nuevo el inicio de sesión
        }
      } else {
        print(e);
      }
    }
    if (authResult != null) {
      print('Name: ${authResult.user.displayName}');
      print('Email: ${authResult.user.email}');
      Sesion.usuarioFb = authResult.user;
      Sesion.lConexionCerrada = false;
      DEM.infoDispositivo.guardarInfoDispositivo();
    } else {
      Sesion.usuarioFb = null;
    }
  }
}
