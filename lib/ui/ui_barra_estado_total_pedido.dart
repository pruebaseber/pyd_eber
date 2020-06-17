import 'package:pyd_eber/all-exports.dart';

class UIBarraEstadoTotalPedido extends StatefulWidget {
  @override
  _UIBarraEstadoTotalPedidoState createState() =>
      _UIBarraEstadoTotalPedidoState();
}

class _UIBarraEstadoTotalPedidoState extends State<UIBarraEstadoTotalPedido> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPedido, BlocPedidoEstado>(
      builder: (context, state) {
        return DEM.pedidoActivo.pedido.totalPedido > 0
            ? GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, UIPedido.ruta).then((value) {
                    setState(() {
                      context
                          .bloc<BlocPedido>()
                          .add(EventoPedidoProductoEliminado());
                    });
                  });
                },
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        '\$ ' +
                            MontoMoneda(
                              DEM.pedidoActivo.pedido.totalPedido,
                            ),
                        style: estiloTituloPantalla.copyWith(
                          fontSize: TAMAYO_FUENTE_TOTAL_PEDIDO,
                        ),
                      ),
                    ),
                    Container(
                      height: Responsive.altoBarraEstado,
                      width: Responsive.altoBarraEstado,
//                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(5),
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(10),
//                        border: Border.all(
//                          width: 3,
//                          color: (AppRes.appResMap[Co.FONDO_6] as Color)
//                              .withAlpha(128),
//                        ),
//                        color: AppRes.appResMap[Co.FONDO_6],
//                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
