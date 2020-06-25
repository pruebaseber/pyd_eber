import 'package:pyd_eber/all-exports.dart';

class UIBotonPyD extends StatelessWidget {
  UIBotonPyD(this.texto, this.funcion, {this.ancho});

  final String texto;
  final VoidCallback funcion;
  final double ancho;

  @override
  Widget build(BuildContext context) {
    return UIBoton(
      texto,
      funcion,
      decoration: AppRes.appResMap[Co.DECORACION_BOTON_PRINCIPAL],
      margenes: EdgeInsets.symmetric(vertical: 10),
      ancho: ancho == null ? CD.ancho * .8 : ancho,
      alto: 45,
    );
  }
}
