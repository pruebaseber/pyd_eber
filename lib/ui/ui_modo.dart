import 'package:pyd_eber/all-exports.dart';

class UIModo extends StatefulWidget {
  @override
  _UIModoState createState() => _UIModoState();
}

class _UIModoState extends State<UIModo> {
  @override
  Widget build(BuildContext context) {
    double tamayoFuente = 10;
    return Container(
      width: Responsive.ancho,
      height: Responsive.alto,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                'Modo ${Responsive.modoResponsive}',
                style: estiloListados,
              ),
            ),
          ),
          Container(
            height: 40,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                '${Responsive.ancho}x${Responsive.alto}',
                style: estiloListados,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
