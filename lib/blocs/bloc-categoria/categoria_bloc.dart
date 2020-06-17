// Delfin API
// BLoC de Categorías

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pyd_eber/all-exports.dart';

class BlocCategoria extends Bloc<CategoriaEvento, CategoriaEstado> {

  ProcesosBlocCategoria categoriaProcesosBloc;

  @override
  CategoriaEstado get initialState {
    categoriaProcesosBloc = ProcesosBlocCategoria(this);
    categoriaProcesosBloc.inicializarCategoria();
    return EstadoInicialCategoria(ResultadoProceso(
      codigo: 999,
      mensaje: 'Categorías sin Inicializar.'
    ));
  } 

//  @override
//  Stream<Transition<CategoriaEvento, CategoriaEstado>> transformEvents(
//    Stream<CategoriaEvento> events,
//    TransitionFunction<CategoriaEvento, CategoriaEstado> transitionFn,
//  ) {
//    return super.transformEvents(
//      events.debounceTime(const Duration(milliseconds: 150)),
//      transitionFn,
//    );
//  }

  @override
  Stream<CategoriaEstado> mapEventToState(
    CategoriaEvento event,
  ) async* {

    if (event is EventoInicializadoCategoria) {
      yield EstadoProcesosIniciadosCategoria(event.resultadoProceso);
    }

    if (event is EventoProcesosIniciadosCategoria) {
      if ( event.resultadoProceso.error ) {
          yield EstadoErrorEnProcesosCategoria(event.resultadoProceso);
      } else {
          yield EstadoProcesosIniciadosCategoria(event.resultadoProceso);
      }
    }

    if (event is EventoErroresEncontradosCategoria) {
        yield EstadoErrorEnProcesosCategoria(event.resultadoProceso);
    }

    if (event is EventoProgresandoCategoria) {
      yield EstadoProgresandoCategoria(event.resultadoProceso);
    }

    if (event is EventoProcesosTerminadosCategoria) {
      yield EstadoResultadoProcesosTerminadosCategoria(event.resultadoProceso);
    }
  }
}

