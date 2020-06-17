//import 'package:flutter/material.dart';
//
//import '../all-exports.dart';
//import 'package:pyd_eber/data_web_mobile/firebase.dart'
//if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;
//
//class BotonBorrarDatosDelfinRealtime extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    CD.iniciar(context);
//    return GestureDetector(
//      onLongPress: () {
//        if (kIsWeb) {
//          fb_web.DatabaseReference drCategoriaWeb =
//          fb_web.database().ref('/Delfin');
////          drCategoriaWeb.remove();
//        } else {
//          DatabaseReference drCategoria = FirebaseDatabase.instance
//              .reference()
//              .child(DELFIN);
//          drCategoria.remove();
//        }
//      },
//      child: Container(
//        color: Colors.red,
//        height: 50,
//        width: CD.ancho * .8,
//        padding: EdgeInsets.all(3),
//        child: Center(
//          child: Text(
//            'Boton Borrar Datos Delfin Realtime',
//            style: TextStyle(
//              fontSize: 20,
//              color: Colors.white,
//
//            ),
//            textAlign: TextAlign.center,
//          ),
//        ),
//      ),
//    );
//  }
//}
