/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: segun-modelo.dart
    String campoSegunModelo(Object e, String campo)
     => Dado un objeto, y un campo, retorna el valor del campo en tipo String
    Map<String, dinamic> mapaSegunModelo(Object e)
     => Dado un objeto, retorna el toMap() de la instancia

*/


import 'package:pyd_eber/all-exports.dart';


String campoSegunModelo(Object e, String campo) {
  String tipo = e.runtimeType.toString();
  switch (tipo) {

//  Base de Datos: Delfin API    =>  142
//  -------------

    case 'RegDelfinControl':
      return (e as RegDelfinControl).toMap()[campo].toString();
      break;
    case 'RegDelfinControlCheck':
      return (e as RegDelfinControlCheck).toMap()[campo].toString();
      break;
    case 'RegDelfinControlHistory':
      return (e as RegDelfinControlHistory).toMap()[campo].toString();
      break;
    case 'RegClave':
      return (e as RegClave).toMap()[campo].toString();
      break;
    case 'RegUsuario':
      return (e as RegUsuario).toMap()[campo].toString();
      break;
    case 'RegCategoria':
      return (e as RegCategoria).toMap()[campo].toString();
      break;
    case 'RegMedioPago':
      return (e as RegMedioPago).toMap()[campo].toString();
      break;
    case 'RegUnidadMedida':
      return (e as RegUnidadMedida).toMap()[campo].toString();
      break;
    case 'RegSubCategoria':
      return (e as RegSubCategoria).toMap()[campo].toString();
      break;
    case 'RegProducto':
      return (e as RegProducto).toMap()[campo].toString();
      break;

    default:
      return '*** desconocido ***';
      break;
  }
}

Map<String, dynamic> mapaSegunModelo(Object e) {
  String tipo = e.runtimeType.toString();
  switch (tipo) {

//  Base de Datos: Delfin API    =>  142
//  -------------

    case 'RegDelfinControl':
      return (e as RegDelfinControl).toMap();
      break;
    case 'RegDelfinControlCheck':
      return (e as RegDelfinControlCheck).toMap();
      break;
    case 'RegDelfinControlHistory':
      return (e as RegDelfinControlHistory).toMap();
      break;
    case 'RegClave':
      return (e as RegClave).toMap();
      break;
    case 'RegUsuario':
      return (e as RegUsuario).toMap();
      break;
    case 'RegCategoria':
      return (e as RegCategoria).toMap();
      break;
    case 'RegMedioPago':
      return (e as RegMedioPago).toMap();
      break;
    case 'RegUnidadMedida':
      return (e as RegUnidadMedida).toMap();
      break;
    case 'RegSubCategoria':
      return (e as RegSubCategoria).toMap();
      break;
    case 'RegProducto':
      return (e as RegProducto).toMap();
      break;

    default:
      return {};
      break;
  }
}

//List<DataColumCellFieldBase> columnasSegunModelo(Object e) {
//  String tipo = e.runtimeType.toString();
//  switch (tipo) {
//
////  Base de Datos: Delfin API    =>  142
////  -------------
//
//    case 'RegDelfinControl':
////      return  (e as RegDelfinControl).columnsFrom(e as RegDelfinControl);
//      break;
//    case 'RegDelfinControlCheck':
////      return  (e as RegDelfinControlCheck).columnsFrom(e as RegDelfinControlCheck);
//      break;
//    case 'RegDelfinControlHistory':
////      return  (e as RegDelfinControlHistory).columnsFrom(e as RegDelfinControlHistory);
//      break;
//    case 'RegClave':
////      return  (e as RegClave).columnsFrom(e as RegClave);
//      break;
//    case 'RegUsuario':
////      return  (e as RegUsuario).columnsFrom(e as RegUsuario);
//      break;
//    case 'RegCategoria':
////      return  (e as RegCategoria).columnsFrom(e as RegCategoria);
//      break;
//    case 'RegMedioPago':
////      return  (e as RegMedioPago).columnsFrom(e as RegMedioPago);
//      break;
//    case 'RegUnidadMedida':
////      return  (e as RegUnidadMedida).columnsFrom(e as RegUnidadMedida);
//      break;
//    case 'RegSubCategoria':
////      return  (e as RegSubCategoria).columnsFrom(e as RegSubCategoria);
//      break;
//    case 'RegProducto':
////      return  (e as RegProducto).columnsFrom(e as RegProducto);
//      break;
//
//    default:
//      return [];
//      break;
//  }
//}


