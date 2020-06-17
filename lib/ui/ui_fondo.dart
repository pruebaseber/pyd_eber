import 'package:pyd_eber/all-exports.dart';

class UIFondo extends StatelessWidget {
  UIFondo({this.lFullScreen = false});

  final bool lFullScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lFullScreen ? Responsive.ancho : Responsive.ancho,
      height: lFullScreen ? Responsive.alto : Responsive.altoContenido,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(FONDO),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
