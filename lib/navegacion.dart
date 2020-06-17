import 'package:flutter/material.dart';
import 'package:pyd_eber/all-exports.dart';

import 'ui/_ui.dart';

class FadePage extends PageRouteBuilder {
  FadePage(Widget page)
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}

class Navegacion {
  Route<dynamic> generarRuta(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
//        return MaterialPageRoute(builder: (_) => UITester());
        return FadePage(UITester());
      case UIInicio.ruta:
//        return MaterialPageRoute(builder: (_) => UIInicio());
        return FadePage(UIInicio());
      case UIInicioIniciarSesion.ruta:
//        return MaterialPageRoute(builder: (_) => UIInicioIniciarSesion());
        return FadePage(UIInicioIniciarSesion());
      case UICategorias.ruta:
//        return MaterialPageRoute(builder: (_) => UICategorias());
        return FadePage(UICategorias());
      case UISubCategorias.ruta:
//        return MaterialPageRoute(builder: (_) => UISubCategorias());
        return FadePage(UISubCategorias());
      case UIProductos.ruta:
//        return MaterialPageRoute(builder: (_) => UIProductos());
        return FadePage(UIProductos());
      case UIPedido.ruta:
//        return MaterialPageRoute(builder: (_) => UIPedido());
        return FadePage(UIPedido());
//      default:
//        return MaterialPageRoute(
//            builder: (_) => Scaffold(
//              appBar: AppBar(title: Text('Regresar'),),
//              body: Center(
//                  child: Text('No route defined for ${routeSettings.name}')),
//            ));

//    class FadeRoute extends PageRouteBuilder {
//  final Widget page;
//  FadeRoute({this.page})
//      : super(
//          pageBuilder: (
//            BuildContext context,
//            Animation<double> animation,
//            Animation<double> secondaryAnimation,
//          ) =>
//              page,
//          transitionsBuilder: (
//            BuildContext context,
//            Animation<double> animation,
//            Animation<double> secondaryAnimation,
//            Widget child,
//          ) =>
//              FadeTransition(
//                opacity: animation,
//                child: child,
//              ),
//        );
//}
    }
  }

  Route<dynamic> rutaDesconocida(RouteSettings routeSettings) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Regresar'),
              ),
              body:
                  Center(child: Text('Ruta desconocida ${routeSettings.name}')),
            ));
  }
}

//    rutas = Map<String, WidgetBuilder>();
//    rutas.addAll(_rutasNavegacion);

// Inicialización general de las rutas de navegación
//
//final Map<String, WidgetBuilder> _rutasNavegacion =
//Map<String, WidgetBuilder>.fromIterable(
//  listaItemsMenuAdmin,
//  key: (item) => item.ruta,
//  value: (item) => item.constructor,
//);

//  Esto debe ir en alguna función de inicialización de la navegación
//
//   if (listaItemsMenuAdmin.length == 0) {
//    OpcionesMenuAdmin.buildMenuItems();
//  }
