import 'dart:io';

import 'package:pyd_eber/all-exports.dart';

class UIAppBar extends AppBar {
  UIAppBar(
    this.context, {
    Key key,
    this.text,
  }) : super(
          key: key,
          title: Text(
            text,
            style: estiloTituloPantalla,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch<String>(
                  context: context,
                  delegate: BusquedaDelegate(),
                ).then((value) {
//                  context
//                      .bloc<BlocPedido>()
//                      .add(EventoPedidoProductoEliminado());
                });
              },
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA],
          elevation: kIsWeb
              ? 0 // Web
              : Platform.isIOS
                  ? 0 // iOS
                  : 4,
        ) {
    //
    Responsive.altoAppBar = this.preferredSize.height;
    Responsive.calcularResponsive(context);
    //
  }

  final String text;
  final BuildContext context;
}
