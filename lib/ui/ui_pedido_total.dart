import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/responsive.dart';
import 'package:toast/toast.dart';

class UIPedidoTotal extends StatefulWidget {
  @override
  _UIPedidoTotalState createState() => _UIPedidoTotalState();
}

class _UIPedidoTotalState extends State<UIPedidoTotal> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPedido, BlocPedidoEstado>(
      builder: (context, state) {
//        print('UIBarraEstadoTotalPedido: $state');
        return Container(
          color: AppRes.appResMap[Co.COLOR_6],
          height: Responsive.altoBarraEstado,
          padding: EdgeInsets.symmetric(
            vertical: Responsive.paddingVerticalContenido,
            horizontal: 30,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onHorizontalDragEnd: (dragEndDetails) async {
//                  print(dragEndDetails);

                  if (dragEndDetails.primaryVelocity == 0) {
                    // TODO: Preguntar si desea borrar todo el pedido
                  } else {
                    await context.bloc<BlocPedido>().pedidoProcesosBloc.borrarPedido();
                    Toast.show(
                        'Su pedido ha sido eliminado completamente',
                        context,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.BOTTOM);
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  height: Responsive.altoBarraEstado,
                  width: Responsive.altoBarraEstado,
                  child: Icon(
                    Icons.delete_sweep,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Total: ' +
                      MontoMoneda(
                        DEM.pedidoActivo.pedido.totalPedido,
                      ),
                  style: estiloTituloPantalla.copyWith(
                    fontSize: TAMAYO_FUENTE_TOTAL_PEDIDO,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
