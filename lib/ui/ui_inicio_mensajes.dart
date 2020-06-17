import '../all-exports.dart';

class UIInicioMensajes extends StatelessWidget {
  UIInicioMensajes(this.mensaje, {this.bottom = 20, this.ignorar = true});

  final String mensaje;
  final double bottom;
  final bool ignorar;

  @override
  Widget build(BuildContext context) {
    print('UIMensajeInicio($mensaje $bottom)');
    DEM.listaMensajes += '\n' + mensaje;
//    print(DEM.listaMensajes);
    if (ignorar) {
      return Container();
    }
    return Positioned(
      bottom: bottom,
      child: Container(
        width: CD.ancho,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
//          mensaje,
            DEM.listaMensajes,
            style: estiloMensajes.copyWith(
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
