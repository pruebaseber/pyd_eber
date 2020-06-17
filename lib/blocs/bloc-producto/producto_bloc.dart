// Delfin API
// BLoC de Productos

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pyd_eber/all-exports.dart';

class BlocProducto extends Bloc<ProductoEvento, ProductoEstado> {

  ProcesosBlocProducto productoProcesosBloc;

  @override
  ProductoEstado get initialState {
    productoProcesosBloc = ProcesosBlocProducto(this);
    productoProcesosBloc.inicializarProducto();
    return EstadoInicialProducto(ResultadoProceso(
      codigo: 999,
      mensaje: 'Productos sin Inicializar.'
    ));
  } 

//  @override
//  Stream<Transition<ProductoEvento, ProductoEstado>> transformEvents(
//    Stream<ProductoEvento> events,
//    TransitionFunction<ProductoEvento, ProductoEstado> transitionFn,
//  ) {
//    return super.transformEvents(
//      events.debounceTime(const Duration(milliseconds: 150)),
//      transitionFn,
//    );
//  }

  @override
  Stream<ProductoEstado> mapEventToState(
    ProductoEvento event,
  ) async* {

    if (event is EventoInicializadoProducto) {
      yield EstadoProcesosIniciadosProducto(event.resultadoProceso);
    }

    if (event is EventoProcesosIniciadosProducto) {
      if ( event.resultadoProceso.error ) {
          yield EstadoErrorEnProcesosProducto(event.resultadoProceso);
      } else {
          yield EstadoProcesosIniciadosProducto(event.resultadoProceso);
      }
    }

    if (event is EventoErroresEncontradosProducto) {
        yield EstadoErrorEnProcesosProducto(event.resultadoProceso);
    }

    if (event is EventoProgresandoProducto) {
      yield EstadoProgresandoProducto(event.resultadoProceso);
    }

    if (event is EventoProcesosTerminadosProducto) {
      yield EstadoResultadoProcesosTerminadosProducto(event.resultadoProceso);
    }
  }
}

