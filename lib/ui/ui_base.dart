import 'package:pyd_eber/all-exports.dart';

//import 'package:pyd_eber_clientes/pyd/onda_decorativa.dart';
//import 'package:pyd_eber_clientes/pyd/pydtienda.dart';

// ignore: must_be_immutable
class PyDBase extends StatefulWidget {
  PyDBase({
    @required this.contentChild,
    @required this.actionBtnsChild,
  });

  Widget contentChild;
  Widget actionBtnsChild;

  @override
  _PyDBaseState createState() => _PyDBaseState();
}

class _PyDBaseState extends State<PyDBase> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Responsive.ancho,
          height: Responsive.altoContenido,
          child: UIFondo(),
        ),
        Column(
          children: <Widget>[
            Container(
                width: Responsive.anchoContenido,
                height: Responsive.altoContenido,
//                color: Colors.red,
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.margenHorizontalContenido),
                child: Stack(
                  children: [
                    widget.contentChild,
                  ],
                )),
            Container(
              width: Responsive.ancho,
              height: Responsive.altoBarraEstado,
              color: AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA],
              child: widget.actionBtnsChild,
            ),
          ],
        ),
      ],
    );
  }
}
