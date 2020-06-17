import 'package:pyd_eber/all-exports.dart';

class UIPedidoOpciones extends StatefulWidget {
  @override
  _UIPedidoOpcionesState createState() => _UIPedidoOpcionesState();
}

class _UIPedidoOpcionesState extends State<UIPedidoOpciones> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.altoBarraEstado,
      child: Text('Opciones'),
    );
  }
}
