import 'dart:io';

import 'package:pyd_eber/all-exports.dart';

class UIAppBar extends AppBar {
  UIAppBar(
      this.context, {
        Key key,
        this.text,
        this.acciones,
        this.recalcular = true,
      }) : super(
    key: key,
    title: Text(
      text,
      style: estiloTituloPantalla.copyWith(
        backgroundColor: kIsWeb
            ? Colors.transparent
            : AppRes.appResMap[Co.COLOR_FONDO_APP_BAR],
        color: kIsWeb
            ? AppRes.appResMap[Co.COLOR_FONDO_APP_BAR]
            : AppRes.appResMap[Co.COLOR_APP_BAR],
      ),
    ),
    actions: [],
    backgroundColor: kIsWeb
        ? Colors.transparent
        : AppRes.appResMap[Co.COLOR_FONDO_APP_BAR],
    elevation: kIsWeb
        ? 0 // Web
        : Platform.isIOS
        ? 0 // iOS
        : 4,
  ) {
    //
    if (recalcular) {
//      print('calculando Responsive dentro de UIAppBar');
      Responsive.altoAppBar = this.preferredSize.height;
      Responsive.calcularResponsive(context);
    }
    List<Widget> _acciones = [
      // UIBotonBuscarProductos(),
      //  UIBotonMenuUsuario(),
    ];
    if (acciones == null) {
      this.actions.addAll(_acciones);
    } else {
      this.actions.addAll(acciones);
    }
  }

  final String text;
  final BuildContext context;
  final List<Widget> acciones;
  final bool recalcular;
}

