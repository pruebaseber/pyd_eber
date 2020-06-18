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
        return FadePage(UITester());
      case UIInicio.ruta:
        return FadePage(UIInicio());
      case UIInicioIniciarSesion.ruta:
        return FadePage(UIInicioIniciarSesion());
      case UICategorias.ruta:
        return FadePage(UICategorias());
      case UISubCategorias.ruta:
        return FadePage(UISubCategorias());
      case UIProductos.ruta:
        return FadePage(UIProductos());
      case UIPedido.ruta:
        return FadePage(UIPedido());
      case UIMisDatos.ruta:
        return FadePage(UIMisDatos(registro: Cliente(
            numeroIdent: '11711897',
            nombreCompleto: 'Juan Trucupey',
            direccionPrincipal: 'Carrera 65 66-18',
            celular: '3005714384',
            telefono: '00000000',
            correoElectronico: 'juancitotrucupey@gmail.com',
            tipoIdent: 'C.C.'
        ),));
//      case UIMisDirecciones.ruta:
//        return FadePage(UIMisDirecciones(registro: Direccion(
//          cliente: 'Kingdom Hall of JW',
//          direccion: 'Carrera 48 53 54',
//          nota: 'Se puede entregar en el segundo piso',
//
//        ),));
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
