import 'package:pyd_eber/all-exports.dart';

class UIPedidoDetalleProducto extends StatelessWidget {
  UIPedidoDetalleProducto(this.detPedido);

  final DetPedido detPedido;

  @override
  Widget build(BuildContext context) {
    TextStyle estilo = estiloProducto.copyWith(fontSize: 15);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
//              Text(
//                Cantidad(detPedido.cantidad),
//                style: estilo,
//              ),
              Text(
                MontoMoneda(detPedido.precio) + ' x ' + Cantidad(detPedido.cantidad),
                style: estilo.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            detPedido.nombreProducto,
            style: estilo,
            softWrap: true,
          ),
          Text(
            detPedido.unidad,
            style: estilo,
          ),
        ],
      ),
    );
  }
}
