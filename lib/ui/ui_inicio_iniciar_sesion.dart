// Proyecto: Delfin API
// Version: 1.0.0
// Autor: Alse Developers
// Unidad: iniciar-sesion.dart
// Iniciar Sesion

import 'package:pyd_eber/all-exports.dart';
//import 'package:pyd_eber';
//import 'package:pyd_eber_clientes/pyd/artilugios/ui_restar-uno.dart';

class UIInicioIniciarSesion extends StatefulWidget {
  static const String ruta = '/iniciarsesion';
  @override
  _UIInicioIniciarSesionState createState() => _UIInicioIniciarSesionState();
}

class _UIInicioIniciarSesionState extends State<UIInicioIniciarSesion> {
  void sesionIniciada() async {
    DEM.lSesionIniciada = true;
//    print('Sesión iniciada como '+Sesion.usuarioFire.correoelectronico);
//    print(Sesion.usuarioFb);
//    print(Sesion.usuarioFire.usuario);
//    print(Sesion.usuarioFire.autorizado);
    if (mounted) {
      setState(() {
//        print('Refrescando...');
      });
    } else {
      DEM.callBackInicioSetState();
    }
  }

  void usuarioNuevo() async {
    print('Usuario NUEVO ' + Sesion.usuarioFire.correoelectronico);

// Inicializar Datos básicos para funcionamiento preliminar
//    DEM.usuarioFire2Usuario(DEM.usuarioFire);
//    DEM.usuario.es = 'EsCliente';
//    await Usuarios.guardarUsuario(usuario: DEM.usuario);

//    DEM.gestor.key = DEM.usuario.key;
//    await Personas.guardarPersona(persona: DEM.gestor);
  }

  @override
  void initState() {
//    iniciarSesionDirecta();
    super.initState();
  }

  iniciarSesionDirecta() async {
    if (Sesion.usuarioFire.autorizado) {
      return;
    }
    await DEM.cerrarSesion();
    AuthResult authResult =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'pruebas.appuno1@gmail.com',
      password: '12345678',
    );
//    print('authResult: ${authResult.toString()}');
    Sesion.usuarioFb = authResult.user;
    await UsuariosFire.drUsuarios
        .child(Sesion.usuarioFb.uid)
        .once()
        .then((snapshot) async {
      if (snapshot != null) {
        Sesion.usuarioFire.fromSnapshot(snapshot);
        print('Sesión iniciada como ${Sesion.usuarioFire.correoelectronico}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    App.variables.calcular(context);
//    AppRes.appResMap[Co.USUARIO_FB].email = '';
//    AppRes.appResMap[Co.USUARIO_FB].password;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          width: CD.ancho * .8,
          height: CD.alto * .8,
        ),
        UIBackgroundLogin(
          ancho: CD.ancho * .8,
          alto: CD.alto * .8,
          colorFondo: AppRes.appResMap[Co.COLOR_6],
        ),

        UIIniciarSesion(
          usuarioRegistrado: usuarioNuevo,
          sesionIniciada: sesionIniciada,
        ),
//        Dispositivo(),
      ],
    );
  }
}
