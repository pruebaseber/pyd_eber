import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/internos/boton-borrar-datos-delfin-realtime.dart';

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
  Widget build(BuildContext context) {
    //
    Responsive.calcularResponsive(context);
    //
    if (!lIniciado) {
      Timer(Duration(milliseconds: 200), () {
       // iniciar();
      });
    }

    return Stack(
      children: [
        Container(
          width: CD.ancho,
          height: CD.alto,
          child: Image.asset(
            FONDO,
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          width: CD.ancho,
          height: CD.alto,
          child: Center(
            child: Container(
              width: 250,
              height: 250,
              child: Image.asset(
                LOGO,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Container(
          width: 200,
          margin:
              EdgeInsets.only(left: (CD.ancho - 200) / 2, top: CD.alto * .75),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //UIBotonPyD(),
              UIBoton(
                'Pantallas',
                  () {
                    Navigator.pushNamed(context, UIMisDatos.ruta);
                  },
              ),
//            BotonBorrarDatosDelfinRealtime(),
//              RaisedButton(
//                color: AppRes.appResMap[Co.COLOR_6],
//                textColor: Colors.white,
//                onPressed: iniciar,
//                child: Container(
//                  width: Responsive.anchoContenido * .8,
//                  child: Text('Iniciar',
//                      style: AppRes.appResMap[Co.ESTILO_TEXTO_BOTON_PRINCIPAL],
//                    textAlign: TextAlign.center,
//                  ),
//                ),
//              ),
            ],
          ),
        ),
      ],
    );
  }
}
