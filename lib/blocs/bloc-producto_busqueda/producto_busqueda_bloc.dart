// Delfin API
// BLoC de ProductoBusquedas

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pyd_eber/all-exports.dart';

class BlocProductoBusqueda extends Bloc<ProductoBusquedaEvento, ProductoBusquedaEstado> {

  ProcesosBlocProductoBusqueda productoBusquedaProcesosBloc;

  @override
  ProductoBusquedaEstado get initialState {
    productoBusquedaProcesosBloc = ProcesosBlocProductoBusqueda(this);
    productoBusquedaProcesosBloc.inicializarProductoBusqueda();
    return EstadoInicialProductoBusqueda(ResultadoProceso(
      codigo: 999,
      mensaje: 'ProductoBusquedas sin Inicializar.'
    ));
  } 

//  @override
//  Stream<Transition<ProductoBusquedaEvento, ProductoBusquedaEstado>> transformEvents(
//    Stream<ProductoBusquedaEvento> events,
//    TransitionFunction<ProductoBusquedaEvento, ProductoBusquedaEstado> transitionFn,
//  ) {
//    return super.transformEvents(
//      events.debounceTime(const Duration(milliseconds: 150)),
//      transitionFn,
//    );
//  }

  @override
  Stream<ProductoBusquedaEstado> mapEventToState(
    ProductoBusquedaEvento event,
  ) async* {

    if (event is EventoInicializadoProductoBusqueda) {
      yield EstadoProcesosIniciadosProductoBusqueda(event.resultadoProceso);
    }

    if (event is EventoProcesosIniciadosProductoBusqueda) {
      if ( event.resultadoProceso.error ) {
          yield EstadoErrorEnProcesosProductoBusqueda(event.resultadoProceso);
      } else {
          yield EstadoProcesosIniciadosProductoBusqueda(event.resultadoProceso);
      }
    }

    if (event is EventoErroresEncontradosProductoBusqueda) {
        yield EstadoErrorEnProcesosProductoBusqueda(event.resultadoProceso);
    }

    if (event is EventoProgresandoProductoBusqueda) {
      yield EstadoProgresandoProductoBusqueda(event.resultadoProceso);
    }

    if (event is EventoProcesosTerminadosProductoBusqueda) {
      yield EstadoResultadoProcesosTerminadosProductoBusqueda(event.resultadoProceso);
    }
  }
}

