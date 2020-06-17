import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyd_eber/all-exports.dart';


class UILogo extends StatelessWidget {
  UILogo({this.ancho = 100, this.alto = 100});

  final double ancho;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: ancho,
        height: alto,
        child: Image.asset(LOGO),
      ),
    );
  }
}
