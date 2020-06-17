//import 'package:pyd_eber_clientes/pyd/listadoVista.dart';
//import 'package:pyd_eber_clientes/pyd/onda_decorativa.dart';
//
//import '../../delfinapi.dart';
import 'package:pyd_eber/all-exports.dart';

class UIPedido extends StatefulWidget {
  UIPedido({Key key}) : super(key: key);
  static const String ruta = '/pedido';

  @override
  _UIPedidoState createState() => _UIPedidoState();
}

class _UIPedidoState extends State<UIPedido> {
  @override
  Widget build(BuildContext context) {
    Responsive.calcularResponsive(context);
    return BlocProvider(
      create: (context) => BlocPedido(),
      child: Scaffold(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
        appBar: UIAppBar(
          context,
          text: 'Mi Pedido',
        ),
        //endDrawer: MenuPedidosCompra(),
        body: Stack(
          children: [
            UIFondo(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
//          OndaDecorativa(),
                Expanded(
                  child: UIPedidoDetalle(),
                ),
                UIPedidoTotal(),
//            UIBarraEstadoTotalPedido(),
                UIPedidoOpciones(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
