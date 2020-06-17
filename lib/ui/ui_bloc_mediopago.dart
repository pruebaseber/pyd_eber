// Delfin API
// Medios de Pago

import 'package:pyd_eber/all-exports.dart';

class UIBlocMedioPago extends StatefulWidget {
  UIBlocMedioPago({this.bottom = 40});

  final double bottom;

  @override
  _UIBlocMedioPagoState createState() => _UIBlocMedioPagoState();
}

class _UIBlocMedioPagoState extends State<UIBlocMedioPago> {
//  BlocMedioPago medioPagoBloc;

  @override
  void dispose() {
//    medioPagoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

//    if (medioPagoBloc == null)
//      medioPagoBloc = BlocProvider.of<BlocMedioPago>(context);

    return BlocBuilder<BlocMedioPago, MedioPagoEstado>(
      builder: (context, state) {
        print('state $state');
        if (state is EstadoInicialMedioPago) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProcesosIniciadosMedioPago) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoErrorEnProcesosMedioPago) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProgresandoMedioPago) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoResultadoProcesosTerminadosMedioPago) {
          if (state.resultadoProceso.error) {
            return UIInicioMensajes(
              state.resultadoProceso.mensaje, bottom: widget.bottom,);
          }
          return UIInicioMensajes(
            state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        return Container(
          child: Center(
            child: Text('Algún estado No capturado de Medios de Pago'),
          ),
        );
    });
  }
}

