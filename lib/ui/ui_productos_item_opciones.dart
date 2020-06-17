import 'package:pyd_eber/all-exports.dart';

class UIOpcionesItemProducto extends StatefulWidget {
  UIOpcionesItemProducto(this.anchoPadre, this.altoPadre,
      {this.factor = 0.15,
      @required this.registro, // this.refrescar,
      this.color = Colors.green}); // 0.2 = 20% del menor entre ancho y alto

  final double anchoPadre;
  final double altoPadre;
  final double factor;
  final Color color;
  final RegProducto registro;

//  final VoidCallback refrescar;

  @override
  _UIOpcionesItemProductoState createState() => _UIOpcionesItemProductoState();
}

class _UIOpcionesItemProductoState extends State<UIOpcionesItemProducto> {
  BlocPedido blocPedido;

  @override
  Widget build(BuildContext context) {
    if (blocPedido == null) blocPedido = BlocProvider.of<BlocPedido>(context);

    return BlocBuilder<BlocPedido, BlocPedidoEstado>(
      builder: (context, state) {
//        print(state);
        double minimo = widget.anchoPadre;
        if (widget.altoPadre < minimo) minimo = widget.altoPadre;
        double cantidadPedida =
        DEM.pedidoActivo.cantidadEnPedido(widget.registro.codigoProducto);
        return Container(
          width: widget.anchoPadre,
          height: widget.altoPadre,
          color: Colors.transparent,
          padding: EdgeInsets.all(3),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cantidadPedida == 0
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            blocPedido.pedidoProcesosBloc
                                .eliminarProducto(widget.registro);
//                  DEM.pedidoActivo.eliminarProducto(widget.registro);
//                  if (widget.refrescar != null) widget.refrescar();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                (minimo * widget.factor + 4) * .5),
                            child: Container(
                              width: minimo * widget.factor + 4,
                              height: minimo * widget.factor + 4,
                              padding: EdgeInsets.all(2),
                              color: Colors.red,
                              child: Container(
                                width: minimo * widget.factor,
                                height: minimo * widget.factor,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
//                      color: widget.color,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: LayoutBuilder(
                                    builder: (context, constraint) {
                                  return new Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: constraint.biggest.height * .7,
                                  );
                                }),
//                child: Icon(Icons.add, size: minimo * widget.factor,),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  cantidadPedida == 0
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            blocPedido.pedidoProcesosBloc
                                .restar1Producto(widget.registro);
//                  DEM.pedidoActivo.restar1Producto(widget.registro);
//                  if (widget.refrescar != null) widget.refrescar();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                (minimo * widget.factor + 4) * .5),
                            child: Container(
                              width: minimo * widget.factor + 4,
                              height: minimo * widget.factor + 4,
                              padding: EdgeInsets.all(2),
                              color: Colors.red,
                              child: Container(
                                width: minimo * widget.factor,
                                height: minimo * widget.factor,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
//                      color: widget.color,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: LayoutBuilder(
                                    builder: (context, constraint) {
                                  return new Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: constraint.biggest.height,
                                  );
                                }),
//                child: Icon(Icons.add, size: minimo * widget.factor,),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  cantidadPedida == 0
                      ? Container()
                      : GestureDetector(
                          onTap: () {
//                  DEM.restar_1_producto(widget.registro);
//                  if (widget.refrescar != null) widget.refrescar();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(
                                (minimo * widget.factor * 1.25 + 4) * .1)),
                            child: Container(
//                    width: minimo * widget.factor * 1.25 + 4,
                              height: minimo * widget.factor * 1.25 + 4,
                              padding: EdgeInsets.all(2),
                              color: Colors.blue,
                              child: Container(
//                      width: minimo * widget.factor * 1.25,
                                height: minimo * widget.factor * 1.25,
                                padding: EdgeInsets.all(
                                    minimo * widget.factor * 0.05),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
//                      color: widget.color,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: LayoutBuilder(
                                    builder: (context, constraint) {
                                  return Center(
                                    child: Text(
                                      ' ${Cantidad(cantidadPedida)} ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: constraint.biggest.height),
//                        textAlign: TextAlign.center,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                  GestureDetector(
                    onTap: () {
                      blocPedido.pedidoProcesosBloc
                          .sumar1Producto(widget.registro);
//                  DEM.pedidoActivo.sumar1Producto(widget.registro);
//                  if (widget.refrescar != null) widget.refrescar();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          (minimo * widget.factor + 4) * .5),
                      child: Container(
                        width: minimo * widget.factor + 4,
                        height: minimo * widget.factor + 4,
                        padding: EdgeInsets.all(2),
                        color: Colors.green,
                        child: Container(
                          width: minimo * widget.factor,
                          height: minimo * widget.factor,

                          decoration: BoxDecoration(
//                    color: Colors.grey,
//                    backgroundBlendMode: BlendMode.darken,
                            shape: BoxShape.circle,
//                      color: widget.color,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: LayoutBuilder(builder: (context, constraint) {
                            return new Icon(Icons.add,
                                color: Colors.white,
                                size: constraint.biggest.height);
                          }),
//                child: Icon(Icons.add, size: minimo * widget.factor,),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
