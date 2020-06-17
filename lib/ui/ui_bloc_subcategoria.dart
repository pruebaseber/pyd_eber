// Delfin API
// Sub Categorías

import 'package:pyd_eber/all-exports.dart';

class UIBlocSubCategoria extends StatefulWidget {
  UIBlocSubCategoria({this.bottom = 40});

  final double bottom;

  @override
  _UIBlocSubCategoriaState createState() => _UIBlocSubCategoriaState();
}

class _UIBlocSubCategoriaState extends State<UIBlocSubCategoria> {
//  BlocSubCategoria subCategoriaBloc;

  @override
  void dispose() {
//    subCategoriaBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//
//    if (subCategoriaBloc == null)
//      subCategoriaBloc = BlocProvider.of<BlocSubCategoria>(context);
//
    return BlocBuilder<BlocSubCategoria, SubCategoriaEstado>(
      builder: (context, state) {
        print('state $state');
        if (state is EstadoInicialSubCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProcesosIniciadosSubCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoErrorEnProcesosSubCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoProgresandoSubCategoria) {
          return UIInicioMensajes(state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        if (state is EstadoResultadoProcesosTerminadosSubCategoria) {
          if (state.resultadoProceso.error) {
            return UIInicioMensajes(
              state.resultadoProceso.mensaje, bottom: widget.bottom,);
          }
          return UIInicioMensajes(
            state.resultadoProceso.mensaje, bottom: widget.bottom,);
        }

        return Container(
          child: Center(
            child: Text('Algún estado No capturado de Sub Categorías'),
          ),
        );
    });
  }
}

