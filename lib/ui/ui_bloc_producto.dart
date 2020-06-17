// Delfin API
// Productos

import 'package:pyd_eber/all-exports.dart';

class UIBlocProducto extends StatefulWidget {
  UIBlocProducto({this.bottom = 40});

  final double bottom;

  @override
  _UIBlocProductoState createState() => _UIBlocProductoState();
}

class _UIBlocProductoState extends State<UIBlocProducto> {
//  BlocProducto productoBloc;

  @override
  void dispose() {
//    productoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//
//    if (productoBloc == null)
//      productoBloc = BlocProvider.of<BlocProducto>(context);
//
    return BlocBuilder<BlocProducto, ProductoEstado>(
      builder: (context, state) {
        print('state $state');
        if (state is EstadoInicialProducto) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProcesosIniciadosProducto) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoErrorEnProcesosProducto) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProgresandoProducto) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoResultadoProcesosTerminadosProducto) {
          if (state.resultadoProceso.error) {
            return UIInicioMensajes(
              state.resultadoProceso.mensaje, bottom: widget.bottom,);
          }
          return UIInicioMensajes(
            state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        return Container(
          child: Center(
            child: Text('Algún estado No capturado de Productos'),
          ),
        );
    });
  }
}

