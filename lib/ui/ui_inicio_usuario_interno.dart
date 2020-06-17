import 'package:pyd_eber/all-exports.dart';

class UIMensajeInicioDeUsuarioInterno extends StatefulWidget {
  @override
  _UIMensajeInicioDeUsuarioInternoState createState() =>
      _UIMensajeInicioDeUsuarioInternoState();
}

class _UIMensajeInicioDeUsuarioInternoState
    extends State<UIMensajeInicioDeUsuarioInterno> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioInternoBloc, UsuarioInternoState>(
      builder: (context, state) {
        if (state is NoHayUsuarioInternoState) {
          return mensajeInicio(state.mensaje);
        }
        if (state is SesionUsuarioInternoState) {
          DEM.ejecutarConUsuarioInterno();
          return mensajeInicio(state.mensaje);
        }
        // ErrorUsuarioInternoState
        return mensajeInicio(state.mensaje);
      },
    );
  }

  Widget mensajeInicio(String mensaje, {double bottom = 20}) {
    return Positioned(
      bottom: bottom,
      child: Container(
        width: CD.ancho,
        child: Text(
          mensaje,
          style: estiloMensajes.copyWith(
            color: Colors.transparent,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
