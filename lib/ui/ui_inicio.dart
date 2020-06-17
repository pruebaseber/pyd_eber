//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/ui/ui_inicio_monitor_carga_datos.dart';

class UIInicio extends StatefulWidget {
  static const String ruta = '/inicio';
  @override
  _UIInicioState createState() => _UIInicioState();
}

class _UIInicioState extends State<UIInicio> {
  @override
  Widget build(BuildContext context) {
    Responsive.calcularResponsive(context);
    //
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UsuarioInternoBloc>(
            create: (context) =>
                UsuarioInternoBloc()..add(UsuarioInternoInicalizado()),
          ),
//          BlocProvider<DatosLocalesBloc>(
//            create: (context) =>
//                DatosLocalesBloc()..add(DatosLocalesEventInicalizados()),
//          ),
          BlocProvider<BlocCategoria>(
            create: (context) => BlocCategoria()
              ..add(EventoInicializadoCategoria(
                  ResultadoProceso(codigo: 888, mensaje: 'Iniciar Categoria'))),
          ),
          BlocProvider<BlocSubCategoria>(
            create: (context) => BlocSubCategoria()
              ..add(EventoInicializadoSubCategoria(
                  ResultadoProceso(codigo: 888, mensaje: 'Iniciar SubCategoria'))),
          ),
          BlocProvider<BlocProducto>(
            create: (context) => BlocProducto()
              ..add(EventoInicializadoProducto(
                  ResultadoProceso(codigo: 888, mensaje: 'Iniciar Producto'))),
          ),
          BlocProvider<BlocProductoBusqueda>(
            create: (context) => BlocProductoBusqueda()
              ..add(EventoInicializadoProductoBusqueda(
                  ResultadoProceso(codigo: 888, mensaje: 'Iniciar Producto Busqueda'))),
          ),
          BlocProvider<BlocMedioPago>(
            create: (context) => BlocMedioPago()
              ..add(EventoInicializadoMedioPago(
                  ResultadoProceso(codigo: 888, mensaje: 'Iniciar MedioPago'))),
          ),
          BlocProvider<BlocPedido>(
            create: (context) => BlocPedido(),
          ),
        ],
        child: Stack(
          children: [
            UIFondo(lFullScreen: true,),
//          Center(child: Text('UIInicio'),),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UILogo(),
                UIInicioMonitorCargaDatos(),
                UIBotonIniciarSesionn(),
              ],
            ),
            UIMensajeInicioDeUsuarioInterno(),
          ],
        ),
      ),
    );
  }
}

class UITodosLosMensajes extends StatefulWidget {
  @override
  _UITodosLosMensajesState createState() => _UITodosLosMensajesState();
}

class _UITodosLosMensajesState extends State<UITodosLosMensajes> {
  @override
  Widget build(BuildContext context) {
    return UIInicioMensajes('', bottom: 40, ignorar: false,);
  }
}


//class _UIInicioState extends State<UIInicio> {
//  @override
//  Widget build(BuildContext context) {
//    //
////    DEM.calcularResponsive(context);
//    //
//    return Scaffold(
//      body: Stack(
//        children: [
//          Positioned(
//            top: 0,
//            left: 0,
//            child: Container(
//              width: CD.ancho,
//              height: CD.alto,
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage("assets/images/fondo.png"),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//          ),
//          Container(
//            width: CD.ancho,
//            height: CD.alto,
//            //color: Colors.blue,
//            child: Column(
//              // mainAxisSize: MainAxisSize.max,
//              children: [
////                Text(DEM.modoResponsive),
////                Container(
////                  width: CD.ancho * .05,
////                  child:
//                Row(
//                  mainAxisSize: MainAxisSize.min,
//                  children: [
//                    CD.ancho < 800 && CD.orientacion == Orientation.portrait
//                        ? Container()
//                        : Container(
//                      //height: CD.alto,
//                      width: CD.ancho * .20,
////                            color: Colors.yellow,
//                    ),
//                    La2000(),
//                  ],
//                ),
////                ),
//                Container(
//                  width: CD.ancho,
//                  height: CD.alto - 131,
//                  //color: Colors.yellowAccent,
//                  child: Row(
//                    children: [
//                      Lateral(),
//                      CD.ancho < 800 && CD.orientacion == Orientation.portrait
//                          ? Container()
//                          : Flexible(
//                        // contenedor de los botones
//                        flex: 1,
//                        child: Container(
//                          //color: Colors.blue,
//                          child: BotonesInicio(),
//                        ),
//                      ),
//                      Flexible(
//                        // contenedor de lo demás
//                        flex: 3,
//                        child: Container(
//                          //color: Colors.orangeAccent,
//                          child: Column(
//                            mainAxisSize: MainAxisSize.max,
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              Container(
//                                //height: CD.alto,
//                                height: CD.alto * .1,
//                                //color: Colors.yellow,
//                              ),
//                              Flexible(
//                                flex: CD.ancho < 800 &&
//                                    CD.orientacion == Orientation.portrait
//                                    ? 2
//                                    : 3,
//                                child: Container(
//                                  //color: Colors.green,
////                                  child: SliderPublicidad(),
//                                ),
//                              ),
//                              CD.ancho < 800 &&
//                                  CD.orientacion == Orientation.portrait
//                                  ? Flexible(
//                                flex: 2,
//                                child: Container(
//                                  //color: Colors.purpleAccent,
//                                  child: BotonesInicio(),
//                                ),
//                              )
//                                  : Container(),
//                            ],
//                          ),
//                        ),
//                      ),
//                      Lateral(),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class BotonesInicio extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    BoxDecoration decoration = BoxDecoration(
//        border: Border.all(
//          color: AppRes.appResMap[Co.COLOR_2],
//          width: 2,
//        ),
//        borderRadius: BorderRadius.circular(5));
//
//    return Container(
//      //color: Colors.yellow,
//      //width: CD.ancho * .3,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: [
//          CD.ancho > 800
//              ? SizedBox(
//            height: 20,
//          )
//              : Container(),
//          Container(
//            decoration: decoration,
//            margin: CD.ancho < 800 ? EdgeInsets.all(5) : EdgeInsets.all(20),
//            child: UIBoton(
//              'Hacer un Pedido',
//                  () {
////                Navigator.pushNamed(context, FCategorias.ruta);
//              },
//              margenes: EdgeInsets.all(0),
//            ),
//          ),
//          Container(
//            decoration: decoration,
//            margin: CD.ancho < 800 ? EdgeInsets.all(5) : EdgeInsets.all(20),
//            child: UIBoton(
//              'Iniciar Sesión',
//                  () {},
//              margenes: EdgeInsets.all(0),
//            ),
//          ),
//          Container(
//            decoration: decoration,
//            margin: CD.ancho < 800 ? EdgeInsets.all(5) : EdgeInsets.all(20),
//            child: UIBoton(
//              'Crear mi Usuario',
//                  () {},
//              margenes: EdgeInsets.all(0),
//            ),
//          ),
//          Container(
//            decoration: decoration,
//            margin: CD.ancho < 800 ? EdgeInsets.all(5) : EdgeInsets.all(20),
//            child: UIBoton(
//              'Revisar Fotografías',
//                  () {
////                DEM.datos.forEach((key, value) {
////                  print(key);
//////                  print(value);
////                  if (key == CATEGORIA.ENTIDAD) {
////                    Map categorias = value;
////                    categorias.forEach((key, value) {
////                      print(key);
////                      print(value);
////                    });
////                  }
////                });
////                    Navigator.pushNamed(context, FotografiaListaProductos.ruta);
//              },
//              margenes: EdgeInsets.all(0),
//            ),
//          ),
////          CD.ancho > 800
////              ? SizedBox(
////                  height: 20,
////                )
////              : Container(),
//        ],
//      ),
//    );
//  }
//}
//
//class La2000 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.only(top: 30, left: 30),
//      width: CD.ancho < 800
//          ? CD.ancho * .7
//          : CD.ancho * .3,
//      //color: Colors.red,
//      child: Stack(
//        children: [
//          Text(
//            'L',
//            style: TextStyle(
//              fontFamily: AppRes.appResMap[Co.FONT_2R],
//              fontStyle: FontStyle.normal,
//              fontSize: 46.0,
//              color: AppRes.appResMap[Co.COLOR_4],
//              fontWeight: FontWeight.bold,
//              letterSpacing: 2.0,
//              wordSpacing: 4.0,
//            ),
//          ),
//          Positioned(
//            top: 24,
//            left: 35,
//            child: Text(
//              'a 2000, S.A.S.',
//              style: TextStyle(
//                fontFamily: AppRes.appResMap[Co.FONT_2R],
//                fontStyle: FontStyle.normal,
//                fontSize: 20.0,
//                color: AppRes.appResMap[Co.COLOR_4],
//                fontWeight: FontWeight.bold,
//                letterSpacing: 2.0,
//                wordSpacing: 4.0,
//              ),
//            ),
//          ),
//          Positioned(
//            top: 5,
//            left: 20,
//            child: Text(
//              'Comercializadora',
//              style: TextStyle(
//                fontSize: 22.0,
//                color: AppRes.appResMap[Co.COLOR_4],
//                letterSpacing: 1.8,
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class Lateral extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return CD.ancho < 800 && CD.orientacion == Orientation.portrait
//        ? Container()
//        : Container(
//      height: CD.alto,
//      width: CD.ancho * .1,
//      //color: Colors.yellow,
//    );
//  }
//}
