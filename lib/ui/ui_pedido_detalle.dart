import 'package:pyd_eber/all-exports.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

class UIPedidoDetalle extends StatefulWidget {
  @override
  _UIPedidoDetalleState createState() => _UIPedidoDetalleState();
}

class _UIPedidoDetalleState extends State<UIPedidoDetalle> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPedido, BlocPedidoEstado>(
      builder: (context, state) {
        return Container(
          width: Responsive.ancho,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: DEM.pedidoActivo.detalles.length,
                  itemBuilder: (context, index) {
                    DetPedido detPedido = DEM.pedidoActivo.detalles[index];
                    return Slidable(
//                      key: ValueKey(index),
                      key: Key(detPedido.producto),
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Agregar',
                          color: Colors.green,
//                          icon: Icons.add_circle_outline,
                          iconWidget: Icon(Icons.add_circle_outline, size: 45, color: Colors.white,),
                          closeOnTap: false,
                          onTap: () {
                            context
                                .bloc<BlocPedido>()
                                .pedidoProcesosBloc
                                .sumar1Producto(RegProducto(
                                    codigoProducto: detPedido.producto));
//                            print('Debería agregar');
                            Toast.show(
                                'Agregado +1 ${detPedido.nombreProducto}',
                                context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          },
                        ),
                        IconSlideAction(
                          caption: 'Quitar',
                          color: Colors.red.shade300,
//                          icon: Icons.remove_circle_outline,
                          iconWidget: Icon(Icons.remove_circle_outline, size: 45, color: Colors.white,),
                          closeOnTap: false,
                          onTap: () {
                            print('Debería actualizar');
                            context
                                .bloc<BlocPedido>()
                                .pedidoProcesosBloc
                                .restar1Producto(RegProducto(
                                    codigoProducto: detPedido.producto));
                            Toast.show('Quitado -1 ${detPedido.nombreProducto}', context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          },
                        ),
                        IconSlideAction(
                          caption: 'Eliminar',

                          color: Colors.red,
//                          icon: Icons.delete_forever,
                          iconWidget: Icon(Icons.delete_forever, size: 45, color: Colors.white,),
                          closeOnTap: false,
                          onTap: () {
                            print('Debería borrar');
                            context
                                .bloc<BlocPedido>()
                                .pedidoProcesosBloc
                                .eliminarProducto(RegProducto(
                                    codigoProducto: detPedido.producto));
                            Toast.show('Eliminado ${detPedido.nombreProducto}', context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                          },
                        )
                      ],
//                      actions: <Widget>[
//                      ],
                      dismissal: SlidableDismissal(
                        onDismissed: (direction) {
                          print(direction);
                          final codigoProducto = detPedido.producto;
                          print(codigoProducto);
                          context
                              .bloc<BlocPedido>()
                              .pedidoProcesosBloc
                              .eliminarProducto(
                                  RegProducto(codigoProducto: codigoProducto));
                          print(DEM.pedidoActivo.pedido.totalPedido);
//                        DEM.pedidoActivo.detalles.removeAt(index);
                          // TODO: Eliminar Producto desde la lista
                          // TODO: Agregar 1 y Restar 1 desde la lista
//                        if (direction == DismissDirection.endToStart) {
//                          print('endToStart');
//                        }
//                        if (direction == DismissDirection.startToEnd) {
//                          context
//                              .bloc<BlocPedido>()
//                              .pedidoProcesosBloc
//                              .eliminarProducto(RegProducto(
//                                  codigoProducto: codigoProducto));
//                          print(DEM.pedidoActivo.pedido.totalPedido);
//                        }
                        },
                        child: SlidableDrawerDismissal(),
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UIPedidoDetalleImagen(detPedido),
                          Expanded(
                            child: UIPedidoDetalleProducto(detPedido),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              MontoMoneda(detPedido.monto),
                              style: estiloProducto.copyWith(fontSize: 20),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
