// Delfin API
// Categorías

import 'package:pyd_eber/all-exports.dart';

class UIBlocCategoria extends StatefulWidget {
  UIBlocCategoria({this.bottom = 40});

  final double bottom;

  @override
  _UIBlocCategoriaState createState() => _UIBlocCategoriaState();
}

class _UIBlocCategoriaState extends State<UIBlocCategoria> {
//  BlocCategoria categoriaBloc;

  @override
  void dispose() {
//    categoriaBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//
//    if (categoriaBloc == null)
//      categoriaBloc = BlocProvider.of<BlocCategoria>(context);
//
    return BlocBuilder<BlocCategoria, CategoriaEstado>(
      builder: (context, state) {
        print('state $state');
        if (state is EstadoInicialCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProcesosIniciadosCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoErrorEnProcesosCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProgresandoCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoResultadoProcesosTerminadosCategoria) {
          if (state.resultadoProceso.error) {
            return UIInicioMensajes(
              state.resultadoProceso.mensaje, bottom: widget.bottom,);
          }
          return UIInicioMensajes(
            state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        return Container(
          child: Center(
            child: Text('Algún estado No capturado de Categorías'),
          ),
        );
    });
  }
}

