import 'package:flutter/cupertino.dart';
import 'package:pyd_eber/all-exports.dart';

class UIBotonIniciarSesionn extends StatefulWidget {
  @override
  _UIBotonIniciarSesionnState createState() => _UIBotonIniciarSesionnState();
}

class _UIBotonIniciarSesionnState extends State<UIBotonIniciarSesionn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: UIBoton(
        'Mi Usuario',
        () {
          Navigator.pushNamed(context, UIInicioIniciarSesion.ruta);
        },
        margenes: EdgeInsets.all(0),
        ancho: CD.ancho * .8,
        alto: 35,
      ),
    );
  }
}
