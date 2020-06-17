// Delfin API
// BLoC de Sub Categorías

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pyd_eber/all-exports.dart';

class BlocSubCategoria extends Bloc<SubCategoriaEvento, SubCategoriaEstado> {

  ProcesosBlocSubCategoria subCategoriaProcesosBloc;

  @override
  SubCategoriaEstado get initialState {
    subCategoriaProcesosBloc = ProcesosBlocSubCategoria(this);
    subCategoriaProcesosBloc.inicializarSubCategoria();
    return EstadoInicialSubCategoria(ResultadoProceso(
      codigo: 999,
      mensaje: 'Sub Categorías sin Inicializar.'
    ));
  } 

//  @override
//  Stream<Transition<SubCategoriaEvento, SubCategoriaEstado>> transformEvents(
//    Stream<SubCategoriaEvento> events,
//    TransitionFunction<SubCategoriaEvento, SubCategoriaEstado> transitionFn,
//  ) {
//    return super.transformEvents(
//      events.debounceTime(const Duration(milliseconds: 150)),
//      transitionFn,
//    );
//  }

  @override
  Stream<SubCategoriaEstado> mapEventToState(
    SubCategoriaEvento event,
  ) async* {

    if (event is EventoInicializadoSubCategoria) {
      yield EstadoProcesosIniciadosSubCategoria(event.resultadoProceso);
    }

    if (event is EventoProcesosIniciadosSubCategoria) {
      if ( event.resultadoProceso.error ) {
          yield EstadoErrorEnProcesosSubCategoria(event.resultadoProceso);
      } else {
          yield EstadoProcesosIniciadosSubCategoria(event.resultadoProceso);
      }
    }

    if (event is EventoErroresEncontradosSubCategoria) {
        yield EstadoErrorEnProcesosSubCategoria(event.resultadoProceso);
    }

    if (event is EventoProgresandoSubCategoria) {
      yield EstadoProgresandoSubCategoria(event.resultadoProceso);
    }

    if (event is EventoProcesosTerminadosSubCategoria) {
      yield EstadoResultadoProcesosTerminadosSubCategoria(event.resultadoProceso);
    }
  }
}

