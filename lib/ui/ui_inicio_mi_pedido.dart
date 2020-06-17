import 'package:pyd_eber/all-exports.dart';

class UIInicioMiPedido extends StatefulWidget {
  @override
  _UIInicioMiPedidoState createState() => _UIInicioMiPedidoState();
}

class _UIInicioMiPedidoState extends State<UIInicioMiPedido> {
//  BlocPedidoBloc blocPedido;
  bool lCategoria = false;
  bool lSubCategoria = false;
  bool lProducto = false;
  bool lError = false;

//  String mensajeError = '';

  @override
  Widget build(BuildContext context) {
//    if (blocPedido == null)
//      blocPedido = BlocProvider.of<BlocPedidoBloc>(context);

    return BlocBuilder<BlocPedido, BlocPedidoEstado>(
      builder: (context, state) {
//        print('BlocPedidoBloc ESTADO: $state');
        if (state is EstadoPedidoProcesoDatosCategiasError) lError = true;

        if (state is EstadoPedidoProcesoDatosSubCategiasError) lError = true;

        if (state is EstadoPedidoProcesoDatosProductosError) lError = true;

        if (state is EstadoPedidoProcesoDatosCategiasTerminado)
          lCategoria = true;

        if (state is EstadoPedidoProcesoDatosSubCategiasTerminado)
          lSubCategoria = true;

        if (state is EstadoPedidoProcesoDatosProductosTerminado)
          lProducto = true;

        if (DEM.listaCategoria.length > 0) lCategoria = true;
        if (DEM.listaSubCategoria.length > 0) lSubCategoria = true;
//        if (DEM.listaProducto.length > 0) lProducto = true;

//        print('EVALUANDO En UIBotonMiPedido $lCategoria, $lSubCategoria, $lProducto, $lError');

        if (lCategoria & lSubCategoria & lProducto) {
          return UIBoton(
            'Hacer un Pedido',
            (lCategoria & lSubCategoria & lProducto)
                ? () {
                    Navigator.pushNamed(context, UICategorias.ruta);
                  }
                : null,
            margenes: EdgeInsets.all(0),
            ancho: CD.ancho * .8,
            alto: 35,
          );
        }

        return lError
            ? Column(
                children: [
                  Container(
                    child: Text(
                      'Se han producido algunos error.\n'
                          +'No se pudo establecer conexión\n'
                          +'con nuestros servidores.\n'
                          +'Verifique su conexión a INTERNET.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, UIInicio.ruta);
                    },
                    color: AppRes.appResMap[Co.COLOR_6],
                    textColor: Colors.white,
                    child: Text('Reintentar'),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    width: CD.ancho * .8,
                    height: 35,
                    child: LinearProgressIndicator(
                      backgroundColor: (AppRes.appResMap[Co.COLOR_6] as Color)
                          .withAlpha(128),
                      minHeight: 40,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppRes.appResMap[Co.COLOR_6]),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
