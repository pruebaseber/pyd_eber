// Delfin API
// Productos

import 'package:pyd_eber/all-exports.dart';

class UIBlocProductoBusqueda extends StatefulWidget {
  UIBlocProductoBusqueda({this.bottom = 40});

  final double bottom;

  @override
  _UIBlocProductoBusquedaState createState() => _UIBlocProductoBusquedaState();
}

class _UIBlocProductoBusquedaState extends State<UIBlocProductoBusqueda> {
//  BlocProductoBusqueda productoBloc;

  @override
  void dispose() {
//    productoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//
//    if (productoBloc == null)
//      productoBloc = BlocProvider.of<BlocProductoBusqueda>(context);
//
    return BlocBuilder<BlocProductoBusqueda, ProductoBusquedaEstado>(
      builder: (context, state) {
        print('state $state');
        if (state is EstadoInicialProductoBusqueda) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProcesosIniciadosProductoBusqueda) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoErrorEnProcesosProductoBusqueda) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProgresandoProductoBusqueda) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoResultadoProcesosTerminadosProductoBusqueda) {
          if (state.resultadoProceso.error) {
            return UIInicioMensajes(
              state.resultadoProceso.mensaje, bottom: widget.bottom,);
          }
          return UIInicioMensajes(
            state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        return Container(
          child: Center(
            child: Text('Algún estado No capturado de ProductoBusquedas'),
          ),
        );
    });
  }
}

