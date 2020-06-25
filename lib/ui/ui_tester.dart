import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/modelos/publicidades.dart';
import 'package:pyd_eber/ui/ui_boton_pyd.dart';
import 'package:pyd_eber/ui/ui_modo.dart';
import 'package:pyd_eber/ui/ui_publicidades.dart';

class UITester extends StatefulWidget {
  @override
  _UITesterState createState() => _UITesterState();
}

class _UITesterState extends State<UITester> {
  bool lIniciado = false;

  iniciar() async {
    lIniciado = true;
    DEM.listaMensajes = 'INICIO';
    DEM.internalLog.clear();
    Sesion.cerrarSesion();
    if (!kIsWeb) {
      DEM.dir = await getApplicationDocumentsDirectory();
    }
    DEM.iniciar();

    Navigator.pushNamed(context, UIInicio.ruta);
  }

  @override
  void initState() {
    // TODO: Iniciar sesión de Usuario Interno para pruebas
//    FirebaseAuth.instance.signInWithEmailAndPassword(email: 'xxx@gmail.com', password: '123455');
    //PromocionesFB.init();
    PublicidadesFB.init();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //
    Responsive.calcularResponsive(context);
    //
    if (!lIniciado) {
      Timer(Duration(milliseconds: 200), () {
//        iniciar();
      });
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<UsuarioInternoBloc>(
          create: (context) =>
          UsuarioInternoBloc()..add(UsuarioInternoInicalizado()),
        ),
      ],
      child: Stack(
        children: [
          UIFondo(
            lFullScreen: true,
          ),
//          Center(
//            child: UILogo(alto: 250, ancho: 250),
//          ),
//        UIInicioPublicidad(),
          Container(
            width: CD.ancho,
            margin: EdgeInsets.only(top: CD.alto * .6),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
//              UIBotonPyD('Iniciar', iniciar),
                UIMensajeInicioDeUsuarioInterno(),
//                UIBotonPyD(
//                  'Usuarios',
//                      () {
//                    Navigator.pushNamed(context, UIUsuariosFire.ruta);
//                  },
//                ),
                UIBotonPyD(
                  'Publicidad',
                      () {
                    Navigator.pushNamed(context, UIPublicidades.ruta);
                  },
                ),
//                UIBotonPyD(
//                  'Promociones',
//                      () {
//                    Navigator.pushNamed(context, UIPromociones.ruta);
//                  },
//                ),
//              UIBotonPyD(
//                'Clientes',
//                () {
//                  Navigator.pushNamed(context, UIClientes.ruta);
//                },
//              ),
//              UIBotonPyD(
//                'Mis Datos',
//                    () {
//                  Navigator.pushNamed(context, UIMisDatos.ruta);
//                },
//              ),
//              UIBotonPyD('Editor Imagen', () {
//                Navigator.pushNamed(context, UIEditorImagenes.ruta);
//              }),
              ],
            ),
          ),
          UIModo(),
        ],
      ),
    );
  }
}
