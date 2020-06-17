import 'package:pyd_eber/all-exports.dart';

class UIBarraEstado extends StatefulWidget {
  @override
  _UIBarraEstadoState createState() => _UIBarraEstadoState();
}

class _UIBarraEstadoState extends State<UIBarraEstado> {
  @override
  Widget build(BuildContext context) {
//    Responsive.calcularResponsive(context);
//    print('alto ${CD.alto}');
//    print('altoAppBar ${Responsive.altoAppBar}');
//    print('altoContenido ${Responsive.altoContenido}');
//    print('altoBarraEstado ${Responsive.altoBarraEstado}');
    return BlocBuilder<BlocPedido, BlocPedidoEstado>(
      builder: (context, state) {
//        print('UIBarraEstado $state');
//        print('UIBarraEstado ${DEM.pedidoActivo.pedido.totalPedido}');
        return Container(
          color: AppRes.appResMap[Co.COLOR_6],
          height: Responsive.altoBarraEstado,
          padding: EdgeInsets.symmetric(
            vertical: Responsive.paddingVerticalContenido,
            horizontal: 30,
          ),
          child: DEM.pedidoActivo.pedido.totalPedido == 0
              ? Container(
                  child: Text(
                    'Agregue productos a su carrito',
                    style: estiloTituloPantalla.copyWith(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 10,
                      ),
                    ),
                    UIBarraEstadoTotalPedido(),
                  ],
                ),
        );
      },
    );
  }
}
